package com.jungchiro.poli.reply.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.reply.model.dao.ReplyDao;
import com.jungchiro.poli.reply.model.dto.ReplyDto;

@Service
public class ReplyBizImpl implements ReplyBiz {
	
	@Autowired
	private ReplyDao dao;

	@Override
	public List<ReplyDto> replyList(int board_seq) {
		// TODO Auto-generated method stub
		return dao.replyList(board_seq);
	}

	@Override
	public int replyInsert(ReplyDto reply) {
		// TODO Auto-generated method stub
		return dao.replyInsert(reply);
	}

	@Override
	public int replyUpdate(ReplyDto reply) {
		// TODO Auto-generated method stub
		return dao.replyUpdate(reply);
	}

	@Override
	public int replyDelete(int reply_seq) {
		// TODO Auto-generated method stub
		return dao.replyDelete(reply_seq);
	}

}
