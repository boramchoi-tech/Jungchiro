package com.jungchiro.poli.search.model.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class SearchBiz {
	
	public List<HashMap<String, String>> search(JSONObject obj) {
		
		List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		int value = obj.getJSONObject("hits").getJSONObject("total").getInt("value");
		
		if (value != 0) {
			JSONArray tmp = obj.getJSONObject("hits").getJSONArray("hits");
			
			for (int i = 0; i < tmp.length() ; i++) {
				String img = tmp.getJSONObject(i).getJSONObject("_source").getString("img");
				String title = tmp.getJSONObject(i).getJSONObject("_source").getString("title");
				String content = tmp.getJSONObject(i).getJSONObject("_source").getString("content");
				String url = tmp.getJSONObject(i).getJSONObject("_source").getString("url");
				
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("img", img);
				map.put("title", title);
				map.put("content", content);
				map.put("url", url);
				
				list.add(map);
			}
		
		} else {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("res", "검색 결과가 존재하지 않습니다.");
			list.add(map);
		}
		
		return list;
	}

}
