package com.jungchiro.poli.chat.model.biz;

import com.jungchiro.poli.chat.model.dto.ChatDto;

public interface EnterChatBiz {
	
	public int enterRoomChk(int member_seq, int chat_seq);
	public int insertChatMember(int member_seq, int chat_seq);
	public ChatDto enterInfo(int member_seq, int chat_seq);
}
