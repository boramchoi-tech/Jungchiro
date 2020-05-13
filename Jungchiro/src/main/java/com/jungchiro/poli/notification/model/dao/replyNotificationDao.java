package com.jungchiro.poli.notification.model.dao;

import java.util.List;

import com.jungchiro.poli.notification.model.dto.NotificationDto;

public interface replyNotificationDao {

	String NAMESPACE = "notification.";
	
	public List<NotificationDto> unreadBoardList(int member_seq);
	public int countReplyNotification	(int member_seq);
	public int updateNotificationRead(int board_seq);
	
}
