package com.spring.main.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.MemberDTO;

public class PenaltyInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	MemberDAO memberdao;
	AdminDAO admindao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("패널티 확인중....");
		boolean pass = false;
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginId:"+loginId);
			
		MemberDTO dto = admindao.checkPenalty(loginId);	
		int stateIdx = dto.getStateIdx();
		if(stateIdx == 0) {
			pass = true;
		}
		
		return pass;
	}
	
	
}
