package com.jungchiro.poli.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.SortOperation;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:main.do";
	}
	
	@RequestMapping(value = "/loginPage.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String login() {
		
		return "form/loginPage";
	}


	@RequestMapping(value="/login.do", method= {RequestMethod.POST, RequestMethod.GET})
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
	}
	
	// 회원탈퇴
	@RequestMapping(value="/dropId", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Boolean> dropId(LoginDto dto){
		
		int res = 0;
		boolean isDrop = false;
		
		// 회원탈퇴 메소드
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		if(res == 0) {
			isDrop = true;
			map.put("isDrop", isDrop);
		}
		
		return map;
	}
}
