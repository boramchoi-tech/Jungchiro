package com.jungchiro.poli.chat.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.chat.model.dao.ChatListDao;
import com.jungchiro.poli.chat.model.dto.ChatDto;

@Service
public class ChatListBizImpl implements ChatListBiz {
	
	@Autowired
	private ChatListDao dao;

	@Override
	public ChatDto selectChatList(int member_seq) {
		return dao.selectChatList(member_seq);
	}

}
