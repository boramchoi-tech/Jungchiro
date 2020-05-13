package com.jungchiro.poli.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.mypage.model.dto.BoardFavDto;

@Repository
public class BoardFavoDaoImple implements BoardFavDao{
	
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardFavDto> boardFavList(int member_seq) {

		List<BoardFavDto> list = new ArrayList();

		try {
			list = sqlSession.selectList(NAMESPACE + "boardFavList", member_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 게시판 즐겨찾기 에러");
		}

		return list;
	}
	
	@Override
	public List<BoardFavDto> boardFavUpdateList(int member_seq) {
		
		List<BoardFavDto> list = new ArrayList();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "boardFavUpdateList", member_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 게시판 즐겨찾기 하루전 에러");
		}
		return list;
	}
	

	@Override
	public int checkBoardFav(int board_seq, int member_seq) {

		int res = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board_seq", board_seq);
		map.put("member_seq", member_seq);

		try {
			res = sqlSession.selectOne(NAMESPACE + "checkBoardFav", board_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 게시판 즐겨찾기 하나 출력 에러");
		}
		return res;
	}

	@Override
	public int boardFavInsert(BoardFavDto dto) {

		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "boardFavInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 게시판 즐겨찾기 등록 에러");
		}

		return res;
	}
	
	@Override
	public int cancleBoardLike(int board_seq, int member_seq) {
		
		int res = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board_seq", board_seq);
		map.put("member_seq", member_seq);
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "cancleBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : 게시판 즐겨찾기 취소 에러");
		} 
	
		return res;
	}

	@Override
	public int boardFavDelete(String[] member_seq, int board_seq) {

		int res = 0;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_seq", member_seq);
		map.put("board_seq", board_seq);

		try {
			res = sqlSession.delete(NAMESPACE + "boardFavDelete", map);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error} : 게시판 즐겨찾기 멀티 삭제 에러");
		}

		if (res != member_seq.length) {
			return -1;
		}
		return res;
	}

}
