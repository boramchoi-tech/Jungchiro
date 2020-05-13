package com.jungchiro.poli.mypage.model.dto;

// 마이페이지 의안 즐겨찾기
public class BillFavDto {
	
	// 의안 즐겨찾기
	private int member_seq;
	private String bill_id;
	private int bill_fav_seq;
	private String bill_fav_check;
	
	// 의안
	private String bill_title;
	private String bill_no;
	
	public BillFavDto() {
	}
	
	public BillFavDto(int member_seq, String bill_id, int bill_fav_seq, String bill_fav_check, String bill_title,
			String bill_no) {
		this.member_seq = member_seq;
		this.bill_id = bill_id;
		this.bill_fav_seq = bill_fav_seq;
		this.bill_fav_check = bill_fav_check;
		this.bill_title = bill_title;
		this.bill_no = bill_no;
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
	public int getBill_fav_seq() {
		return bill_fav_seq;
	}
	public void setBill_fav_seq(int bill_fav_seq) {
		this.bill_fav_seq = bill_fav_seq;
	}
	public String getBill_fav_check() {
		return bill_fav_check;
	}
	public void setBill_fav_check(String bill_fav_check) {
		this.bill_fav_check = bill_fav_check;
	}
	public String getBill_title() {
		return bill_title;
	}
	public void setBill_title(String bill_title) {
		this.bill_title = bill_title;
	}
	public String getBill_no() {
		return bill_no;
	}
	public void setBill_no(String bill_no) {
		this.bill_no = bill_no;
	}
	
	@Override
	public String toString() {
		return "BillFavDto [member_seq=" + member_seq + ", bill_id=" + bill_id + ", bill_fav_seq=" + bill_fav_seq
				+ ", bill_fav_check=" + bill_fav_check + ", bill_title=" + bill_title + ", bill_no=" + bill_no + "]";
	}
	
	

}
