package com.jungchiro.poli.mypage.model.dto;

import java.util.Date;

public class BillFavDto {

	// 의안 즐겨찾기
	private int member_seq;
	private String bill_id;
	private String bill_fav_seq;
	private String bill_fav_check;
	private Date bill_fav_date;
	
	// 의안
	private int bill_no;
	private String bill_name;
	private Date bill_proc;
	private String bill_kind;
	private String bill_general;
	private String bill_summary;
	
	public BillFavDto() {

	}

	public BillFavDto(int member_seq, String bill_id, String bill_fav_seq, String bill_fav_check, Date bill_fav_date,
			int bill_no, String bill_name, Date bill_proc, String bill_kind, String bill_general, String bill_summary) {
		this.member_seq = member_seq;
		this.bill_id = bill_id;
		this.bill_fav_seq = bill_fav_seq;
		this.bill_fav_check = bill_fav_check;
		this.bill_fav_date = bill_fav_date;
		this.bill_no = bill_no;
		this.bill_name = bill_name;
		this.bill_proc = bill_proc;
		this.bill_kind = bill_kind;
		this.bill_general = bill_general;
		this.bill_summary = bill_summary;
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public String getBill_id() {
		return bill_id;
	}

	public void setBill_id(String bill_id) {
		this.bill_id = bill_id;
	}

	public String getBill_fav_seq() {
		return bill_fav_seq;
	}

	public void setBill_fav_seq(String bill_fav_seq) {
		this.bill_fav_seq = bill_fav_seq;
	}

	public String getBill_fav_check() {
		return bill_fav_check;
	}

	public void setBill_fav_check(String bill_fav_check) {
		this.bill_fav_check = bill_fav_check;
	}

	public Date getBill_fav_date() {
		return bill_fav_date;
	}

	public void setBill_fav_date(Date bill_fav_date) {
		this.bill_fav_date = bill_fav_date;
	}

	public int getBill_no() {
		return bill_no;
	}

	public void setBill_no(int bill_no) {
		this.bill_no = bill_no;
	}

	public String getBill_name() {
		return bill_name;
	}

	public void setBill_name(String bill_name) {
		this.bill_name = bill_name;
	}

	public Date getBill_proc() {
		return bill_proc;
	}

	public void setBill_proc(Date bill_proc) {
		this.bill_proc = bill_proc;
	}

	public String getBill_kind() {
		return bill_kind;
	}

	public void setBill_kind(String bill_kind) {
		this.bill_kind = bill_kind;
	}

	public String getBill_general() {
		return bill_general;
	}

	public void setBill_general(String bill_general) {
		this.bill_general = bill_general;
	}

	public String getBill_summary() {
		return bill_summary;
	}

	public void setBill_summary(String bill_summary) {
		this.bill_summary = bill_summary;
	}

	@Override
	public String toString() {
		return "BillFavDto [member_seq=" + member_seq + ", bill_id=" + bill_id + ", bill_fav_seq=" + bill_fav_seq
				+ ", bill_fav_check=" + bill_fav_check + ", bill_fav_date=" + bill_fav_date + ", bill_no=" + bill_no
				+ ", bill_name=" + bill_name + ", bill_proc=" + bill_proc + ", bill_kind=" + bill_kind
				+ ", bill_general=" + bill_general + ", bill_summary=" + bill_summary + "]";
	}

	
	
	
}
