package com.jungchiro.poli.chat.model.dto;

import java.util.Date;

public class ChatDto {
	
	private int chat_seq;
	private String chat_name;
	private String chat_category;
	private Date chat_makeday;

	private int member_seq;
	private Date member_chat_outtime;

	public ChatDto() {}
	
	public ChatDto(int member_seq) {
		this.member_seq = member_seq;
	}
	
	public ChatDto(int member_seq, int chat_seq) {
		this.member_seq = member_seq;
		this.chat_seq = chat_seq;
	}
	
	public ChatDto(String chat_name, String chat_category) {
		this.chat_name = chat_name;
		this.chat_category = chat_category;
	}

	public ChatDto(int chat_seq, String chat_name, String chat_category, Date chat_makeday) {
		this.chat_seq = chat_seq;
		this.chat_name = chat_name;
		this.chat_category = chat_category;
		this.chat_makeday = chat_makeday;
	}
	
	public ChatDto(int chat_seq, String chat_name, String chat_category, Date chat_makeday, int member_seq,
			Date member_chat_outtime) {
		super();
		this.chat_seq = chat_seq;
		this.chat_name = chat_name;
		this.chat_category = chat_category;
		this.chat_makeday = chat_makeday;
		this.member_seq = member_seq;
		this.member_chat_outtime = member_chat_outtime;
	}

	public int getChat_seq() {
		return chat_seq;
	}

	public void setChat_seq(int chat_seq) {
		this.chat_seq = chat_seq;
	}

	public String getChat_name() {
		return chat_name;
	}

	public void setChat_name(String chat_name) {
		this.chat_name = chat_name;
	}

	public String getChat_category() {
		return chat_category;
	}

	public void setChat_category(String chat_category) {
		this.chat_category = chat_category;
	}

	public Date getChat_makeday() {
		return chat_makeday;
	}

	public void setChat_makeday(Date chat_makeday) {
		this.chat_makeday = chat_makeday;
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public Date getMember_chat_outtime() {
		return member_chat_outtime;
	}

	public void setMember_chat_outtime(Date member_chat_outtime) {
		this.member_chat_outtime = member_chat_outtime;
	}
	
	
	
	
}
