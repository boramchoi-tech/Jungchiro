package com.jungchiro.poli.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jungchiro.poli.chat.model.biz.ChatCreateBiz;
import com.jungchiro.poli.chat.model.biz.ChatListBiz;
import com.jungchiro.poli.chat.model.biz.MessageBiz;
import com.jungchiro.poli.chat.model.dto.ChatDto;
import com.jungchiro.poli.chat.model.dto.MessageDto;

@Controller
public class ChatController {
	
	@Autowired
	private ChatCreateBiz biz;
	
	@Autowired
	private ChatListBiz chatBiz;
	
	@Autowired
	private MessageBiz messageBiz;
	
	@RequestMapping("/chatlist.do")
	public String chatlist(ChatDto dto) {
		ChatDto chatlist = chatBiz.selectChatList(dto.getMember_seq());

		return "chat/chatlist";
	}
	
	@RequestMapping("/createroom.do")
	public String createRoom(ChatDto dto, Model model) {				//chat_name, chat_category
		int chat_seq = biz.createRoom(dto);
		int res = biz.createChatList(dto.getMember_seq(), chat_seq);
		
			//로그인을 안 했거나 채팅방 만들기 실패했을 경우
		if (chat_seq == 0 || res == 0) {
			System.out.println("Fail: createRoom");
			return "main";
			
		} else {
			System.out.println("채팅방 번호 : " + chat_seq);
			model.addAttribute("chat_seq", chat_seq);
			return "chat/chatroom";
		}

	}
	
	@RequestMapping("/enterroom.do")
	public String enterRoom(Model model, int chat_seq) {
		List<MessageDto> chatMessage = messageBiz.selectAll(chat_seq);
		model.addAttribute("chat_seq", chat_seq);
		model.addAttribute("chatMessage", chatMessage);
		return "chat/chatroom";
	}

}
