package com.jungchiro.poli.chat.model.dao;

import java.util.List;

import com.jungchiro.poli.chat.model.dto.ChatDto;

public interface ChatListDao {
	
	String NAMESPACE = "chat.";
	
	public List<ChatDto> selectChatList();
	public List<ChatDto> myChatList(int member_seq);

}
