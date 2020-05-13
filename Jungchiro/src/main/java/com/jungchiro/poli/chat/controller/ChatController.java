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
			System.out.println("전체 채팅방 출력");
			
		}
		
		model.addAttribute("chatlist", chatlist);
		model.addAttribute("member_seq", dto.getMember_seq());
		
		return "chat/chatlist";
	}
	
	@RequestMapping(value="/chatlist.do", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> chatlist(ChatDto dto, Model model) {
		System.out.println("chatlist.do");
		System.out.println(dto.getMember_seq());
		List<ChatDto> list = new ArrayList<ChatDto>();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("test", 1);
		
		return map;
		
	}
		
		//채팅방 개수
		/*
		int totalCount = chatBiz.totalCount();
		System.out.println("controller: chatlist");

		Map<String, Object> map = new HashMap<String, Object>();
		
		if (totalCount == 0) {
			map.put("chatroomCount", totalCount);
			
		} else {
			
			if (dto.getMember_seq() != 0) {
				List<ChatDto> chatlist = chatBiz.selectChatList(dto.getMember_seq());
				map.put("chatroomCount", totalCount);
				map.put("chatlist", chatlist);
				
			} else {
				List<ChatDto> chatlist = chatBiz.selectChatList();
				System.out.println("전체 채팅방 출력");
				map.put("chatroomCount", totalCount);					//전체 채팅방 출력
				map.put("chatlist", chatlist);
			}*/
			
			/*if (dto.getMember_seq() == 0) {

			} else {
				List<ChatDto> chatlist = chatBiz.selectChatList(dto.getMember_seq());
				model.addAttribute("chatlist", chatlist);
				model.addAttribute("member_seq", dto.getMember_seq());
				
				// checkbox 표시한 경우
				map.put("chatList", 1);
			}*/
			
			
		//}
	
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
