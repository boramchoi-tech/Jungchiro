package com.jungchiro.poli.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jungchiro.poli.login.model.biz.LoginBiz;
import com.jungchiro.poli.login.model.dto.LoginDto;

@Controller
public class LoginController {
	
	@Autowired
	private LoginBiz biz;
	
	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}

	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> loginCheck(HttpSession session, @RequestBody LoginDto dto) {
		LoginDto loginDto = biz.selectMember(dto);
		boolean loginCheck = false;
		
		if (loginDto != null) {
			session.setAttribute("loginDto", loginDto);
			loginCheck = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("loginCheck", loginCheck);
		
		return map;
		
		//model.addAttribute(biz.selectMember(dto));
		/*
		LoginDto loginDto = biz.selectMember(dto);
		System.out.println(loginDto);
		
		if (loginDto != null) {
			System.out.println("로그인 성공");
			session.setAttribute("loginSession", loginDto);
			
			return "main";
		} else {
			System.out.println("실패");
			
			return "main";
		}*/
	}
}
