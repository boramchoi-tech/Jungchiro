package com.jungchiro.poli.mypage.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.mypage.model.dao.BoardFavDao;
import com.jungchiro.poli.mypage.model.dto.BoardFavDto;

@Service
public class BoardFavBizImpl implements BoardFavBiz {

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
	public List<BoardFavDto> boardFavPartialList(int member_seq, int start, int end){
		return dao.boardFavPartialList(member_seq, start, end);
	}

	@Override
	public int checkBoardFav(int board_seq, int member_seq) {
		return dao.checkBoardFav(board_seq, member_seq);
	}
	
	@Override
	public int getTotalBoardFav(int member_seq) {
		return dao.getTotalBoardFav(member_seq);
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
	public int boardFavDelete(String[] board_seq, int member_seq) {
		return dao.boardFavDelete(board_seq, member_seq);
	}

}
