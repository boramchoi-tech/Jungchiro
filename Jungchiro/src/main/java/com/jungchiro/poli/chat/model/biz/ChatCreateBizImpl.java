package com.jungchiro.poli.chat.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.chat.model.dao.ChatCreateDao;
import com.jungchiro.poli.chat.model.dto.ChatDto;

@Service
public class ChatCreateBizImpl implements ChatCreateBiz {

	@Autowired
	private ChatCreateDao dao;
	
	@Override
	public int createRoom(ChatDto dto) {
		return dao.createRoom(dto);
	}

}
