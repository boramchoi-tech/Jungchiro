package com.jungchiro.poli.login.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.login.model.dto.LoginDto;

@Repository
public class LoginDaoImpl implements LoginDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public LoginDto selectMember(LoginDto dto) {
		
		LoginDto loginDto = new LoginDto();
		try {
			loginDto = sqlSession.selectOne(NAMESPACE + "login", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return loginDto;
	}

	@Override
	public LoginDto insertMember(LoginDto dto) {
		return null;
	}

}
