package com.jungchiro.poli.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.chat.model.dto.ChatDto;

@Repository
public class ChatListDaoImpl implements ChatListDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ChatDto selectChatList(int member_seq) {
		
		// TODO Auto-generated method stub
		return null;
	}

}
