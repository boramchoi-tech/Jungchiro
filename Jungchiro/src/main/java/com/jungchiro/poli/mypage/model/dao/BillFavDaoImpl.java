package com.jungchiro.poli.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.jungchiro.poli.mypage.model.dto.BillFavDto;

public class BillFavDaoImpl implements BillFavDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BillFavDto> billFavList(int member_seq) {
		
		List<BillFavDto> list = new ArrayList();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "billFavList");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 의안 즐겨찾기 에러");
		}
		
		return list;
	}
	
	@Override
	public List<BillFavDto> billFavUpdateList(int member_seq) {
		
		List<BillFavDto> list = new ArrayList();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "billFavUpdateList");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 의안 즐겨찾기 어제 이후 에러");
		}
		return list;
	}

	@Override
	public int checkBillFav(String bill_id, int member_seq) {
		
		int res = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bill_id", bill_id);
		map.put("member_seq", member_seq);
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "checkBillFav", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 의안 즐겨찾기 하나 출력 에러");
		} 
		
		return res;
	}

	@Override
	public int billFavInsert(BillFavDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "billFavInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 의안 즐겨찾기 등록 에러");
		}
		return res;
	}
	
	@Override
	public int cancleBillLike(String bill_id, int member_seq) {
		
		int res = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bill_id", bill_id);
		map.put("member_seq", member_seq);
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "cancleBillLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 의안 즐겨찾기 취소 에러");
		} 
		
		return res;
		
		
	}

	@Override
	public int billFavDelete(String[] member_seq, int bill_id) {
		
		int res = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_seq", member_seq);
		map.put("bill_id", bill_id);
		
		try {
			res = sqlSession.delete(NAMESPACE + ".billFavDelete", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 의안 즐겨찾기 멀티 삭제 에러");
		}
		
		if(res != member_seq.length) {
			return -1;
		}
		
		return res;
	}

}
