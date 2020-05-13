package com.jungchiro.poli.notification.model.dto;

import java.util.Date;

public class NotificationDto {

	private int reply_seq;
	private int board_seq;
	private int member_seq;
	private String board_title;
	private String isread;
	private Date reply_date;
	
	public NotificationDto() {
	}
	
	public NotificationDto(int reply_seq, int board_seq, int member_seq, String board_title, String isread,
			Date reply_date) {
		this.reply_seq = reply_seq;
		this.board_seq = board_seq;
		this.member_seq = member_seq;
		this.board_title = board_title;
		this.isread = isread;
		this.reply_date = reply_date;
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
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getIsread() {
		return isread;
	}
	public void setIsread(String isread) {
		this.isread = isread;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
	@Override
	public String toString() {
		return "NotificationDto [reply_seq=" + reply_seq + ", board_seq=" + board_seq + ", member_seq=" + member_seq
				+ ", board_title=" + board_title + ", isread=" + isread + ", reply_date=" + reply_date + "]";
	}
	
	
}
