package com.jungchiro.poli.board.model.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMakeDto {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private PagingDto paging;

	public void setPaging(PagingDto paging) {
		this.paging = paging;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public PagingDto getPaging() {
		return paging;
	}

	private void calcData() {
		endPage = (int) (Math.ceil(paging.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) paging.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * paging.getPerPageNum() >= totalCount ? false : true;
	}

	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", paging.getPerPageNum()).build();

		return uriComponents.toUriString();
	}

	public String makeSearch(int page) {
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
		.queryParam("page", page)
		.queryParam("perPageNum", paging.getPerPageNum())
		.queryParam("searchType",((SearchDto)paging).getSearchType())
		.queryParam("keyword", encoding(((SearchDto)paging).getKeyword()))
		.build();

		return uriComponents.toUriString();
		
	}
	
	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) { 
			return "";
		}
		 
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(UnsupportedEncodingException e) { 
			return ""; 
		}
	}

}
