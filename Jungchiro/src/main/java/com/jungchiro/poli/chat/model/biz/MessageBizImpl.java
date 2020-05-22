package com.jungchiro.poli.chat.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.chat.model.dao.MessageDao;
import com.jungchiro.poli.chat.model.dto.MessageDto;

@Service
public class MessageBizImpl implements MessageBiz {
	
	@Autowired
	private MessageDao messageDao;
	
	@Override
	public List<MessageDto> selectAll(int chat_seq) {
		return messageDao.selectAll(chat_seq);
	}
	
	@Override
	public Integer batchInsert(List<MessageDto> insertList) {
		Integer res = 0;
		res = messageDao.batchInsert(insertList);

		return res;
	}

	 
		
		

}
