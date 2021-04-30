package com.spring.main.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.main.dao.MemberDAO;

public class MemberInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	MemberDAO memberdao;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		
		String url = request.getRequestURI().substring(request.getContextPath().length());
		
		String loginId = (String) session.getAttribute("loginId");
		
		System.out.println("*****************************");
		System.out.println("url: "+url);
		System.out.println("loginID:" + loginId);
		int  cntResult = 0;
		if(url.contains("comm")||url.contains("Comm")) {
			System.out.println("cntComm+1");
			cntResult = memberdao.gradeCntComm(loginId); //회원등급 댓글 카운트
		}else {
			System.out.println("cntBoard+1");
			cntResult = memberdao.gradeCntBoard(loginId); // 회원등급 글 카운트
		}
		System.out.println("result:" + cntResult);
		System.out.println("*****************************");
		
	}

}
