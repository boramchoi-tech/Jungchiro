package com.jungchiro.poli.map.model.dto;


import org.springframework.data.annotation.Id;


public class PollsDto {

	@Id
	private String id;
	
	private String pollname;
	private String name;
	private String addr;
	private Location location;
	
	public PollsDto() {
		// TODO Auto-generated constructor stub
	}

	
	public PollsDto(String id, String pollname, String name, String addr, Location location) {
		super();
		this.id = id;
		this.pollname = pollname;
		this.name = name;
		this.addr = addr;
		this.location = location;
	}




	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPollname() {
		return pollname;
	}
	public void setPollname(String pollname) {
		this.pollname = pollname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}


	public Location getLocation() {
		return location;
	}


	public void setLocation(Location location) {
		this.location = location;
	}


	@Override
	public String toString() {
		return "PollsDto [id=" + id + ", pollname=" + pollname + ", name=" + name + ", addr=" + addr + ", location="
				+ location + "]";
	}
	
	
	
	
	
	
}
