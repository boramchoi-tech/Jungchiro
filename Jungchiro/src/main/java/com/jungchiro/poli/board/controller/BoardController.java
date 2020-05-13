package com.jungchiro.poli.board.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jungchiro.poli.board.model.biz.BoardBiz;
import com.jungchiro.poli.board.model.dto.BoardDto;
import com.jungchiro.poli.board.model.dto.PageMakeDto;
import com.jungchiro.poli.board.model.dto.PagingDto;
import com.jungchiro.poli.board.model.dto.SearchDto;

@Controller
public class BoardController {

	private Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardBiz biz;

	@RequestMapping("/boardlist.do")
	public String selectlist(Model model, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("search") SearchDto search) {

		logger.info("LIST");

		model.addAttribute("list", biz.boardList(search));

		PageMakeDto pageMake = new PageMakeDto();
		pageMake.setPaging(search);
		pageMake.setTotalCount(biz.listCount(search));

		model.addAttribute("pageMake", pageMake);

		return "board/boardlist";
	}

	@RequestMapping("/boarddetail.do")
	public String selectOne(Model model, int board_seq, @ModelAttribute("search") SearchDto search) {

		logger.info("DETAIL");

		model.addAttribute("board", biz.boardDetail(board_seq));
		model.addAttribute("search", search);

		return "board/boarddetail";
	}

	@RequestMapping("/boardinsertform.do")
	public String insert() {

		logger.info("INSERTFORM");

		return "board/boardinsert";
	}

	@RequestMapping(value = "/boardinsertres.do", method = RequestMethod.POST)
	public String insertRes(BoardDto board) {
		logger.info("INSERTRES");
		int res = biz.boardInsert(board);

		if (res > 0) {
			return "redirect:boardlist.do?page=1";
		} else {
			return "redirect:boardinsertform.do";
		}

	}

	@RequestMapping("/boardupdateform.do")
	public String updateForm(Model model, int board_seq) {

		logger.info("UPDATEFORM");

		model.addAttribute("board", biz.boardDetail(board_seq));

		return "board/boardupdate";
	}

	@RequestMapping(value = "/boardupdateres.do", method = RequestMethod.POST)
	public String updateRes(BoardDto board) {

		logger.info("UPDATERES");

		int res = biz.boardUpdate(board);

		if (res > 0) {
			return "redirect:boarddetail.do?board_seq=" + board.getBoard_seq();

		} else {

			return "redirect:boardupdateform.do?board_seq=" + board.getBoard_seq();
		}

	}

	@RequestMapping("/boarddelete.do")
	public String delete(int board_seq, @ModelAttribute("search") SearchDto search, RedirectAttributes rttr) {
		logger.info("DELETE");

		BoardDto board = new BoardDto();

		int res = biz.boardDelete(board_seq);

		rttr.addAttribute("page", search.getPage());
		rttr.addAttribute("perPageNum", search.getPerPageNum());
		rttr.addAttribute("searchType", search.getSearchType());
		rttr.addAttribute("keyword", search.getKeyword());
		if (res > 0) {

			return "redirect:boardlist.do";
		} else {
			return "redirect:boarddetail.do?board_seq=" + board.getBoard_seq();
		}

	}

}
