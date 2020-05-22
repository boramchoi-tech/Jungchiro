package com.jungchiro.poli.reply.model.biz;

import java.util.List;

import com.jungchiro.poli.reply.model.dto.ReplyDto;

public interface ReplyBiz {
	
public List<ReplyDto> replyList(int board_seq);
	
	public int replyInsert(ReplyDto reply);

	public int replyUpdate(ReplyDto reply);

	public int replyDelete(int reply_seq);
	
}
