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
		System.out.println(chatDto.getChat_seq() +"/"+ chatDto.getChat_name() +"/"+ chatDto.getChat_category() +"/"+ chatDto.getChat_makeday());
		
		//만든 채팅방 번호 보내기
		return chatDto.getChat_seq();
	}

}
