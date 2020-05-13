package com.jungchiro.poli.mypage.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.mypage.model.dao.BoardFavDao;
import com.jungchiro.poli.mypage.model.dto.BoardFavDto;

@Service
public class BoardFavBIzImpl implements BoardFavBiz {
	
	@Autowired
	private BoardFavDao dao;

	@Override
	public List<BoardFavDto> boardFavList(int member_seq) {
		return dao.boardFavList(member_seq);
	}

	@Override
	public List<BoardFavDto> boardFavUpdateList(int member_seq) {
		return dao.boardFavUpdateList(member_seq);
	}

	@Override
	public int checkBoardFav(int board_seq, int member_seq) {
		return dao.checkBoardFav(board_seq, member_seq);
	}

	@Override
	public int boardFavInsert(BoardFavDto dto) {
		return dao.boardFavInsert(dto);
	}

	@Override
	public int cancleBoardLike(int board_seq, int member_seq) {
		return dao.cancleBoardLike(board_seq, member_seq);
	}

	@Override
	public int boardFavDelete(String[] member_seq, int board_seq) {
		return dao.boardFavDelete(member_seq, board_seq);
	}

}
