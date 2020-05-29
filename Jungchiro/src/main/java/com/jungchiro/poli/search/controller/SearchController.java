package com.jungchiro.poli.search.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonParser;

@Controller
public class SearchController {
	
	@RequestMapping("/search.do")
	public String search(String keyword) throws Exception {
		//http://52.231.155.109:9200/test/_doc/_search?q=title:%EC%A3%BC%ED%98%B8%EC%98%81&pretty
		String search = URLEncoder.encode(keyword, "UTF-8");
		
		String title_addr = "http://52.231.155.109:9200/test/_doc/_search?q=title:"+search+"&pretty";
		URL title_url = new URL(title_addr);
		URLConnection conn = title_url.openConnection();
		
		BufferedReader title_br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	
		String title_res;
		

/*			
 * 
 * String jsonStr = "{"
			+ "		code:'1000',"
			+ "		name:'포도'"
			+ "}"

JSONParser parser = new JSONParser();
Object obj = parser.parse( jsonStr );
JSONObject jsonObj = (JSONObject) obj;
String code = (String) jsonObj.get("code");
String name = (String) jsonObj.get("name");
		*/
		
		while ((title_res = title_br.readLine()) != null) {
			System.out.println(title_res);
			//JsonParser parser = new JsonParser();
			//Object obj = parser.
			
		}
		title_br.close();
		
		
		/*
		InputStream is = null;
		try {
		    is = new URL(addr).openStream();
		    BufferedReader rd = new BufferedReader(new InputStreamReader(is, "UTF-8"));
		    String str;
		    StringBuffer buffer = new StringBuffer();
		    while ((str = rd.readLine()) != null) {
		        buffer.append(str);
		    }
		    String receiveMsg = buffer.toString();
		    System.out.println(receiveMsg);
		} catch (IOException e) {
		    e.printStackTrace();
		}*/


		
		/*
		URL url = new URL(addr);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Content-type", "application/json");
		
		BufferedReader rd = null;
		if (con.getResponseCode() >= 200 && con.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		
		StringBuilder sb = new StringBuilder();
        String line = "";
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        con.disconnect();
        
        System.out.println(sb.toString());*/
		
		return "";
	}

}
