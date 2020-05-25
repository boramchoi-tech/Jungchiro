package com.jungchiro.poli.notification.controller;

import java.util.List;
import java.util.UUID;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.jungchiro.poli.mypage.controller.MyPageController;
import com.jungchiro.poli.notification.model.biz.NotificationService;

@RestController
public class NotificationController {
	
	private Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private NotificationService service;
	
	final List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	
	// SseEmitter 객체 관리
	@GetMapping("/notification.do")
	public ResponseEntity<SseEmitter> notificationReply(HttpSession session,int member_seq) {
		
	
		logger.info("NOTIFICATION 들어왔다!");
		System.out.println("member_seq : " + member_seq);

		final SseEmitter emitter = new SseEmitter();
		service.addEmitter(emitter);
		service.getMember(member_seq);
		service.doNotify();
		emitter.onCompletion(() -> service.removeEmitter(emitter));
		emitter.onTimeout(() -> service.removeEmitter(emitter));
		
		return new ResponseEntity<>(emitter, HttpStatus.OK);
	}
		

}
