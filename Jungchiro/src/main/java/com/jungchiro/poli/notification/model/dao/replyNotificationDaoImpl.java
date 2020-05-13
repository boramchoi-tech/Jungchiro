package com.jungchiro.poli.notification.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.notification.model.dto.NotificationDto;

@Repository
public class replyNotificationDaoImpl implements replyNotificationDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NotificationDto> unreadBoardList(int member_seq) {
		
		List<NotificationDto> list = new ArrayList();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "unreadBoardList", member_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : unreadBoardList");
		}
		
		return list;
	}

	@Override
	public int countReplyNotification(int member_seq) {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "countReplyNotification", member_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : countReplyNotification");
		}
		
		return res;
	}

	@Override
	public int updateNotificationRead(int board_seq) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "updateNotificationRead", board_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : updateNotificationRead");
		}
		
		return res;
	}

}
