package com.jungchiro.poli.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	
	@RequestMapping("/chatlist.do")
	public String main() {
		return "chat/chatlist";
	}

}
