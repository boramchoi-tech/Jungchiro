package com.jungchiro.poli.chat.model.biz;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
	public int insertMessages(List<HashMap<String, String>> insertMessageList)  {
		
		for (int i = 0; i < insertMessageList.size() ; i++) {
			String seq = insertMessageList.get(i).get("chat_seq");
			int chat_seq = Integer.parseInt(seq);
			String message_id = insertMessageList.get(i).get("message_id");
			
			String time = insertMessageList.get(i).get("message_time");
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date message_time = null;
			
			try {
				message_time = transFormat.parse(time);
				System.out.println("message_time" + message_time);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			String message_content = insertMessageList.get(i).get("message_content");
			
		}
		
		return 0;
	}

		
	/*
	 *
	 * String time = messageList.get(i).get("message_time"); SimpleDateFormat
	 * transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); Date message_time
	 * = transFormat.parse(time);
	 * 
	 * String message_content = messageList.get(i).get("message_content");
	 * 
	 * 
	 * //MessageDto messageDto = new MessageDto(chat_seq, message_id, message_time,
	 * message_content);
	 * 
	 * 
	 * }
	 * 
	 * }
	 */
			 
		
		

}
