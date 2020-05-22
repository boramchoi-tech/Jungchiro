package com.jungchiro.poli.mypage.model.dto;

public class NotificationReplyDto {
	
	private int meber_seq;
	private int board_seq;
	private int reply_seq;
	private String board_title;
	private String reply_content;
	private String reply_isread;
	
	public NotificationReplyDto() {
	}
	
	public NotificationReplyDto(int meber_seq, int board_seq, int reply_seq, String board_title, String reply_content,
			String reply_isread) {
		super();
		this.meber_seq = meber_seq;
		this.board_seq = board_seq;
		this.reply_seq = reply_seq;
		this.board_title = board_title;
		this.reply_content = reply_content;
		this.reply_isread = reply_isread;
	}
	
	public int getMeber_seq() {
		return meber_seq;
	}
	public void setMeber_seq(int meber_seq) {
		this.meber_seq = meber_seq;
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
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
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
	
	@Override
	public String toString() {
		return "NotificationReplyDto [meber_seq=" + meber_seq + ", board_seq=" + board_seq + ", reply_seq=" + reply_seq
				+ ", board_title=" + board_title + ", reply_content=" + reply_content + ", reply_isread=" + reply_isread
				+ "]";
	}
	
	

}
