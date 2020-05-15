package com.jungchiro.poli.login.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.jungchiro.poli.login.model.dao.UserAuthDAO;
import com.jungchiro.poli.login.model.dto.CustomUserDetails;

public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserAuthDAO userAuthDAO;
	

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("service왔다");
		CustomUserDetails user = userAuthDAO.getUserById(username);
		
		if(user==null) {
			throw new UsernameNotFoundException(username);
		}
		
		return user;
	}

}
