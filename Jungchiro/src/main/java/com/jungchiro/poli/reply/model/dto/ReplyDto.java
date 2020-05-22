package com.jungchiro.poli.reply.model.dto;

import java.sql.Date;

public class ReplyDto {
	
	private int reply_seq;
	private int board_seq;
	private int member_seq;
	private String reply_content;
	private Date reply_date;
	private String reply_isread;
	private String member_id;

	public ReplyDto() {
		
	}


	public ReplyDto(int reply_seq, int board_seq, int member_seq, String reply_content, Date reply_date, String reply_isread, String member_id) {
		super();
		this.reply_seq = reply_seq;
		this.board_seq = board_seq;
		this.member_seq = member_seq;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.reply_isread = reply_isread;
		this.member_id = member_id;
	}


	public int getReply_seq() {
		return reply_seq;
	}


	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
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


	public String getReply_content() {
		return reply_content;
	}


	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}


	public Date getReply_date() {
		return reply_date;
	}


	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}


	public String getReply_isread() {
		return reply_isread;
	}


	public void setReply_isread(String reply_isread) {
		this.reply_isread = reply_isread;
	}

	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	

}
