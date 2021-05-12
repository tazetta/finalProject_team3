package com.spring.main.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.MemberDTO;

public class PenaltyInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	AdminDAO admindao;

	@Autowired
	MemberDAO dao;

	@SuppressWarnings("null")

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("패널티 확인중....");
		boolean pass = false;
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		if(loginId != null) {
			System.out.println("loginId:" + loginId);
			String msg = "현재 작성금지 패널티 적용중입니다.";
			MemberDTO dto = admindao.checkPenalty(loginId);
			System.out.println(dto.getStateIdx());
			if (dto.getStateIdx() == 0) {
				pass = true;
			} else {
				String referer = request.getHeader("Referer");
				session.setMaxInactiveInterval(3);
				session.setAttribute("msg", msg);
				response.sendRedirect(referer);
			}
		} else {
			String msg = "로그인 후 사용해주세요";
			session.setMaxInactiveInterval(3);
			session.setAttribute("msg", msg);
			response.sendRedirect("./membership");
		}
		return pass;
	}


}
