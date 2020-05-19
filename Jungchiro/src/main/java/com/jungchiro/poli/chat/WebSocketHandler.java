package com.jungchiro.poli.chat;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler {

	private List<ConcurrentHashMap<String, WebSocketSession>> chatList = new ArrayList<ConcurrentHashMap<String, WebSocketSession>>();
	private List<HashMap<String, String>> messageList = new ArrayList<HashMap<String, String>>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String uri = session.getUri().toString().split("chat_seq=")[1];
		
		ConcurrentHashMap<String, WebSocketSession> chatUser = new ConcurrentHashMap<String, WebSocketSession>();
		
		chatUser.put(uri, session);
		chatList.add(chatUser);
		
		for (int i = 0; i < messageList.size(); i++) {
			String chat_seq = messageList.get(i).get("chat_seq");

			if (uri.equals(chat_seq)) {
				String message_id = messageList.get(i).get("message_id");
				String message_time = messageList.get(i).get("message_time");
				String message_content = messageList.get(i).get("message_content");
				String jsonMessage = "{\"message_id\":\"" + message_id + "\",\"message_time\":\"" + message_time + "\",\"message_content\":\"" + message_content + "\"}";
				
				session.sendMessage(new TextMessage(jsonMessage));
			}

		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료됨");

		// map에서 세션에서 연결 종료된 유저를 없애는 이유는
		// 더 이상 메세지를 보낼 필요가 없기 때문에 목록에서 지우는 것
		for (int i = 0; i < chatList.size(); i++) {
			if (chatList.get(i).containsValue(session)) {
				chatList.remove(i);
				System.out.println("세션 삭제 성공");

			}
		}

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String chat_msg = message.getPayload();
		System.out.println(message.getPayload());
		// admin&nbsp;&nbsp;오후 5:46:47<br>ㅇ

		String[] msg_split1 = chat_msg.split("&nbsp;&nbsp;");
		String[] msg_split2 = msg_split1[2].split("<br>");

		String chat_seq = msg_split1[0];
		String message_id = msg_split1[1];
		String message_time = msg_split2[0];
		String message_content = msg_split2[1];

		System.out.println("chat_seq : " + chat_seq);
		System.out.println("message_id : " + message_id);
		System.out.println("message_time : " + message_time);
		System.out.println("message_content : " + message_content);

		HashMap<String, String> message_map = new HashMap<String, String>();
		message_map.put("chat_seq", chat_seq);
		message_map.put("message_id", message_id);
		message_map.put("message_time", message_time);
		message_map.put("message_content", message_content);

		messageList.add(message_map);

		for (int i = 0; i < chatList.size(); i++) {
			
			if (chatList.get(i).containsKey(chat_seq)) {
				WebSocketSession s = chatList.get(i).get(chat_seq);
				String jsonMessage = "{\"message_id\":\"" + message_id + "\",\"message_time\":\"" + message_time + "\",\"message_content\":\"" + message_content + "\"}";
				
				s.sendMessage(new TextMessage(jsonMessage));
				
			}
			
			
		}

	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

}
