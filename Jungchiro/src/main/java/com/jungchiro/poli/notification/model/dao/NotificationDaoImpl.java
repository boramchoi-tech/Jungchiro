package com.jungchiro.poli.notification.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository	
public class NotificationDaoImpl implements NotificationDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getNotification(int member_seq) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "getNotification", member_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : getNotification");
		}
		
		return res;
	}

	/*
	 * @Override public int isReply(int member_seq) {
	 * 
	 * int res = 0;
	 * 
	 * try { res = sqlSession.selectOne(NAMESPACE + "isReply", member_seq); } catch
	 * (Exception e) { e.printStackTrace(); System.out.println("[error] : isReply");
	 * } return res; }
	 */

}
