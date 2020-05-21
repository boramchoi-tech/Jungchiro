package com.jungchiro.poli.chat.model.biz;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Service;

@Service
public class ParseTime {
	
	//javascript에서 보낸 new Date()를 oracle에서 쓸 수 있게 parsing
	public String parseJStoJAVA(String message_time) {
		
		//			 0   1   2  3         4       5            6
		//			 Thu May 21 2020 19:13:19 GMT+0900 (대한민국 표준시)
		String parse[] = message_time.split(" ");
		String time = parse[0] + " " + parse[1] + " " + parse[2] + " " + parse[3] + " " + parse[4];
		
		SimpleDateFormat beforeFormat = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss", Locale.ENGLISH);
		//SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.ENGLISH);
		
		Date tempTime = null;
		
		try {
			tempTime = beforeFormat.parse(time);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return "";
	}

}
