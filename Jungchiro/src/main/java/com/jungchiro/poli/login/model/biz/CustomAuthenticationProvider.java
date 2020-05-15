package com.jungchiro.poli.login.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.jungchiro.poli.login.model.dto.CustomUserDetails;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private UserDetailsService userDetailsService;
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		System.out.println(username+","+password);
		
		CustomUserDetails user =  (CustomUserDetails) userDetailsService.loadUserByUsername(username);

		if(!matchPassword(password, user.getPassword())) {
			throw new BadCredentialsException(username);
		}
		
		if(!user.getMember_enable().equals("enabled")) {
			throw new BadCredentialsException(username);
		}
		System.out.println(user.getMember_name());
		
		return new UsernamePasswordAuthenticationToken(user, password, user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		//다른 조건이 없으면 무조건 해당 provider 입장 
		return true;
	}
	
	private boolean matchPassword(String loginPwd, String password) {
		return loginPwd.equals(password);
	}

}
