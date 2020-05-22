package com.jungchiro.poli.chat.model.dao;

import java.util.List;

import com.jungchiro.poli.chat.model.dto.MessageDto;

public interface MessageDao {
	
	String NAMESPACE = "message.";
	
	public List<MessageDto> selectAll(int chat_seq);

	public Integer batchInsert(List<MessageDto> insertList);

}
