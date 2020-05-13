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
	public int totalCount() {
		return dao.totalCount();
	}
	
	@Override
	public int totalCount(int member_seq) {
		return dao.totalCount(member_seq);
	}

	@Override
	public List<ChatDto> selectChatList() {
		return dao.selectChatList();
	}
	
	@Override
	public List<ChatDto> selectChatList(int member_seq) {
		return dao.selectChatList(member_seq);
	}

}
