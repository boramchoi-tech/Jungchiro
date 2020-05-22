package com.jungchiro.poli.mypage.model.biz;

import java.util.List;

import com.jungchiro.poli.mypage.model.dto.NotificationReplyDto;

public interface NotificationReplyBiz {
	
	public List<NotificationReplyDto> replyNotificationList(int member_seq);
	public int changeReplyIsread(int member_seq);
	public int changeOneReplyIsread(int board_seq, int member_seq);	
	public int changeMultiReplyIsread(String[] board_seq, int member_seq);

}
