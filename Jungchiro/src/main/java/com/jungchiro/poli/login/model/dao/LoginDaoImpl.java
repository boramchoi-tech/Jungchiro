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

		LoginDto login = new LoginDto();

		try {
			login = sqlSession.selectOne(NAMESPACE + "login", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return login;
	}

	@Override
	public LoginDto insertMember(LoginDto dto) {
		return null;
	}

	@Override
	public int updatePassword(LoginDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "updatePassword", dto);
		} catch (Exception e) {
			System.out.println("[error] : 비밀번호 수정 에러(dao)");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int dropId(LoginDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"dropId", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
		
	}
	
	

}
