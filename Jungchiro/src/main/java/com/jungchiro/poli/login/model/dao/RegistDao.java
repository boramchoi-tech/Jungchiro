package com.jungchiro.poli.login.model.dao;

import com.jungchiro.poli.login.model.dto.LoginDto;

public interface RegistDao {
	
	String NAMESPACE = "regist.";
	
	public int regist(LoginDto dto);
	
	public int idChk(String member_id);
	public int emailChk(String member_email);

}
