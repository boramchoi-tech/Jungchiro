package com.jungchiro.poli.chat.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.chat.model.dao.ChatListDao;
import com.jungchiro.poli.chat.model.dto.ChatDto;

@Service
public class ChatListBizImpl implements ChatListBiz {
	
	@Autowired
	private ChatListDao dao;

	@Override
	public List<ChatDto> selectChatList() {
		return dao.selectChatList();
	}
	
	@Override
	public List<ChatDto> myChatList(int member_seq) {
		return dao.myChatList(member_seq);
	}

}
