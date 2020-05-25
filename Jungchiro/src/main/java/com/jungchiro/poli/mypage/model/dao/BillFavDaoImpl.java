package com.jungchiro.poli.mypage.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.mypage.model.dto.BillFavDto;

@Repository
public class BillFavDaoImpl implements BillFavDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BillFavDto> billFavList(int member_seq) {
		
		List<BillFavDto> list = new ArrayList();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "billFavList", member_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 의안 즐겨찾기 리스트 에러");
		}
		
		return list;
	}

	@Override
	public List<BillFavDto> billFavUpdateList(int member_seq) {
		
		List<BillFavDto> list = new ArrayList();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "billFavUpdateList", member_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 의안 즐겨찾기 하루전 에러");
		}
	
		return list;
	}

	@Override
	public List<BillFavDto> billFavPartialList(int member_seq, int start, int end) {
		
		List<BillFavDto> list = new ArrayList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_seq", member_seq);
		map.put("start", start);
		map.put("end", end);
		
		try {
			list = sqlSession.selectList(NAMESPACE + "billFavPartialList", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 의안 부분 출력 에러");
		}
		
		return list;
	}

	@Override
	public int checkBillFav(String bill_seq, int member_seq) {
		
		int res = 0;
		
		System.out.println("bill_seq : " + bill_seq + "member_seq : " + member_seq);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bill_seq", bill_seq);
		map.put("member_seq", member_seq);
		System.out.println(map);

		try {
			res = sqlSession.selectOne(NAMESPACE + "checkBilldFav", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 의안 즐겨찾기 하나 출력 에러");
		}
		return res;
	}

	@Override
	public int getTotalBillFav(int member_seq) {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "getTotalBillFav", member_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 즐겨찾기 의안 총 개수 구하기 에러");
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
			res = sqlSession.update(NAMESPACE + "cancleBillLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 게시판 즐겨찾기 취소 에러");
		} 
	
		return res;
	}

	@Override
	public int billFavDelete(String[] bill_id, int member_seq) {
		
		int res = 0;
		
		System.out.println("DAOIMPL : " + Arrays.toString(bill_id));

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bill_id", bill_id);
		map.put("member_seq", member_seq);
		
		System.out.println("map : " + map);

		try {
			res = sqlSession.update(NAMESPACE + "billFavDelete", map);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error} : 게시판 즐겨찾기 멀티 삭제 에러");
		}

		if (res != bill_id.length) {
			return -1;
		}
		return res;
	}

}
