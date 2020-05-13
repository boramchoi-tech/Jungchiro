package com.jungchiro.poli.notification.model.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jungchiro.poli.notification.model.dao.replyNotificationDao;
import com.jungchiro.poli.notification.model.dto.NotificationDto;

@Service
public class replyNotificationBizImpl implements replyNotificationBiz {
	
	private replyNotificationDao dao;

	@Override
	public List<NotificationDto> unreadBoardList(int member_seq) {
		return dao.unreadBoardList(member_seq);
	}

	@Override
	public int countReplyNotification(int member_seq) {
		return dao.countReplyNotification(member_seq);
	}

	@Override
	public int updateNotificationRead(int board_seq) {
		return dao.updateNotificationRead(board_seq);
	}

}
