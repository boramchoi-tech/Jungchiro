package com.jungchiro.poli.chat.model.biz;

import java.util.List;

import com.jungchiro.poli.chat.model.dto.ChatDto;

public interface ChatListBiz {
	
	public int totalCount();
	public List<ChatDto> selectChatList();
	public List<ChatDto> selectChatList(int member_seq);

}
