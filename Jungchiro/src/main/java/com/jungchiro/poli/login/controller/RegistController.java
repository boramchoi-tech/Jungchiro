package com.jungchiro.poli.login.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jungchiro.poli.login.model.biz.RegistBiz;
import com.jungchiro.poli.login.model.dto.LoginDto;

@Controller
public class RegistController {
	
	@Autowired
	private RegistBiz biz;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/regist.do", method=RequestMethod.POST)
	public String regist(LoginDto dto) {
		
		boolean registRes = false;
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		int res = biz.regist(dto);

		if (res == 1) {
			System.out.println("회원가입 성공");
			return "main";
		} else {
			System.out.println("회원가입 실패");
			return "main";
		}
		
	}
	@RequestMapping(value="/idChk.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Integer> idCheck(@RequestBody LoginDto dto) {
		int res = biz.idChk(dto.getMember_id());
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("idChk", res);
		
		return map;
	}
	
	@RequestMapping(value="/emailChk.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Integer> emailCheck(@RequestBody LoginDto dto) {
		int res = biz.emailChk(dto.getMember_email());

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("emailChk", res);
		
		return map;
	}
	
	
	@RequestMapping(value="/emailAuth.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, String> emailAuthentication(@RequestBody LoginDto dto) throws UnsupportedEncodingException, MessagingException {
		String key = biz.emailAuth(dto.getMember_email());
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("emailAuthNum", key);
		
		return map;
	}
	
	
	

}
