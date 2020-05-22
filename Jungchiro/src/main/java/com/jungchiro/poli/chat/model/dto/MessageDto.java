package com.jungchiro.poli.chat.model.dto;

import java.util.Date;

public class MessageDto {
	
	private int message_seq;
	private int chat_seq;
	private int member_seq;
	private String message_content;
	private Date message_time;
	private int message_report;
	private String chat_name;
	private String member_id;
	
	//message_seq, chat_seq, member_seq, message_content, message_time, message_report, chat_name, member_id
	
	public MessageDto() {}
	
	public MessageDto(int message_seq, int chat_seq, int member_seq, String message_content, Date message_time,
			int message_report, String chat_name, String member_id) {
		super();
		this.message_seq = message_seq;
		this.chat_seq = chat_seq;
		this.member_seq = member_seq;
		this.message_content = message_content;
		this.message_time = message_time;
		this.message_report = message_report;
		this.chat_name = chat_name;
		this.member_id = member_id;
	}
	
	public MessageDto(int chat_seq, int member_seq, Date message_time, String message_content) {
		this.chat_seq = chat_seq;
		this.member_seq = member_seq;
		this.message_time = message_time;
		this.message_content = message_content;
	}

	public int getMessage_seq() {
		return message_seq;
	}

	public void setMessage_seq(int message_seq) {
		this.message_seq = message_seq;
	}

	public int getChat_seq() {
		return chat_seq;
	}

	public void setChat_seq(int chat_seq) {
		this.chat_seq = chat_seq;
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public Date getMessage_time() {
		return message_time;
	}

	public void setMessage_time(Date message_time) {
		this.message_time = message_time;
	}

	public int getMessage_report() {
		return message_report;
	}

	public void setMessage_report(int message_report) {
		this.message_report = message_report;
	}

	public String getChat_name() {
		return chat_name;
	}

	public void setChat_name(String chat_name) {
		this.chat_name = chat_name;
	}



	public String getMember_id() {
		return member_id;
	}



	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	


}
