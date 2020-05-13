package com.jungchiro.poli.chat.model.biz;

import com.jungchiro.poli.chat.model.dto.ChatDto;

public interface ChatCreateBiz {
	
	public int createRoom(ChatDto dto);
	public int createChatList(int member_seq, int chat_seq);

}
