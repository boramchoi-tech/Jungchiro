package com.jungchiro.poli.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jungchiro.poli.mypage.model.biz.BillFavBiz;
import com.jungchiro.poli.mypage.model.biz.BoardFavBiz;
import com.jungchiro.poli.mypage.model.dto.BillFavDto;
import com.jungchiro.poli.mypage.model.dto.BoardFavDto;


@Controller
public class mypageController {
	
	@Autowired
	private BoardFavBiz boardFavBiz;
	@Autowired
	private BillFavBiz billFavBiz;
	
	// 마이페이지
	@RequestMapping(value="/mypage.do", method=RequestMethod.POST)
	public String myPage(int member_seq, Model model) {

		System.out.println("mypage");
		
		model.addAttribute("boardFavTotalList", boardFavBiz.boardFavList(member_seq));
		model.addAttribute("boardFavUpdateList", boardFavBiz.boardFavUpdateList(member_seq));
		model.addAttribute("billFavTotalList", billFavBiz.billFavList(member_seq));
		model.addAttribute("billFavUpdateList",billFavBiz.billFavUpdateList(member_seq));
		
		return "MyPage";
	}
	
	// 의안 즐겨찾기 등록
	@RequestMapping(value="/billFavInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<Integer, Integer> billFavInsert(@RequestBody BillFavDto dto){
		
		// 이미 즐겨찾기 등록된 의안인지 확인
		int result = billFavBiz.checkBillFav(dto.getBill_id(), dto.getMember_seq());
		
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		if( result > 0) {
			map.put(result, 0);
			
		} else if( result == 0) {
			int res = billFavBiz.billFavInsert(dto);
			
			if( res > 0) {
				map.put(result, 1);
			}
		}		
		return map;		
	}
	
	// 게시판 즐겨찾기 선택 삭제
	@RequestMapping(value="/boardFavDelete.do", method=RequestMethod.POST)
	public String boardFavDelete(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam("member_seq")int member_seq) throws IOException {
		
		String[] board_seq = request.getParameterValues("boardChk");
		
		if(board_seq == null || board_seq.length == 0) {
			PrintWriter out = response.getWriter();

			out.println("<script type='text/javascript'>");
			out.println("alert('삭제할 글을 1개 이상 선택해주세요.')");
			out.println("</script>");
		} else {
			int res = boardFavBiz.boardFavDelete(board_seq, member_seq);
			
			if(res > 0) {
				return "MyPage";
			} else {
				System.out.println("[error] : boardFavDelete 에러");
			}
		}
		
		return "MyPage";
	}
	
	// 게시판 즐겨찾기 등록
	@RequestMapping(value="/boardFavInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<Integer, Integer> boardFavInsert(@RequestBody BoardFavDto dto){
		
		// 이미 즐겨찾기 등록된 게시물인지 확인
		int result = boardFavBiz.checkBoardFav(dto.getBoard_seq(), dto.getMember_seq()); 
		
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		if( result > 0) {
			map.put(result, 0);
		} else {
			int res = boardFavBiz.boardFavInsert(dto);
			
			if( res > 0) {
				map.put(result, 1);
			}
		}
		return map;
	}
	
	// 의안 즐겨찾기 선택 삭제
	@RequestMapping(value="/billFavDelete.do", method=RequestMethod.POST)
	public String billFavDelete(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam("member_seq")int member_seq) throws IOException {
		
		String[] bill_id = request.getParameterValues("billChk");
		
		if(bill_id == null || bill_id.length == 0) {
			PrintWriter out = response.getWriter();

			out.println("<script type='text/javascript'>");
			out.println("alert('삭제할 글을 1개 이상 선택해주세요.')");
			out.println("</script>");
		} else {
			int res = billFavBiz.billFavDelete(bill_id, member_seq);
			
			if(res > 0) {
				return "MyPage";
			} else {
				System.out.println("[error] : billFavDelete 에러");
			}
		}
		
		return "MyPage";
	}

}
