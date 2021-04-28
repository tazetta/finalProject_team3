package com.spring.main.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.main.dao.MemberDAO;

@Service
public class MemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberDAO dao;
	
	
	public boolean login(String id, String pw) {
		logger.info("서비스 파람 : " + id , pw);
		
		String encrypt_pass = dao.login(id);
		logger.info(pw + " == " + encrypt_pass);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		return encoder.matches(pw, encrypt_pass);
	}



	public int overlay(HashMap<String, String> params) {
		return dao.overlay(params);
	}



	public int join(HashMap<String, String> params) {
		return dao.join(params);
	}
	


}
