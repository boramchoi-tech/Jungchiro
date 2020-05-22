package com.jungchiro.poli.chat.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.chat.model.dto.MessageDto;

@Repository
public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MessageDto> selectAll(int chat_seq) {
		List<MessageDto> chatMessage = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("chat_seq", chat_seq);
		
		chatMessage = sqlSession.selectList(NAMESPACE + "selectAll", map);
		
		return chatMessage;
	}
	
	@Override
	public Integer batchInsert(List<MessageDto> insertList) {
		Integer res = sqlSession.insert(NAMESPACE + "batchInsert", insertList);
		System.out.println(res);
		return res;
	}
	
}
