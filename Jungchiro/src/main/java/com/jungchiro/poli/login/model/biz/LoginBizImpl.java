package com.jungchiro.poli.login.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.login.model.dao.LoginDao;
import com.jungchiro.poli.login.model.dto.LoginDto;

@Service
public class LoginBizImpl implements LoginBiz {
	
	@Autowired
	private LoginDao dao;

	@Override
	public LoginDto selectMember(LoginDto dto) {
		return dao.selectMember(dto);
	}

	@Override
	public LoginDto insertMember(LoginDto dto) {
		return dao.insertMember(dto);
	}

	@Override
	public int updatePassword(LoginDto dto) {
		return dao.updatePassword(dto);
	}

	@Override
	public int dropId(LoginDto dto) {
		return dao.dropId(dto);
	}
	
	

}
