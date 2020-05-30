package com.jungchiro.poli.search.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungchiro.poli.search.model.biz.SearchBiz;

@Controller
public class SearchController {
	
	@Autowired
	private SearchBiz biz;
	
	@RequestMapping("/search.do")
	public String search(String keyword, Model model) throws Exception {
		//http://52.231.155.109:9200/test/_doc/_search?q=title:%EC%A3%BC%ED%98%B8%EC%98%81&pretty
		String search = URLEncoder.encode(keyword, "UTF-8");
		
		//////////////////////////////////title_start///////////////////////////////////////////////////
		String title_addr = "http://52.231.155.109:9200/test/_doc/_search?q=title:"+search+"&pretty";
		URL title_url = new URL(title_addr);
		URLConnection title_conn = title_url.openConnection();
		
		BufferedReader title_br = new BufferedReader(new InputStreamReader(title_conn.getInputStream()));
		StringBuilder title_sb = new StringBuilder();
		String title_res = "";
        
		while ((title_res = title_br.readLine()) != null) {
            title_sb.append(title_res);
        }
		
		JSONObject title_obj = new JSONObject(title_sb.toString());
		//System.out.println(title_obj.toString());
		title_br.close();
		
		List<HashMap<String, String>> titleList = biz.searchTitle(title_obj);
		model.addAttribute("titleList", titleList);
		
		//////////////////////////////////title_end///////////////////////////////////////////////////
		
		//////////////////////////////////content_start///////////////////////////////////////////////////
		String content_addr = "http://52.231.155.109:9200/test/_doc/_search?q=content:"+search+"&pretty";
		URL content_url = new URL(content_addr);
		URLConnection content_conn = content_url.openConnection();
		
		BufferedReader content_br = new BufferedReader(new InputStreamReader(content_conn.getInputStream()));
		StringBuilder content_sb = new StringBuilder();
		String content_res = "";
		
		while ((content_res = content_br.readLine()) != null) {
			content_sb.append(content_res);
		}
		
		JSONObject content_obj = new JSONObject(content_sb.toString());
		//System.out.println(content_obj.toString());
		content_br.close();
		System.out.println(content_obj.toString(4));
		//////////////////////////////////content_end///////////////////////////////////////////////////
		
		
		
		return "search/search";
	}

}
