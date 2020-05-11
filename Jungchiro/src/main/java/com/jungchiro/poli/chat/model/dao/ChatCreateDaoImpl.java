package com.jungchiro.poli.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.chat.model.dto.ChatDto;

@Repository
public class ChatCreateDaoImpl implements ChatCreateDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int createRoom(ChatDto dto) {
		ChatDto chatDto = new ChatDto(dto.getChat_name(), dto.getChat_category());
		sqlSession.insert(NAMESPACE + "createRoom", chatDto);

		//만든 채팅방 번호 보내기
		return chatDto.getChat_seq();
	}
	
	@Override
	public int createChatList(int member_seq, int chat_seq) {
		ChatDto createChatDto = new ChatDto(member_seq, chat_seq);
		int res = sqlSession.insert(NAMESPACE + "insertChatList", createChatDto);
		
		//MEMBER_CHAT DB에 insert한 결과
		return res;
	}

}
