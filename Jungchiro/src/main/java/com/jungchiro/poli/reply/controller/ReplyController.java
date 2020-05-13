package com.jungchiro.poli.reply.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jungchiro.poli.board.model.dto.BoardDto;
import com.jungchiro.poli.reply.model.biz.ReplyBiz;
import com.jungchiro.poli.reply.model.dto.ReplyDto;

@Controller
public class ReplyController {

	private Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	private ReplyBiz biz;

	@ResponseBody
	@RequestMapping(value = "/replylist.do", produces = "application/json; charset=utf-8")
	public ResponseEntity replyList(@ModelAttribute("board_seq") int board_seq, HttpServletRequest request) {

		logger.info("REPLY LIST");

		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();

		List<ReplyDto> list = biz.replyList(board_seq);

		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				HashMap hm = new HashMap();
				hm.put("reply_seq", list.get(i).getReply_seq());
				hm.put("board_seq", list.get(i).getBoard_seq());
				hm.put("member_seq", list.get(i).getMember_seq());
				hm.put("reply_content", list.get(i).getReply_content());
				hm.put("reply_date", list.get(i).getReply_date());

				hmlist.add(hm);
			}

		}

		JSONArray json = new JSONArray(hmlist);
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}

	@ResponseBody
	@RequestMapping("/replyinsert.do")
	public void insert(ReplyDto reply) {
		logger.info("INSERT REPLY");

		System.out.println("댓글입력");

		int res = biz.replyInsert(reply);

		if (res > 0) {
			System.out.println("입력 성공");
		} else {
			System.out.println("입력 실패");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/replyupdate.do")
	public void update(ReplyDto reply) {
		logger.info("UPDATE");

		int res = biz.replyUpdate(reply);

		if (res > 0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/replydelete.do")
	public void delete(int reply_seq) {
		logger.info("DELETE");

		int res = biz.replyDelete(reply_seq);

		if (res > 0) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
	}

}
