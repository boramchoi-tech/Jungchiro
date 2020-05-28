package com.jungchiro.poli.news.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jungchiro.poli.news.dao.NewsMongoDao;
import com.jungchiro.poli.news.dto.NewsMongoDto;


@Controller
public class NewsController {
	
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	
	@Autowired
	private NewsMongoDao dao;

	@RequestMapping("/news.do")
	public String main(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );

		List<NewsMongoDto> list_h = dao.find_h();
		List<NewsMongoDto> list_d = dao.find_d();
		List<NewsMongoDto> list_j = dao.find_j();
		
		model.addAttribute("newslist_h", list_h);
		model.addAttribute("newslist_d", list_d);
		model.addAttribute("newslist_j", list_j);
				
		return "news/news";
	}
	
}
