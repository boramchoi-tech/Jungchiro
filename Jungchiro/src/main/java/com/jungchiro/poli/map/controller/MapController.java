package com.jungchiro.poli.map.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	public List<PollsDto> poll(@RequestBody Map<String, Double> param){

		double lng = param.get("lat");
		double lat = param.get("lng");
		List<PollsDto> plist = dao.findByLocationNear(lat, lng);
		
		return plist;
	}
	
}
