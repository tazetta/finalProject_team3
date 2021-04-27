package com.spring.main.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.CompanyMemberDTO;
import com.spring.main.dto.MemberDTO;

@Service
public class MemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberDAO dao;
	
	
	public boolean login(String id, String pw) {
		
		String encrypt_pass = dao.login(id);
		logger.info(pw + " == " + encrypt_pass);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
		logger.info("success {} " , encrypt_pass);
		return encoder.matches(pw, encrypt_pass);
	}



	public int overlay(HashMap<String, String> params) {
		return dao.overlay(params);
	}



	public int join(HashMap<String, String> params) {
		
		String plain = params.get("pw");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encrypt = encoder.encode(plain);
		logger.info(plain  + "=>" + encrypt);
		params.put("pw", encrypt);
		
		return dao.join(params);
	}



	public String idFind(HashMap<String, String> params) {
		
		return dao.idFind(params);
	}



	public String comIdFind(HashMap<String, String> params) {
		
		return dao.comIdFind(params);
	}



	public MemberDTO pwFind(HashMap<String, String> params) {

		return dao.pwFind(params);
	}



	public CompanyMemberDTO comPwFind(HashMap<String, String> params) {
		
		return dao.comPwFind(params);
	}

}
