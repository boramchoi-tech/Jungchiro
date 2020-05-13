package com.jungchiro.poli.notification.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.async.AsyncRequestTimeoutException;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitter;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.jungchiro.poli.notification.model.biz.NotificationBiz;
import com.jungchiro.poli.notification.model.biz.replyNotificationBiz;

@RestController
@RequestMapping("/notification.do")
public class NotificationController {
	
	@Autowired
	private final NotificationBiz biz;
	@Autowired
	private final replyNotificationBiz rebiz;
	
	public NotificationController(NotificationBiz biz) {
		this.rebiz = null;
		this.biz = biz;
	}
	
	// 데이터가 들어오면 produces = "text/event-stream" 스트림 형식으로 반환
	@GetMapping(value = "/user/push", produces = "text/event-stream")
	public ResponseEntity<ResponseBodyEmitter> fetchNotify(@RequestParam(required = false) int member_seq){
	
		System.out.println("컨트롤러 들어왔다! member_seq : " + member_seq);
		
		if(member_seq == 0) {
			System.out.println("[error] : member_seq가 컨트롤러로 들어오지 않음");
		}
		
		// 내 게시물에 달린 댓글 중 읽지않음('N') 카운트
		int res = rebiz.countReplyNotification(member_seq);
				
		final SseEmitter emitter = biz.subscribe(res);
					
		return new ResponseEntity<>(emitter, HttpStatus.OK);
	}
	
	// timeout마다 에러 로그 찍는 것 방지
	@ExceptionHandler(value = AsyncRequestTimeoutException.class)
	public String asyncTimeout(AsyncRequestTimeoutException e) {
		return "SSE timeout...";
	}

}
