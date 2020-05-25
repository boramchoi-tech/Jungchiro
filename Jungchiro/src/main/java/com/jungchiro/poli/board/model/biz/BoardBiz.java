package com.jungchiro.poli.board.model.biz;

import java.util.List;


import com.jungchiro.poli.board.model.dto.BoardDto;
import com.jungchiro.poli.board.model.dto.SearchDto;
public interface BoardBiz {

	public List<BoardDto> boardList(SearchDto search);

	public BoardDto boardDetail(int board_seq);
	
	public int boardCountUpdate(int board_seq);

	public int boardInsert(BoardDto board);

	public int boardUpdate(BoardDto board);

	public int boardDelete(int board_seq);

	public int listCount(SearchDto search);
}
