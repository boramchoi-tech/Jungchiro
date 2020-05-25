package com.jungchiro.poli.mypage.model.dto;

public class BillFavListDto {
	
	private int member_seq;
	private int start;
	private int end;
	
	public BillFavListDto() {
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "BillFavListDto [member_seq=" + member_seq + ", start=" + start + ", end=" + end + "]";
	}

}
