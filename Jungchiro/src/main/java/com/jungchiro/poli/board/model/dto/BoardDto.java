package com.jungchiro.poli.board.model.dto;

import java.sql.Date;

public class BoardDto {
	
	private int board_seq;
	private int member_seq;
	private String board_category;
	private String board_title;
	private String board_content;
	private String board_img1;
	private String board_img2;
	private Date board_date;
	private int board_count;
	
	private String member_name;
	private String member_id;
	
	public BoardDto() {
		
	}
	
	// 게시판 리스트 출력
	public BoardDto(int board_seq, int member_seq, String board_category, String board_title, String board_content,
			String board_img1, String board_img2, Date board_date, int board_count, String member_name, String member_id) {
		super();
		this.board_seq = board_seq;
		this.member_seq = member_seq;
		this.board_category = board_category;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_img1 = board_img1;
		this.board_img2 = board_img2;
		this.board_date = board_date;
		this.board_count = board_count;
		this.member_name = member_name;
	}


	public BoardDto(int board_seq, int member_seq, String board_category, String board_title, String board_content,
			String board_img1, String board_img2, Date board_date, int board_count) {
		super();
		this.board_seq = board_seq;
		this.member_seq = member_seq;
		this.board_category = board_category;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_img1 = board_img1;
		this.board_img2 = board_img2;
		this.board_date = board_date;
		this.board_count = board_count;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_img1() {
		return board_img1;
	}

	public void setBoard_img1(String board_img1) {
		this.board_img1 = board_img1;
	}

	public String getBoard_img2() {
		return board_img2;
	}

	public void setBoard_img2(String board_img2) {
		this.board_img2 = board_img2;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_count() {
		return board_count;
	}

	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name1(String member_name) {
		this.member_name = member_name;
	}
	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
