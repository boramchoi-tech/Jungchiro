package com.jungchiro.poli.login.model.dto;

public class LoginDto {
	
	private int member_seq;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String member_sns;
	private String member_enable;
	private String member_role;
	
	public LoginDto() {}
	
	public LoginDto(String member_email) {
		this.member_email = member_email;
	}
	
	public LoginDto(String member_id, String member_pw) {
		this.member_id = member_id;
		this.member_pw = member_pw;
	}
	
	public LoginDto(String member_id, String member_pw, String member_name, String member_email) {
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_email = member_email;
	}
	
	public LoginDto(int member_seq, String member_id, String member_pw, String member_name, String member_email,
			String member_sns, String member_enable, String member_role) {
		this.member_seq = member_seq;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_sns = member_sns;
		this.member_enable = member_enable;
		this.member_role = member_role;
	}
	
	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_sns() {
		return member_sns;
	}

	public void setMember_sns(String member_sns) {
		this.member_sns = member_sns;
	}

	public String getMember_enable() {
		return member_enable;
	}

	public void setMember_enable(String member_enable) {
		this.member_enable = member_enable;
	}

	public String getMember_role() {
		return member_role;
	}

	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	
	

}
