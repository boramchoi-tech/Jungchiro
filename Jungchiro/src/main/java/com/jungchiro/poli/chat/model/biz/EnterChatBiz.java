package com.jungchiro.poli.chat.model.biz;

public interface EnterChatBiz {
	
	public int enterRoomChk(int member_seq, int chat_seq);
	public int insertChatMember(int member_seq, int chat_seq);
}
