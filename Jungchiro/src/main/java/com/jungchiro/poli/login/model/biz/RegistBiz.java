package com.jungchiro.poli.login.model.biz;

import com.jungchiro.poli.login.model.dto.LoginDto;

public interface RegistBiz {
	
	public int regist(LoginDto dto);
	
	public int idChk(String member_id);
	public int emailChk(String member_email);

}
