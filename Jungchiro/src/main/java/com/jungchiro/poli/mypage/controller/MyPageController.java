package com.jungchiro.poli.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.jungchiro.poli.mypage.model.biz.NotificationReplyBiz;
import com.jungchiro.poli.mypage.model.dto.BillFavDto;
import com.jungchiro.poli.mypage.model.dto.BillFavListDto;
import com.jungchiro.poli.mypage.model.dto.BoardFavDto;
import com.jungchiro.poli.mypage.model.dto.BoardFavListDto;

@Controller
public class MyPageController {
	
	private Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@Autowired
	private BoardFavBiz boardFavBiz;
	@Autowired
	private BillFavBiz billFavBiz;
	@Autowired
	private NotificationReplyBiz notificationReplyBiz;
	HttpSession session;
	
	// 메인페이지 출력
	@RequestMapping(value="/mypage.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String myPageList(Model model, int member_seq) {
		
		logger.info("MYPAGE");
		
		// 게시판 즐겨찾기 총 개수  구하기
		int res = boardFavBiz.getTotalBoardFav(member_seq);
		
		System.out.println("게시판 즐겨찾기 총 개수 : " + res);
		
		// 만약 게시판 즐겨찾기 한 수가 5개 이하일 때 end 값으로 총 게시물 수 대입
		if(res < 6) {
			model.addAttribute("boardFavPartialList", boardFavBiz.boardFavPartialList(member_seq, 1, res));
		} else {
			model.addAttribute("boardFavPartialList", boardFavBiz.boardFavPartialList(member_seq, 1, 5));
			int boardFavNum = 5;
			model.addAttribute("seq", 1);
			model.addAttribute("boardFavNum", boardFavNum);
		}	
		
		int result = billFavBiz.getTotalBillFav(member_seq);
		
		System.out.println("의안 즐겨찾기 총 개수 : " + res);
		
		// 만약 의안 즐겨찾기 한 수가 5개 이하일 때 end 값으로 총 게시물 수 대입
		if(result < 6) {
			model.addAttribute("billFavPartialList", billFavBiz.billFavPartialList(member_seq, 1, result));
		} else {
			model.addAttribute("billFavPartialList", billFavBiz.billFavPartialList(member_seq, 1, 5));
			int billFavNum = 5;
			model.addAttribute("sequence", 1);
			model.addAttribute("billFavNum", billFavNum);
		}
		
		System.out.println(result);
				
		model.addAttribute("boardFavUpdateList", boardFavBiz.boardFavUpdateList(member_seq));
		model.addAttribute("billFavTotalList", billFavBiz.billFavList(member_seq));
		model.addAttribute("billFavUpdateList",billFavBiz.billFavUpdateList(member_seq));
		model.addAttribute("notificationReplyList", notificationReplyBiz.replyNotificationList(member_seq));
		
		return "mypage/mypage";
	}
	
	// 게시판 즐겨찾기 더보기 수 확인
	@RequestMapping(value="/checkMoreBoardFavList.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Boolean> getMoreBoardFavList(Model model, @RequestBody BoardFavListDto dto) {
		
		logger.info("더보기");
		
		System.out.println("member_seq : " + dto.getMember_seq());
		System.out.println("end : " + dto.getEnd());
		
		int res = boardFavBiz.getTotalBoardFav(dto.getMember_seq());
		System.out.println("총 즐겨찾기 게시물 수 : " + res);
		
		boolean isTrue = false;
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		if( res > dto.getEnd()-5) {
			isTrue = true;
			map.put("isTrue", isTrue); 
		} else {
			map.put("isTrue", isTrue);
		}
		
		return map;
	}
	
	// 마이페이지 게시판 즐겨찾기 더보기
	@RequestMapping(value="/getMoreBoardList.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, List<BoardFavDto>> getMoreBoardList(@RequestBody BoardFavListDto dto){
		
		logger.info("더보기 왔다!");
		
		System.out.println("member_seq : " + dto.getMember_seq());
		System.out.println("start : " + dto.getStart());
		System.out.println("end : " + dto.getEnd());
		
		Map<String, List<BoardFavDto>> map = new HashMap<String, List<BoardFavDto>>();
		
		int res = boardFavBiz.getTotalBoardFav(dto.getMember_seq());
		
		if( res <= dto.getEnd()) {
			map.put("getMoreBoardList", boardFavBiz.boardFavPartialList(dto.getMember_seq(), dto.getStart(), res));
		} else {
			map.put("getMoreBoardList", boardFavBiz.boardFavPartialList(dto.getMember_seq(), dto.getStart(), dto.getEnd()));
		}
		
	return map;
	
	}
	
	// 게시판 즐겨찾기 등록
	@RequestMapping(value="/insertBoardFav.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Boolean> insertBoardFav(@RequestBody BoardFavDto dto, HttpServletResponse response) throws IOException{
		
		logger.info("INSERTBOARDFAV");
		
		int result = boardFavBiz.checkBoardFav(dto.getBoard_seq(), dto.getMember_seq());
		
		if(result > 0) {
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('이미 즐겨찾기 등록된 게시물입니다.')");
			out.println("</script>");
		}
		
		int res = boardFavBiz.boardFavInsert(dto);
		boolean isInsert = false;
		
		if( res > 0) {
			isInsert = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isInsert", isInsert);
		
		return map;
	}
	
	// 의안 즐겨찾기 등록
	@RequestMapping(value="/insertBillFav.do",method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Boolean> insertBillFav(@RequestBody BillFavDto dto, HttpServletResponse response) throws IOException{
		
		logger.info("INSERTBILLFAV");
		
		int result = billFavBiz.checkBillFav(dto.getBill_id(), dto.getMember_seq());
		
		if(result > 0) {
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('이미 즐겨찾기 등록된 게시물입니다.')");
			out.println("</script>");
		}
		
		int res = billFavBiz.billFavInsert(dto);
		boolean isInsert = false;
		
		if( res > 0) {
			isInsert = true;
		}		
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isInsert", isInsert);
		
		return map;
		
	}
	
	// 게시판 즐겨찾기 취소(자유게시판에서 사용)
	@RequestMapping(value="/cancleBoardFav.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Boolean> cancleBoardFav(@RequestBody BoardFavDto dto, HttpServletResponse response) throws IOException{
				
		logger.info("CANCLEBOARDFAV");
		
		int res = boardFavBiz.cancleBoardLike(dto.getBoard_seq(), dto.getMember_seq());
		boolean isCancle = false;
		
		if( res > 0) {
			isCancle = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isCancle", isCancle);
		
		return map;
	}
	
	// 게시판 즐겨찾기 선택 삭제(마이페이지에서 사용)
	@RequestMapping(value="/boardFavDelete.do", method=RequestMethod.POST)
	public String boardFavDelete(HttpServletRequest request, HttpServletResponse response, Model model,@RequestParam("boardChk")String[] boardChk, @RequestParam("member_seq")int member_seq) throws IOException {
		
		logger.info("BOARDFAV MULTIDELETE");
		
		System.out.println(Arrays.toString(boardChk));
		System.out.println("member_seq : " + member_seq);
		
		// 게시판 즐겨찾기 총 개수  구하기
		int res = boardFavBiz.getTotalBoardFav(member_seq);
		
		System.out.println("게시판 즐겨찾기 총 개수 : " + res);
		
		// 만약 게시판 즐겨찾기 한 수가 5개 이하일 때 end 값으로 총 게시물 수 대입
		if(res < 6) {
			model.addAttribute("boardFavPartialList", boardFavBiz.boardFavPartialList(member_seq, 1, res));
		} else {
			model.addAttribute("boardFavPartialList", boardFavBiz.boardFavPartialList(member_seq, 1, 5));
			int boardFavNum = 5;
			model.addAttribute("seq", 1);
			model.addAttribute("boardFavNum", boardFavNum);
		}	
		
		int result = billFavBiz.getTotalBillFav(member_seq);
		
		System.out.println("의안 즐겨찾기 총 개수 : " + res);
		
		// 만약 의안 즐겨찾기 한 수가 5개 이하일 때 end 값으로 총 게시물 수 대입
		if(result < 6) {
			model.addAttribute("billFavPartialList", billFavBiz.billFavPartialList(member_seq, 1, result));
		} else {
			model.addAttribute("billFavPartialList", billFavBiz.billFavPartialList(member_seq, 1, 5));
			int billFavNum = 5;
			model.addAttribute("sequence", 1);
			model.addAttribute("billFavNum", billFavNum);
		}
		
		System.out.println(result);
				
		model.addAttribute("boardFavUpdateList", boardFavBiz.boardFavUpdateList(member_seq));
		model.addAttribute("billFavTotalList", billFavBiz.billFavList(member_seq));
		model.addAttribute("billFavUpdateList",billFavBiz.billFavUpdateList(member_seq));
		model.addAttribute("notificationReplyList", notificationReplyBiz.replyNotificationList(member_seq));
		
		if(boardChk == null || boardChk.length == 0) {
			PrintWriter out = response.getWriter();

			out.println("<script type='text/javascript'>");
			out.println("alert('삭제할 글을 1개 이상 선택해주세요.')");
			out.println("</script>");
		} else {
			int rres = boardFavBiz.boardFavDelete(boardChk, member_seq);
			System.out.println("boardChk : " + boardChk);
			
			if(res > 0) {
				return "redirect:mypage.do?member_seq="+member_seq;
			} else {
				System.out.println("[error] : boardFavDelete 에러");
			}
		}
		
		return "redirect:mypage.do?member_seq="+member_seq;
	}
	
	// 의안 즐겨찾기 더보기 수 확인
	@RequestMapping(value="/checkMoreBillFavList.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Boolean> getMoreBillFavList(Model model, @RequestBody BillFavListDto dto) {
		
		logger.info("더보기");
		
		System.out.println("member_seq : " + dto.getMember_seq());
		System.out.println("end : " + dto.getEnd());
		
		int res = billFavBiz.getTotalBillFav(dto.getMember_seq());
		System.out.println("총 즐겨찾기 의안 수 : " + res);
		
		boolean isTrue = false;
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		if( res > dto.getEnd()-5) {
			isTrue = true;
			map.put("isTrue", isTrue); 
		} else {
			map.put("isTrue", isTrue);
		}
		
		return map;
	}
	
	// 마이페이지 의안 즐겨찾기 더보기
	@RequestMapping(value="/getMoreBillList.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, List<BillFavDto>> getMoreBillList(@RequestBody BillFavListDto dto){
		
		logger.info("더보기 왔다!");
		
		System.out.println("member_seq : " + dto.getMember_seq());
		System.out.println("start : " + dto.getStart());
		System.out.println("end : " + dto.getEnd());
		
		Map<String, List<BillFavDto>> map = new HashMap<String, List<BillFavDto>>();
		
		int res = billFavBiz.getTotalBillFav(dto.getMember_seq());
		
		if( res <= dto.getEnd()) {
			map.put("getMoreBillList", billFavBiz.billFavPartialList(dto.getMember_seq(), dto.getStart(), res));
		} else {
			map.put("getMoreBillList", billFavBiz.billFavPartialList(dto.getMember_seq(), dto.getStart(), dto.getEnd()));
		}
		
	return map;
	
	}
	
	
	// 의안 즐겨찾기 취소(의안리스트에서 사용)
	@RequestMapping(value="/cancleBillFav.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Boolean> cancleBoardFav(@RequestBody BillFavDto dto, HttpServletResponse response) throws IOException{
				
		logger.info("CANCLEBILLFAV");
		
		int res = billFavBiz.cancleBillLike(dto.getBill_id(), dto.getMember_seq());
		boolean isCancle = false;
		
		if( res > 0) {
			isCancle = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isCancle", isCancle);
		
		return map;
	}
	
	// 의안 즐겨찾기 선택 삭제(마이페이지에서 사용)
	@RequestMapping(value="/billFavDelete.do", method=RequestMethod.POST)
	public String billFavDelete(HttpServletRequest request, HttpServletResponse response, Model model,@RequestParam("billChk")String[] billChk, @RequestParam("member_seq")int member_seq) throws IOException {
		
		logger.info("BILLFAV MULTIDELETE");
		
		System.out.println(Arrays.toString(billChk));
		System.out.println("member_seq : " + member_seq);
		
		if(billChk == null || billChk.length == 0) {
			PrintWriter out = response.getWriter();

			out.println("<script type='text/javascript'>");
			out.println("alert('삭제할 글을 1개 이상 선택해주세요.')");
			out.println("</script>");
		} else {
			int res = billFavBiz.billFavDelete(billChk, member_seq);
			System.out.println("boardChk : " + billChk);
			
			if(res > 0) {
				return "redirect:mypage.do?member_seq="+member_seq;
			} else {
				System.out.println("[error] : billFavDelete 에러");
			}
		}
		
		return "redirect:mypage.do?member_seq="+member_seq;
	}
	
	// 마이페이지 리플 멀티 읽음 전환
	@RequestMapping(value="/replyNotificationDelete.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String replyNotificationDelete(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam("replyChk")String [] board_seq, @RequestParam("member_seq")int member_seq) throws IOException {
		
		logger.info("REPLYNOTIFICATIONDELETE");
		
		System.out.println(Arrays.toString(board_seq));
		System.out.println("reply member_seq : " + member_seq);
		
		if(board_seq == null || board_seq.length == 0) {
			PrintWriter out = response.getWriter();
			
			out.println("<script type='text/javascript'>");
			out.println("alert('삭제할 글을 1개 이상 선택해주세요.')");
			out.println("</script>");
			
		} else {
			
			int res = notificationReplyBiz.changeMultiReplyIsread(board_seq, member_seq);
			System.out.println("board_seq : " + Arrays.toString(board_seq));
			
			if(res > 0) {
				System.out.println("reply multidelete 성공했다!");
				return "redirect:mypage.do?member_seq="+member_seq;
			}			
		}		
		
		int res = boardFavBiz.getTotalBoardFav(member_seq);
		
		System.out.println("게시판 즐겨찾기 총 개수 : " + res);
		
		// 만약 게시판 즐겨찾기 한 수가 5개 이하일 때 end 값으로 총 게시물 수 대입
		if(res < 6) {
			model.addAttribute("boardFavPartialList", boardFavBiz.boardFavPartialList(member_seq, 1, res));
		} else {
			model.addAttribute("boardFavPartialList", boardFavBiz.boardFavPartialList(member_seq, 1, 5));
			int boardFavNum = 5;
			model.addAttribute("seq", 1);
			model.addAttribute("boardFavNum", boardFavNum);
		}	
		
		int result = billFavBiz.getTotalBillFav(member_seq);
		
		System.out.println("의안 즐겨찾기 총 개수 : " + res);
		
		// 만약 의안 즐겨찾기 한 수가 5개 이하일 때 end 값으로 총 게시물 수 대입
		if(result < 6) {
			model.addAttribute("billFavPartialList", billFavBiz.billFavPartialList(member_seq, 1, result));
		} else {
			model.addAttribute("billFavPartialList", billFavBiz.billFavPartialList(member_seq, 1, 5));
			int billFavNum = 5;
			model.addAttribute("sequence", 1);
			model.addAttribute("billFavNum", billFavNum);
		}
		
		System.out.println(result);
				
		model.addAttribute("boardFavUpdateList", boardFavBiz.boardFavUpdateList(member_seq));
		model.addAttribute("billFavTotalList", billFavBiz.billFavList(member_seq));
		model.addAttribute("billFavUpdateList",billFavBiz.billFavUpdateList(member_seq));
		model.addAttribute("notificationReplyList", notificationReplyBiz.replyNotificationList(member_seq));
				
		return "mypage/mypage";
	}
	
	// 마이페이지 리플 다 읽음 전환
	@RequestMapping(value="/replyNotificationDeleteAll.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String replyNotificationDeleteAll(int member_seq, Model model) {
		
		logger.info("REPLYNOTIFICATIONDELETEALL");
		
		int res = notificationReplyBiz.changeReplyIsread(member_seq);
		
		if(res > 0) {
			// 만약 게시판 즐겨찾기 한 수가 5개 이하일 때 end 값으로 총 게시물 수 대입
			if(res < 6) {
				model.addAttribute("boardFavPartialList", boardFavBiz.boardFavPartialList(member_seq, 1, res));
			} else {
				model.addAttribute("boardFavPartialList", boardFavBiz.boardFavPartialList(member_seq, 1, 5));
				int boardFavNum = 5;
				model.addAttribute("seq", 1);
				model.addAttribute("boardFavNum", boardFavNum);
			}	
			
			int result = billFavBiz.getTotalBillFav(member_seq);
			
			System.out.println("의안 즐겨찾기 총 개수 : " + res);
			
			// 만약 의안 즐겨찾기 한 수가 5개 이하일 때 end 값으로 총 게시물 수 대입
			if(result < 6) {
				model.addAttribute("billFavPartialList", billFavBiz.billFavPartialList(member_seq, 1, result));
			} else {
				model.addAttribute("billFavPartialList", billFavBiz.billFavPartialList(member_seq, 1, 5));
				int billFavNum = 5;
				model.addAttribute("sequence", 1);
				model.addAttribute("billFavNum", billFavNum);
			}
			
			System.out.println(result);
					
			model.addAttribute("boardFavUpdateList", boardFavBiz.boardFavUpdateList(member_seq));
			model.addAttribute("billFavTotalList", billFavBiz.billFavList(member_seq));
			model.addAttribute("billFavUpdateList",billFavBiz.billFavUpdateList(member_seq));
			model.addAttribute("notificationReplyList", notificationReplyBiz.replyNotificationList(member_seq));
			
			return "mypage/mypage";
		}
				
		return "mypage/mypage";
	}
	
	// 회원탈퇴 
	@RequestMapping(value="/singOut.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String singOutGo() {
		
		logger.info("SIGNOUT");
		
		return "/mypage/signOut";
	}


}
