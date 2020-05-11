package com.jungchiro.poli.test.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class FileDto {
	
	private String name;
	private String desc;
	private MultipartFile mpfile;
	
	public FileDto() {
	}
	public FileDto(String name, String desc, MultipartFile mpfile) {
		super();
		this.name = name;
		this.desc = desc;
		this.mpfile = mpfile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public MultipartFile getMpfile() {
		return mpfile;
	}
	public void setMpfile(MultipartFile mpfile) {
		this.mpfile = mpfile;
	}
	
	@Override
	public String toString() {
		return "FileDto [name=" + name + ", desc=" + desc + ", mpfile=" + mpfile + "]";
	}
	
	

}
