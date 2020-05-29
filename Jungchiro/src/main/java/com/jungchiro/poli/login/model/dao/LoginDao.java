package com.jungchiro.poli.login.model.dao;

import com.jungchiro.poli.login.model.dto.LoginDto;

public interface LoginDao {
	
	String NAMESPACE = "loginDto.";
	
	public LoginDto selectMember(LoginDto dto);
	
	// 회원가입
	public LoginDto insertMember(LoginDto dto);
	
	// 비밀번호 암호화
	public int updatePassword(LoginDto dto);
	
	// 회원 탈퇴
	public int dropId(LoginDto dto);

}
