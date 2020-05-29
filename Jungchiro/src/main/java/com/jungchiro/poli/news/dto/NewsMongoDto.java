package com.jungchiro.poli.news.dto;

import org.springframework.data.annotation.Id;

public class NewsMongoDto {
	
	@Id
	private String id;
	private String title;
	private String content;
	private String url;
    private String date;
    private String img;
	private String type;
	
	public NewsMongoDto() {
	}
	public NewsMongoDto(String id, String title, String content, String url, String date, String img, String type) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.url = url;
		this.date = date;
		this.img = img;
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}