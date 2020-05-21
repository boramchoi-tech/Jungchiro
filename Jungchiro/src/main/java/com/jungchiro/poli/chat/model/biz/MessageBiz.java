package com.jungchiro.poli.chat.model.biz;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.jungchiro.poli.chat.model.dto.MessageDto;

public interface MessageBiz {
	
	public List<MessageDto> selectAll(int chat_seq);
	
	public int insertMessages(List<HashMap<String, String>> insertMessageList);

}
