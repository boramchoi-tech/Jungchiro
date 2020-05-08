package com.jungchiro.poli.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungchiro.poli.chat.model.biz.ChatCreateBiz;
import com.jungchiro.poli.chat.model.biz.MessageBiz;
import com.jungchiro.poli.chat.model.dto.ChatDto;
import com.jungchiro.poli.chat.model.dto.MessageDto;

@Controller
public class ChatController {
	
	@Autowired
	private ChatCreateBiz biz;
	
	@Autowired
	private MessageBiz messageBiz;
	
	@RequestMapping("/chatlist.do")
	public String main() {
		return "chat/chatlist";
	}
	
	@RequestMapping("/createroom.do")
	public String createRoom(ChatDto dto, Model model) {				//chat_name, chat_category
		int chat_seq = biz.createRoom(dto);
		
		if (chat_seq == 0) {
			System.out.println("Fail: createRoom");
			
		} else {
			System.out.println("채팅방 번호 : " + chat_seq);
			model.addAttribute("chat_seq", chat_seq);

		}

		return "chat/chatroom";
	}
	
	@RequestMapping("/enterroom.do")
	public String enterRoom(Model model, int chat_seq) {
		List<MessageDto> chatMessage = messageBiz.selectAll(chat_seq);
		model.addAttribute("chat_seq", chat_seq);
		model.addAttribute("chatMessage", chatMessage);
		return "chat/chatroom";
	}

}
