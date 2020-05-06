package com.jungchiro.poli.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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

	@RequestMapping("/login.do")
	public String loginCheck(HttpSession session, Model model, LoginDto dto) {
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
		return "main";
	}
}
