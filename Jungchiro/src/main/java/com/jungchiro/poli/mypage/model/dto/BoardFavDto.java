package com.jungchiro.poli.mypage.model.dto;

import java.sql.Date;

// 마이페이지 게시판 즐겨찾기
public class BoardFavDto {
	
	// 게시판 즐겨찾기
	private int member_seq;
	private int board_seq;
	private int board_fav_seq;
	private String board_fav_check;
	private Date board_fav_date;
	
	// 게시판
	private String board_title;
	private Date board_date;
	
	public BoardFavDto() {
	}
	
	public BoardFavDto(int member_seq, int board_seq, int board_fav_seq, String board_fav_check, Date board_fav_date,
			String board_title, Date board_date) {
		this.member_seq = member_seq;
		this.board_seq = board_seq;
		this.board_fav_seq = board_fav_seq;
		this.board_fav_check = board_fav_check;
		this.board_fav_date = board_fav_date;
		this.board_title = board_title;
		this.board_date = board_date;
	}
	
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public int getBoard_fav_seq() {
		return board_fav_seq;
	}
	public void setBoard_fav_seq(int board_fav_seq) {
		this.board_fav_seq = board_fav_seq;
	}
	public String getBoard_fav_check() {
		return board_fav_check;
	}
	public void setBoard_fav_check(String board_fav_check) {
		this.board_fav_check = board_fav_check;
	}
	public Date getBoard_fav_date() {
		return board_fav_date;
	}
	public void setBoard_fav_date(Date board_fav_date) {
		this.board_fav_date = board_fav_date;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

}
