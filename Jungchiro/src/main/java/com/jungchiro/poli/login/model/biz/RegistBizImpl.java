package com.jungchiro.poli.login.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.login.model.dao.RegistDao;
import com.jungchiro.poli.login.model.dto.LoginDto;

@Service
public class RegistBizImpl implements RegistBiz {
	
	@Autowired
	private RegistDao dao;
	
	@Override
	public int regist(LoginDto dto) {
		return dao.regist(dto);
	}
	
	@Override
	public int idChk(String member_id) {
		return dao.idChk(member_id);
	}

	@Override
	public int emailChk(String member_email) {
		return dao.emailChk(member_email);
	}

}
