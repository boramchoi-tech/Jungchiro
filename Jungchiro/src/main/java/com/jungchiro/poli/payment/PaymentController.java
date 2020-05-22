package com.jungchiro.poli.payment;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungchiro.poli.board.controller.BoardController;

@Controller
public class PaymentController {
	
	private Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@RequestMapping("/paymentpopup.do")
	public String payment() {
		
		logger.info("PAYMENT");

		return "form/paymentpopup";
		
	}

}
