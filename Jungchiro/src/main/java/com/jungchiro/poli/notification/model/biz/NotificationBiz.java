package com.jungchiro.poli.notification.model.biz;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Service
public class NotificationBiz {
	
	private final List<SseEmitter> emitters = new ArrayList<>();
	
	public SseEmitter subscribe(int reply) {
		
		System.out.println("NotificationBiz 들어왔다!");
		System.out.println("reply : " + reply);
		
		SseEmitter emitter = new SseEmitter();
		
		emitter.onCompletion(() -> emitters.remove(emitter));
		emitter.onTimeout(() -> emitters.remove(emitter));
		emitters.add(emitter);
		
		postMessage(reply);
		
		return emitter;
	}
	
	private void postMessage(int reply) {
		List<SseEmitter>deadEmitters = new ArrayList<>();
		emitters.forEach(emitter -> {
			try {
			// SseEmitter.event().name("eventName").data(...)
			// 이런식으로 이벤트명을 정의 할 수 있음
			// .data(DATE_FORMATTER.format(new Date()) + " : " + UUID.randomUUID().toString()));
			emitter.send(SseEmitter.event().data("reply  : " + reply));
			} catch (IOException e) {
				deadEmitters.add(emitter);
			}
		});
		emitters.removeAll(deadEmitters);
	}

}
