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
	
		Date tempTime = null;
		try {
			tempTime = beforeFormat.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy/MM/dd aa hh:mm:ss");
		String parseTime = afterFormat.format(tempTime);

		return parseTime;
	}
	
	// 날짜 판별해서 yyyy/MM/dd로 리턴할지 aa hh:mm:ss로 리턴할지 판별
	public String isToday(String time) {

		//0   1   2  3         4   5
		//Thu May 21 23:52:49 KST 2020
		Date today = new Date();
		
		SimpleDateFormat tempFormat = new SimpleDateFormat("yyyy/MM/dd");
		String tmpToday = tempFormat.format(today);							//오늘 날짜를 yyyy/MM/dd(String)으로 변환
		
		SimpleDateFormat stringToDate = new SimpleDateFormat("yyyy/MM/dd aa hh:mm:ss");
		Date tmpDate = null;
		try {
			tmpDate = stringToDate.parse(time);						// parameter를 Date형으로 변환
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String compareDate = tempFormat.format(tmpDate);			//parameter를 yyyy/MM/dd(String)으로 변환
		
		SimpleDateFormat returnFormat = new SimpleDateFormat("aa hh:mm");
		String returnDate = returnFormat.format(tmpDate);					// Date형으로 변환한 parameter를 aa hh:mm(String)으로 변환
		
		if (tmpToday.equals(compareDate)) {				// 같다면 시간만 리턴
			return returnDate;
			
		} else {
			return compareDate;							// 아니라면 날짜만 리턴
			
		}
		
	}

}
