package com.jungchiro.poli.login.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.login.model.dto.CustomUserDetails;

@Repository("userAuthDAO")
public class UserAuthDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CustomUserDetails getUserById(String username) {
		return sqlSession.selectOne("loginDto.selectUserById", username);
	}
}
