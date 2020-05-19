package com.jungchiro.poli.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.chat.model.dto.ChatDto;

@Repository
public class EnterChatDaoImpl implements EnterChatDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int enterRoomChk(int member_seq, int chat_seq) {
		ChatDto dto = new ChatDto(member_seq, chat_seq);
		int res = sqlSession.selectOne(NAMESPACE+"enterRoomChk", dto);
		
		return res;
	}
	
	@Override
	public int insertChatMember(int member_seq, int chat_seq) {
		ChatDto dto = new ChatDto(member_seq, chat_seq);
		int res = sqlSession.insert(NAMESPACE+"insertChatMember", dto);

		return res;
	}
	
	@Override
	public ChatDto enterInfo(int member_seq, int chat_seq) {
		ChatDto dto = new ChatDto(member_seq, chat_seq);
		ChatDto enterInfo = sqlSession.selectOne(NAMESPACE+"enterInfo", dto);
		
		return enterInfo;
	}

}
