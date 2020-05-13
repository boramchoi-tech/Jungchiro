package com.jungchiro.poli.reply.model.dao;

import java.util.List;
import com.jungchiro.poli.reply.model.dto.ReplyDto;

public interface ReplyDao {
	
	String NAMESPACE = "replyDto.";
	
	public List<ReplyDto> replyList(int board_seq);
	
	public int replyInsert(ReplyDto reply);

	public int replyUpdate(ReplyDto reply);

	public int replyDelete(int reply_seq);
	
	

}
