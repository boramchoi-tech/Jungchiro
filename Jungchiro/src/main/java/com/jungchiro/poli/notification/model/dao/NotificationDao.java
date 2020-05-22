package com.jungchiro.poli.notification.model.dao;

public interface NotificationDao {
	
	String NAMESPACE = "NotificationDto.";
	
	public int getNotification(int member_seq);
	// public int isReply(int member_seq);
}
