package com.jungchiro.poli.bill.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jungchiro.poli.bill.model.biz.BillBiz;
import com.jungchiro.poli.board.model.dto.PageMakeDto;
import com.jungchiro.poli.board.model.dto.PagingDto;
import com.jungchiro.poli.mypage.model.biz.BillFavBiz;
import com.jungchiro.poli.mypage.model.dto.BillFavDto;

@Controller
public class BillController {
	
	private Logger logger = LoggerFactory.getLogger(BillController.class);

	@Autowired
	private BillBiz biz;
	
	@Autowired
	private BillFavBiz billFavBiz;

	@RequestMapping("/billlist.do")
	public String selectlist(Model model, HttpServletRequest request, HttpServletResponse response, PagingDto page) {

		logger.info("BILL LIST");

		model.addAttribute("list", biz.billList(page));

		PageMakeDto pageMake = new PageMakeDto();
		pageMake.setPaging(page);
		pageMake.setTotalCount(biz.listCount());

		model.addAttribute("pageMake", pageMake);

		return "bill/billlist";
	}
	
	// 의안 즐겨찾기 등록 확인
	@RequestMapping(value="/isBillFav.do",method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Boolean> isBillFav(@RequestBody BillFavDto dto){
		
		logger.info("ISBILLFAV");
		int res = billFavBiz.checkBillFav(dto.getBill_id(), dto.getMember_seq());
		System.out.println(dto.getBill_id() + " " + dto.getMember_seq());
		
		boolean isBillFav = false;
		
		if(res > 0) {
			isBillFav = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isBillFav", isBillFav);
		
		return map;
	}
	
	
	
	
}
