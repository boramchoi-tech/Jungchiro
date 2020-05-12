package com.jungchiro.poli.board.model.dao;

import java.util.HashMap;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.board.model.dto.BoardDto;
import com.jungchiro.poli.board.model.dto.PagingDto;
import com.jungchiro.poli.board.model.dto.SearchDto;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardDto> boardList(SearchDto search) {
		// TODO Auto-generated method stub
		List<BoardDto> list = null;
		try {

			list = sqlSession.selectList(NAMESPACE + "boardList", search);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error(boardList):3,4");

		}
		return list;
	}

	@Override
	public BoardDto boardDetail(int board_seq) {
		// TODO Auto-generated method stub
		BoardDto board = null;
		try {
			board = sqlSession.selectOne(NAMESPACE + "boardDetail", board_seq);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error(boardDetail):3,4");

		}

		return board;
	}

	@Override
	public int boardInsert(BoardDto board) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "boardInsert", board);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error(boardInsert):3,4");
		}

		return res;
	}

	@Override
	public int boardUpdate(BoardDto board) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "boardUpdate", board);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error(boardUpdate):3,4");
		}

		return res;
	}

	@Override
	public int boardDelete(int board_seq) {
		// TODO Auto-generated method stub
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "boardDelete", board_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error(boardDelete):3,4");
		}

		return res;
	}

	@Override
	public int listCount(SearchDto search) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "listCount", search);
	}


}
