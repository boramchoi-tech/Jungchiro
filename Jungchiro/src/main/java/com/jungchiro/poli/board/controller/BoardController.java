package com.jungchiro.poli.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jungchiro.poli.board.model.biz.BoardBiz;
import com.jungchiro.poli.board.model.dto.BoardDto;
import com.jungchiro.poli.board.model.dto.PageMakeDto;
import com.jungchiro.poli.board.model.dto.SearchDto;
import com.jungchiro.poli.mypage.model.biz.BoardFavBiz;
import com.jungchiro.poli.mypage.model.dto.BoardFavDto;

@Controller
public class BoardController {

	private Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardBiz biz;
	@Autowired
	private BoardFavBiz boardFavBiz;
	HttpSession session;

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

	// 쿠키 이용 조회수 중복 증가 방지된 글 하나 출력
	@RequestMapping("/boarddetail.do")
	public String selectOne(HttpServletRequest request, HttpServletResponse response, Model model, int board_seq, @ModelAttribute("search") SearchDto search) {

		logger.info("DETAIL");
		
		// 조회수 중복 증가 방지를 위한 쿠키 사용
		// 쿠키는 HttpServletRequest에 저장되어 있다
		Cookie[] cookies = request.getCookies();
		boolean isGet = false;
		
		if(cookies!=null) {
			for(Cookie c : cookies) {
				if(c.getName().equals(Integer.toString(board_seq))) {
					isGet = true;
				}
			}
		} 		
		
		if(!isGet) {
			// 쿠키에 저장된 값이 없다면 조회수 증가
			biz.boardCountUpdate(board_seq); 
			// 쿠키에 저장
			Cookie c1 = new Cookie(Integer.toString(board_seq), Integer.toString(board_seq));
			// 쿠키 유효 시간
			c1.setMaxAge(1*24*60*60);
			response.addCookie(c1);
		}
		
		model.addAttribute("board", biz.boardDetail(board_seq));
		model.addAttribute("search", search);

		return "board/boarddetail";
	}

	@RequestMapping("/boardinsertform.do")
	public String insert() {

		logger.info("INSERTFORM");

		return "board/boardinsert";
	}
	
	// 즐겨찾기 등록 여부 확인
	@RequestMapping(value="/isFav.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Boolean> isFav(@RequestBody BoardFavDto dto){
		
		int res = boardFavBiz.checkBoardFav(dto.getBoard_seq(), dto.getMember_seq());
		System.out.println(dto.getBoard_seq() + "" + dto.getBoard_seq());
		boolean isFav = false;
		
		if ( res > 0 ) {
			isFav = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isFav", isFav);
		
		return map;
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
	public String updateForm(Model model, int board_seq, int member_seq) {

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
