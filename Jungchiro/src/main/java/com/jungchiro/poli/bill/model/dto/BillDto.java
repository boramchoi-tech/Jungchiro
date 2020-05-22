package com.jungchiro.poli.bill.model.dto;

import java.sql.Date;

public class BillDto {
	
	private int bill_number;
	private int bill_seq;
	private String bill_type;
	private String bill_name;
	private String bill_proposer;
	private Date propose_date;
	private Date decide_date;
	private String decide_result;
	private String bill_content;
	private String content_address;
	private String bill_status;
	
	public BillDto() {
		super();
	}

	public BillDto(int bill_number, int bill_seq, String bill_type, String bill_name, String bill_proposer,
			Date propose_date, Date decide_date, String decide_result, String bill_content, String content_address,
			String bill_status) {
		super();
		this.bill_number = bill_number;
		this.bill_seq = bill_seq;
		this.bill_type = bill_type;
		this.bill_name = bill_name;
		this.bill_proposer = bill_proposer;
		this.propose_date = propose_date;
		this.decide_date = decide_date;
		this.decide_result = decide_result;
		this.bill_content = bill_content;
		this.content_address = content_address;
		this.bill_status = bill_status;
	}

	public int getBill_number() {
		return bill_number;
	}

	public void setBill_number(int bill_number) {
		this.bill_number = bill_number;
	}

	public int getBill_seq() {
		return bill_seq;
	}

	public void setBill_seq(int bill_seq) {
		this.bill_seq = bill_seq;
	}

	public String getBill_type() {
		return bill_type;
	}

	public void setBill_type(String bill_type) {
		this.bill_type = bill_type;
	}

	public String getBill_name() {
		return bill_name;
	}

	public void setBill_name(String bill_name) {
		this.bill_name = bill_name;
	}

	public String getBill_proposer() {
		return bill_proposer;
	}

	public void setBill_proposer(String bill_proposer) {
		this.bill_proposer = bill_proposer;
	}

	public Date getPropose_date() {
		return propose_date;
	}

	public void setPropose_date(Date propose_date) {
		this.propose_date = propose_date;
	}

	public Date getDecide_date() {
		return decide_date;
	}

	public void setDecide_date(Date decide_date) {
		this.decide_date = decide_date;
	}

	public String getDecide_result() {
		return decide_result;
	}

	public void setDecide_result(String decide_result) {
		this.decide_result = decide_result;
	}

	public String getBill_content() {
		return bill_content;
	}

	public void setBill_content(String bill_content) {
		this.bill_content = bill_content;
	}

	public String getContent_address() {
		return content_address;
	}

	public void setContent_address(String content_address) {
		this.content_address = content_address;
	}

	public String getBill_status() {
		return bill_status;
	}

	public void setBill_status(String bill_status) {
		this.bill_status = bill_status;
	}

	
	
	
}


