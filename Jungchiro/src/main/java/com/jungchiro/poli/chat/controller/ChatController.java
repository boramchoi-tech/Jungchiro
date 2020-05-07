package com.jungchiro.poli.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("/chatlist.do")
	public String main() {
		return "chat/chatlist";
	}

}
