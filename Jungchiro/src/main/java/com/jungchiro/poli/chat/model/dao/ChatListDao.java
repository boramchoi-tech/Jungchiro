package com.jungchiro.poli.chat.model.dao;

import com.jungchiro.poli.chat.model.dto.ChatDto;

public interface ChatListDao {
	
	String NAMESPACE = "chatlist.";
	
	public ChatDto selectChatList(int member_seq);

}
