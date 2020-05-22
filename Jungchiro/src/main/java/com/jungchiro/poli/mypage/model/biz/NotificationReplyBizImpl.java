package com.jungchiro.poli.mypage.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.mypage.model.dao.NotificationReplyDao;
import com.jungchiro.poli.mypage.model.dto.NotificationReplyDto;

@Service
public class NotificationReplyBizImpl implements NotificationReplyBiz {
	
	@Autowired
	private NotificationReplyDao dao;

	@Override
	public List<NotificationReplyDto> replyNotificationList(int member_seq) {
		return dao.replyNotificationList(member_seq);
	}

	@Override
	public int changeReplyIsread(int member_seq) {
		return dao.changeReplyIsread(member_seq);
	}

	@Override
	public int changeOneReplyIsread(int board_seq, int member_seq) {
		return dao.changeOneReplyIsread(member_seq, board_seq);
	}

	@Override
	public int changeMultiReplyIsread(String[] board_seq, int member_seq) {
		return dao.changeMultiReplyIsread(board_seq, member_seq);
	}

}
