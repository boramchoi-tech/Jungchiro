package com.jungchiro.poli.login.model.biz;

import com.jungchiro.poli.login.model.dto.LoginDto;

public interface LoginBiz {
	
	public LoginDto selectMember(LoginDto dto);
	public LoginDto insertMember(LoginDto dto);
	public int updatePassword(LoginDto dto);
	public int dropId(LoginDto dto);
	
}
