package com.jungchiro.poli.chat.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.chat.model.dao.EnterChatDao;

@Service
public class EnterChatBizImpl implements EnterChatBiz {
	
	@Autowired
	private EnterChatDao dao;

	@Override
	public int enterRoomChk(int member_seq, int chat_seq) {
		return dao.enterRoomChk(member_seq, chat_seq);
	}
	
	@Override
	public int insertChatMember(int member_seq, int chat_seq) {
		return dao.insertChatMember(member_seq, chat_seq);
	}

}
