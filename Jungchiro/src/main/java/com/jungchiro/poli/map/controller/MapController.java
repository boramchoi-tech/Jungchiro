package com.jungchiro.poli.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungchiro.poli.map.model.dao.PollsDao;
import com.jungchiro.poli.map.model.dto.PollsDto;

@Controller
public class MapController {

	@Autowired
	private PollsDao dao;
	
	@RequestMapping("/map.do")
	public String map() {
		return "map/map";
	}
	
	
	@RequestMapping("/poll.do")
	public String poll() {
		
		List<PollsDto> plist = dao.findByLocationNear();
		System.out.println(plist.size());
		for(PollsDto dto : plist) {
			System.out.println(dto);
		}
		
		return "";
	}
	
}
