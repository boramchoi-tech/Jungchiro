package com.jungchiro.poli.chat.model.dao;

import com.jungchiro.poli.chat.model.dto.ChatDto;

public interface EnterChatDao {
	
	String NAMESPACE = "chat.";
	
	public int enterRoomChk(int member_seq, int chat_seq);
	public int insertChatMember(int member_seq, int chat_seq);
	public ChatDto enterInfo(int member_seq, int chat_seq);
	public int exitRoom(int member_seq, int chat_seq);

}
