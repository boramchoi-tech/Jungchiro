package com.jungchiro.poli.notification.model.dto;

import java.sql.Date;

public class NotificationDto {
	
	private int member_seq;
	private int board_seq;
	private int reply_seq;
	private Date reply_date;
	private String reply_content;
	private String reply_isread;
	private Date board_date;
	
	public NotificationDto() {

	}
	
	public NotificationDto(int member_seq, int board_seq, int reply_seq, Date reply_date, String reply_content,
			String reply_isread, Date board_date) {
		super();
		this.member_seq = member_seq;
		this.board_seq = board_seq;
		this.reply_seq = reply_seq;
		this.reply_date = reply_date;
		this.reply_content = reply_content;
		this.reply_isread = reply_isread;
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
	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_isread() {
		return reply_isread;
	}
	public void setReply_isread(String reply_isread) {
		this.reply_isread = reply_isread;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	
	@Override
	public String toString() {
		return "NotificationDto [member_seq=" + member_seq + ", board_seq=" + board_seq + ", reply_seq=" + reply_seq
				+ ", reply_date=" + reply_date + ", reply_content=" + reply_content + ", reply_isread=" + reply_isread
				+ ", board_date=" + board_date + "]";
	}
	
	

}
