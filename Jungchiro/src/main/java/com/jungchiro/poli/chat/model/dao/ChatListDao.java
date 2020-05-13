package com.jungchiro.poli.chat.model.dao;

import java.util.List;

import com.jungchiro.poli.chat.model.dto.ChatDto;

public interface ChatListDao {
	
	String NAMESPACE = "chat.";
	
	public int totalCount();
	public int totalCount(int member_seq);
	public List<ChatDto> selectChatList();
	public List<ChatDto> selectChatList(int member_seq);

}
