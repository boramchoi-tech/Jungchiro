package com.jungchiro.poli.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


public class LoginFailureHandler implements AuthenticationFailureHandler {

	private String loginId;
	private String loginPwd;
	private String errorMsg;
	private String defaultFailureUrl;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		if(exception instanceof BadCredentialsException || exception instanceof InternalAuthenticationServiceException
		   || exception instanceof UsernameNotFoundException) {
			errorMsg  = "아이디나 비밀번호가 맞지 않습니다.";
		} else if(exception instanceof DisabledException) {
			errorMsg = "탈퇴(혹은 차단)된 아이디입니다.<br/>"+ "관리자에게 문의하세요";
		}
		
		request.setAttribute("loginId", request.getParameter("loginId"));
		request.setAttribute("loginPwd", request.getParameter("loginPwd"));
		request.setAttribute("errorMsg", errorMsg);
		
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
		
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}
	
	
	

}
