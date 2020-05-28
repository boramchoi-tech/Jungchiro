package com.jungchiro.poli.login.model.biz;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.login.common.MailHandler;
import com.jungchiro.poli.login.common.TempKey;
import com.jungchiro.poli.login.model.dao.RegistDao;
import com.jungchiro.poli.login.model.dto.LoginDto;

@Service
public class RegistBizImpl implements RegistBiz {
	
	@Autowired
	private RegistDao dao;
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public int regist(LoginDto dto) {
		return dao.regist(dto);
	}
	
	@Override
	public int idChk(String member_id) {
		return dao.idChk(member_id);
	}

	@Override
	public int emailChk(String member_email) {
		return dao.emailChk(member_email);
	}
	
	@Override
	public String emailAuth(String member_email) throws MessagingException, UnsupportedEncodingException {
		String key = "";
		
		key = new TempKey().getKey(8, false); // 인증키 생성
		MailHandler sendMail = new MailHandler(mailSender);
		String content =
	            " 인증번호는 [<b>" +key+ "</b>] 입니다. <br/>"
	            +"받으신 인증번호를 홈페이지에 입력해 주시면 회원가입이 가능합니다."; 

		sendMail.setSubject("[정치로 서비스 이메일 인증]");
		sendMail.setText(content);
		sendMail.setFrom("mkbiz94@gmail.com", "정치로");
		sendMail.setTo(member_email);
		sendMail.send();
		
		return key;
	}

}
