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
	
	@Override
	public int exitRoom(int member_seq, int chat_seq) {
		ChatDto dto = new ChatDto(member_seq, chat_seq);
		int res = sqlSession.delete(NAMESPACE+"exitRoom", dto);
		
		/*
		int isChk = sqlSession.selectOne(NAMESPACE+"isCount", chat_seq);
		
		if (isChk == 0) {
			System.out.println("채팅방에 남은 인원이 없음");
			int deleteChat = sqlSession.delete(NAMESPACE+"chatRoomDelete", chat_seq);
			System.out.println("chatroomdelete 결과 : " + deleteChat);
		}*/
			
		return res;
	}

}
