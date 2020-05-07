package com.jungchiro.poli.login.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.login.model.dto.LoginDto;

@Repository
public class RegistDaoImpl implements RegistDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int regist(LoginDto dto) {
		int res = sqlSession.insert(NAMESPACE + "registRes", dto);
		
		return res;
	}
	
	@Override
	public int idChk(String member_id) {
		int res = 0; 
		res = sqlSession.selectOne(NAMESPACE + "idCheck", member_id);
		
		return res;
	}

	@Override
	public int emailChk(String member_email) {
		int res = 0; 
		res = sqlSession.selectOne(NAMESPACE + "emailCheck", member_email);
		
		return res;
	}

}
