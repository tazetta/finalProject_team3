package com.spring.main.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	// 이곳은 logger 적용이 안됨

	// 컨트롤러 접근 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("controller 요청 전");
		boolean pass = false; //false가 반환되면 컨트롤러 접근이 불가
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginId") ==null) {
			System.out.println("로그인 처리 안되어있음(logout상태) ");
			response.sendRedirect("/main/");
		}else {
			System.out.println("로그인 처리 되어있음(login상태)");
			pass=true;
		}
		return pass;
	}


}
