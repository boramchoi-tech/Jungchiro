package com.jungchiro.poli.chat.model.biz;

import com.jungchiro.poli.chat.model.dto.ChatDto;

public interface ChatListBiz {
	
	public ChatDto selectChatList(int member_seq);

}
