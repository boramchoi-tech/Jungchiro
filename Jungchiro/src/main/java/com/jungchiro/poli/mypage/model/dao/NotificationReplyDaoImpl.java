package com.jungchiro.poli.mypage.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.mypage.model.dto.NotificationReplyDto;

@Repository
public class NotificationReplyDaoImpl implements NotificationReplyDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NotificationReplyDto> replyNotificationList(int member_seq) {
		
		List<NotificationReplyDto> list = new ArrayList();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "replyNotificationList", member_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : replyNotoificationList 에러");
		}
		
		return list;
	}

	@Override
	public int changeReplyIsread(int member_seq) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "changeReplyIsread", member_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : changeReplyIsread");
		}
		return res;
	}

	@Override
	public int changeOneReplyIsread(int board_seq, int member_seq) {
		
		int res = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_seq", board_seq);
		map.put("member_seq", member_seq);
		
		try {
			res = sqlSession.update(NAMESPACE + "changeOneReplyIsread", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : changeOneReplyIsread");
		}
		
		return res;
	}

	@Override
	public int changeMultiReplyIsread(String[] board_seq, int member_seq) {
		
		int res = 0;
		
		System.out.println("DAOIMPL : " + Arrays.toString(board_seq));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board_seq", board_seq);
		map.put("member_seq", member_seq);
		
		try {
			res = sqlSession.update(NAMESPACE + "changeMultiReplyIsread", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 리플 멀티 읽음 표시 에러");
		}
		
		if(res != board_seq.length) {
			return -1;
		}		

		return res;
	}

}
