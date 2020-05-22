package com.jungchiro.poli.chat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.jungchiro.poli.chat.model.biz.MessageBiz;
import com.jungchiro.poli.chat.model.biz.ParseTime;
import com.jungchiro.poli.chat.model.dto.MessageDto;

public class WebSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private MessageBiz biz;
	
	@Autowired
	private ParseTime parseTime;

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
				
				String time = parseTime.parseJStoJAVA(message_time);
				String isToday = parseTime.isToday(time);

				String jsonMessage = "{\"message_id\":\"" + message_id + "\",\"message_time\":\"" + isToday + "\",\"message_content\":\"" + message_content + "\"}";

				session.sendMessage(new TextMessage(jsonMessage));
			}

		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료됨");
		
		if (chatList.size() < 3) { // 남아있는 세션이 2개 이하일 경우
			List<HashMap<String, String>> insertMessageList = new ArrayList<HashMap<String, String>>();
			insertMessageList.addAll(messageList); // list 복사한 후
			
			List<MessageDto> insertList = new ArrayList<MessageDto>();
			
			for (int i = 0; i < insertMessageList.size() ; i++) {
				String seq = insertMessageList.get(i).get("chat_seq");
				int chat_seq = Integer.parseInt(seq);
				String memberseq = insertMessageList.get(i).get("member_seq");
				int member_seq = Integer.parseInt(memberseq);
				String time = insertMessageList.get(i).get("message_time");
				String message_content = insertMessageList.get(i).get("message_content");
				
				SimpleDateFormat stringToDate = new SimpleDateFormat("yyyy/MM/dd aa hh:mm:ss");
				Date message_time = null;
				try {
					message_time = stringToDate.parse(time);
				} catch (ParseException e) {
					e.printStackTrace();
				} // int chat_seq, int member_seq, String message_content, Date message_time 변환 끝
				
				MessageDto dto = new MessageDto(chat_seq, member_seq, message_time, message_content);
				insertList.add(dto);
				
			}
			
			Integer res = biz.batchInsert(insertList);
			
			if (res > 0) {
				messageList.clear();			// 메시지 담은 list clear한 후
				
				for (int i = 0; i < chatList.size(); i++) {
					
					//세션 종료한 유저 삭제
					if (chatList.get(i).containsValue(session)) {
						chatList.remove(i);
						System.out.println("세션 삭제 성공");

					}
				}
				System.out.println("DB 저장 성공");
				
			} else {
				System.out.println("DB 저장 실패");
				
			}
			
		} else {
			for (int i = 0; i < chatList.size(); i++) {
				
				//세션 종료한 유저 삭제
				if (chatList.get(i).containsValue(session)) {
					chatList.remove(i);
					System.out.println("세션 삭제 성공");

				}
			}
			
		}

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String chat_msg = message.getPayload();
						// admin&nbsp;&nbsp;오후 5:46:47<br>ㅇ

		//		0							1											2
		//"${chat.chat_seq} / ${chat.member_id} / "+today+"<br>" + msg + " / ${chat.member_seq}"
		String[] msg_split1 = chat_msg.split("&nbsp;&nbsp;");
		String[] msg_split2 = msg_split1[2].split("<br>");

		String chat_seq = msg_split1[0];
		String message_id = msg_split1[1];
		String member_seq = msg_split1[3];
		
		String message_time = msg_split2[0];
		String message_content = msg_split2[1];
		
		String time = parseTime.parseJStoJAVA(message_time);
		
		HashMap<String, String> message_map = new HashMap<String, String>();
		message_map.put("chat_seq", chat_seq);
		message_map.put("member_seq", member_seq);
		message_map.put("message_id", message_id);
		message_map.put("message_time", time);
		message_map.put("message_content", message_content);

		messageList.add(message_map);
		
		String isToday = parseTime.isToday(time);

		for (int i = 0; i < chatList.size(); i++) {

			if (chatList.get(i).containsKey(chat_seq)) {
				WebSocketSession s = chatList.get(i).get(chat_seq);
				
				String jsonMessage = "{\"message_id\":\"" + message_id + "\",\"message_time\":\"" + isToday + "\",\"message_content\":\"" + message_content + "\"}";

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
