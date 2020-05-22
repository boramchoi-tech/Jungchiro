package com.jungchiro.poli.board.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.board.model.dao.BoardDao;
import com.jungchiro.poli.board.model.dto.BoardDto;
import com.jungchiro.poli.board.model.dto.PagingDto;
import com.jungchiro.poli.board.model.dto.SearchDto;

@Service
public class BoardBizImpl implements BoardBiz {

	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardDto> boardList(SearchDto search) {		
		return dao.boardList(search);
	}

	@Override
	public BoardDto boardDetail(int board_seq) {
		return dao.boardDetail(board_seq);
	}
	
	@Override
	public int boardCountUpdate(int board_seq) {
		return dao.boardCountUpdate(board_seq);
	}

	@Override
	public int boardInsert(BoardDto board) {
		return dao.boardInsert(board);
	}

	@Override
	public int boardUpdate(BoardDto board) {
		return dao.boardUpdate(board);
	}

	@Override
	public int boardDelete(int board_seq) {
		return dao.boardDelete(board_seq);
	}

	@Override
	public int listCount(SearchDto search) {
		return dao.listCount(search);
	}

}
