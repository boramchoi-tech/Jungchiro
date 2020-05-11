package com.jungchiro.poli.chat.model.dao;

import com.jungchiro.poli.chat.model.dto.ChatDto;

public interface ChatCreateDao {
	
	String NAMESPACE = "chat.";
	
	public int createRoom(ChatDto dto);

}
