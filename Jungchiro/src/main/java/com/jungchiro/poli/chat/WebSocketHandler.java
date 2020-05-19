package com.jungchiro.poli.chat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler {
	
    // 접속한 유저들의 목록을 담기 위한 Map 선언
    // ConcurrentHashMap은 Hashtable과 유사하지만 멀티스래드 환경에서 더 안전하다
    /*
        ConcurrentHashMap에 대한 설명(반드시 읽고 숙지)

  https://docs.oracle.com/javase/7/docs/api/java/util/concurrent/ConcurrentHashMap.html
  http://blog.leekyoungil.com/?p=159
  http://limkydev.tistory.com/64
    */
    private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
    //private List<String> messageList = new ArrayList<String>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {

        // session에서 id를 가져와서 로그에 남긴다(없어도 되는 과정)
        log(session.getId() + " 연결 됨");

        // 위에서 선언한 users라는 map에 user를 담는 과정(필수)
        // map에 담는 이유는 메세지를 일괄적으로 뿌려주기 위해서이다
        users.put(session.getId(), session);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log(session.getId() + " 연결 종료됨");

        // map에서 세션에서 연결 종료된 유저를 없애는 이유는
        // 더 이상 메세지를 보낼 필요가 없기 때문에 목록에서 지우는 것이다
        users.remove(session.getId());
    }
    
	@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String time = message.getPayload();
		System.out.println(time);
		
		for (WebSocketSession s : users.values()) {
			s.sendMessage(message);
		}
		

        //log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		// 클라이언트로부터 메세지를 받으면 동작하는 handleTextMessage 함수
        // chatroom에서 wsocket.send(~~~)하면 동작함
        
        // 수신한 하나의 메세지를 users 맵에 있는 모든 유저(세션)들에게
        // 맵을 반복으로 돌면서 일일이 보내주게 되도록 처리
       // for (WebSocketSession s : users.values()) { //<-- .values() 로 session들만 가져옴
            
            // 여기서 모든 세션들에게 보내지게 된다
            // 1회전당 현재 회전에 잡힌 session에게 메세지 보낸다
        //    s.sendMessage(message);

            // 로그에 남기기 위한 것으로 큰 의미가 없음
            //log(s.getId() + "에 메시지 발송: " + message.getPayload());
      //  }
        
		/*
		 * System.out.println(session.getHandshakeHeaders());
		 * session.getHandshakeHeaders().getLocation();
		 */
        
		/*
		 * System.out.println(message.getPayload());
		 * 
		 * list.add(message.getPayload());
		 * 
		 * for (int i = 0; i < list.size() ; i++) { System.out.println(list.get(i)); }
		 */
        
        
		/*
		 * for (WebSocketSession s : users.values()) {
		 * s.sendMessage((WebSocketMessage<String>) list); }
		 */
		/*
		 * for (WebSocketSession s : users.values()) { s.sendMessage(message); }
		 */
        
		/*
		 * for (WebSocketSession s : users.values()) {
		 * 
		 * }
		 */
        
        
        /*
        // 클라이언트로부터 메세지를 받으면 동작하는 handleTextMessage 함수!
        // 수신한 하나의 메세지를 users 맵에 있는 모든 유저(세션)들에게
        // 맵을 반복으로 돌면서 일일이 보내주게 되도록 처리
        for (WebSocketSession s : users.values()) { //<-- .values() 로 session들만 가져옴
            
            // 여기서 모든 세션들에게 보내지게 된다
            // 1회전당 현재 회전에 잡힌 session에게 메세지 보낸다
            s.sendMessage(message);

            // 로그에 남기기 위한 것으로 큰 의미가 없음
            log(s.getId() + "에 메시지 발송: " + message.getPayload());
        }*/
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        log(session.getId() + " 익셉션 발생: " + exception.getMessage());
    }

    private void log(String logmsg) {
        System.out.println(new Date() + " : " + logmsg);
    }



}
