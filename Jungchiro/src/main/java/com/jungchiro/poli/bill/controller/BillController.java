package com.jungchiro.poli.bill.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungchiro.poli.bill.model.biz.BillBiz;
import com.jungchiro.poli.board.model.dto.PageMakeDto;
import com.jungchiro.poli.board.model.dto.PagingDto;

@Controller
public class BillController {
	
	private Logger logger = LoggerFactory.getLogger(BillController.class);

	@Autowired
	private BillBiz biz;

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

}
