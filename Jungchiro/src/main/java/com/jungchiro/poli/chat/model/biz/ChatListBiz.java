package com.jungchiro.poli.chat.model.biz;

import java.util.List;

import com.jungchiro.poli.chat.model.dto.ChatDto;

public interface ChatListBiz {
	
	public List<ChatDto> selectChatList();
	public List<ChatDto> myChatList(int member_seq);

}
