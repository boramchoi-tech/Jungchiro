package com.jungchiro.poli.chat.model.dao;

public interface EnterChatDao {
	
	String NAMESPACE = "chat.";
	
	public int enterRoomChk(int member_seq, int chat_seq);
	
	public int insertChatMember(int member_seq, int chat_seq);

}
