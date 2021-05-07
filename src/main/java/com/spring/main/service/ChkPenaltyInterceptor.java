package com.spring.main.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.MemberDTO;

public class ChkPenaltyInterceptor extends HandlerInterceptorAdapter {


	@Autowired
	MemberDAO dao;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginId:" + loginId);

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yy/MM/dd");
		cal.setTime(new Date(System.currentTimeMillis()));
		String toDay = df.format(cal.getTime());
		System.out.println("toDay : " + toDay);

		if (dao.isPenalty(loginId) != null) {
			MemberDTO dto = dao.isPenalty(loginId);
			Date endDay = dto.getEndDay();
			String strEndDay = df.format(endDay);
			System.out.println("endDay : " + strEndDay);

			if (strEndDay.equals(toDay)) {
				System.out.println("같음");
				int delPenalty = dao.delPenalty(loginId);
				int stateUpdate = dao.updateState(loginId);
				System.out.println("패널티 제거 : " + delPenalty + "상태업데이트 : " + stateUpdate);
			}
		}
	}

}
