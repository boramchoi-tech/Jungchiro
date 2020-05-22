package com.jungchiro.poli.notification.model.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.jungchiro.poli.notification.model.dao.NotificationDao;

@Service
@EnableScheduling
public class NotificationService {
	
	@Autowired
	private NotificationDao dao;
	
	final List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	final List<Integer> list = new ArrayList();
	
	public void addEmitter(final SseEmitter emitter) {
		emitters.add(emitter);
	}
	
	public void removeEmitter(final SseEmitter emitter) {
		emitters.remove(emitter);
	}
	
	public void getMember(int member_seq) {
		list.add(0, member_seq);
	}
	
	public void removeMember(int member_seq) {
		list.remove(member_seq);
	}
	
	// @Async
	@Scheduled(fixedRate = 10000)
	public void doNotify() { 
	
		List<SseEmitter> deadEmitters = new ArrayList();
		emitters.forEach(emitter -> {
			try {

				int res = dao.getNotification(list.get(0));
				
				if(res > 0) {					

				emitter.send(SseEmitter.event()
						.data(dao.getNotification(list.get(0))));
				
				} 
				
			} catch (Exception e) {
				deadEmitters.add(emitter);
			}
			
		});
			
			emitters.removeAll(deadEmitters);
					
	}
	
}
