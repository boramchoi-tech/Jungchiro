package com.jungchiro.poli.login.model.dto;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails {

	private int member_seq;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String member_sns;
	private String member_enable;
	private String member_role;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(member_role));
		return auth;
	}

	@Override
	public String getPassword() {
		return member_pw;
	}

	@Override
	public String getUsername() {
		return member_id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		// enable컬럼을 String으로 설정해서 오버라이딩해서 안씀
		return false;
	}

	
	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_sns() {
		return member_sns;
	}

	public void setMember_sns(String member_sns) {
		this.member_sns = member_sns;
	}

	public String getMember_enable() {
		return member_enable;
	}

	public void setMember_enable(String member_enable) {
		this.member_enable = member_enable;
	}
	
	

}
