package com.jungchiro.poli.reply.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.reply.model.dto.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReplyDto> replyList(int board_seq) {
		// TODO Auto-generated method stub

		List<ReplyDto> list = null;

		try {

			list = sqlSession.selectList(NAMESPACE + "replyList", board_seq);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error(replyList):3,4");
		}
		return list;
	}

	@Override
	public int replyInsert(ReplyDto reply) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "replyInsert", reply);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error(replyInsert):3,4");
		}

		return res;
	}

	@Override
	public int replyUpdate(ReplyDto reply) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "replyUpdate", reply);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error(replyUpdate):3,4");
		}

		return res;
	}

	@Override
	public int replyDelete(int reply_seq) {
		// TODO Auto-generated method stub
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "replyDelete", reply_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error(replyDelete):3,4");
		}

		return res;
	}

}
