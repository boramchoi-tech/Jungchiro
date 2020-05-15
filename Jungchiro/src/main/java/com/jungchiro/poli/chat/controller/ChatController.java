package com.jungchiro.poli.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/chat.do")
	public String chat(ChatDto dto, Model model) {
		int totalCount = chatBiz.totalCount();
		List<ChatDto> chatlist = null;
		
		if (totalCount == 0) {
			System.out.println("존재하는 채팅방이 없음");
			
		} else {
			chatlist = chatBiz.selectChatList();

		}
		
		model.addAttribute("chatlist", chatlist);
		model.addAttribute("member_seq", dto.getMember_seq());
		
		return "chat/chatlist";
	}
	
	@RequestMapping(value="/chatlist.do", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> chatlist(@RequestBody ChatDto dto, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (dto.getMember_seq() != 0) {
			int totalCount = chatBiz.totalCount(dto.getMember_seq());
			List<ChatDto> chatlist = chatBiz.selectChatList(dto.getMember_seq());
			map.put("chatroomCount", totalCount);
			map.put("chatlist", chatlist);
			
		} else {
			//전체 채팅방 출력
			int totalCount = chatBiz.totalCount();
			List<ChatDto> chatlist = chatBiz.selectChatList();
			map.put("chatroomCount", totalCount);
			map.put("chatlist", chatlist);
			
			
		}
		
		return map;
		
	}
		
	@RequestMapping("/createroom.do")
	public String createRoom(ChatDto dto) {
		int chat_seq = biz.createRoom(dto);
		int res = biz.createChatList(dto.getMember_seq(), chat_seq);
		
			//로그인을 안 했거나 채팅방 만들기 실패했을 경우
		if (chat_seq == 0 || res == 0) {
			System.out.println("Fail: createRoom");
			return "main";
			
		} else {
			System.out.println("채팅방 번호 : " + chat_seq);
			return "redirect:chat.do";
		}

	}
	
	@RequestMapping("/enterroom.do")
	public String enterRoom(Model model, @RequestBody ChatDto dto) {
		List<MessageDto> chatMessage = messageBiz.selectAll(dto.getChat_seq());
		model.addAttribute("member_seq", dto.getMember_seq());
		model.addAttribute("chat_seq", dto.getChat_seq());
		model.addAttribute("chatMessage", chatMessage);
		return "chat/chatroom";
	}

}
