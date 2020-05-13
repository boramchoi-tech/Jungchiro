package com.jungchiro.poli.mypage.model.biz;

import java.util.List;

import com.jungchiro.poli.mypage.model.dto.BoardFavDto;

public interface BoardFavBiz {
	
	public List<BoardFavDto> boardFavList(int member_seq);
	public List<BoardFavDto> boardFavUpdateList(int member_seq);
	public int checkBoardFav(int board_seq, int member_seq);
	public int boardFavInsert(BoardFavDto dto);
	public int cancleBoardLike(int board_seq, int member_seq);
	public int boardFavDelete(String[] member_seq, int board_seq);

}
