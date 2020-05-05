package com.jungchiro.poli.login.model.dao;

import com.jungchiro.poli.login.model.dto.LoginDto;

public interface LoginDao {
	
	String NAMESPACE = "loginDto.";
	
	public LoginDto selectMember(LoginDto dto);
	
	// 회원가입
	public LoginDto insertMember(LoginDto dto);

}
