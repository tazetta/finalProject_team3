package com.spring.main.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.main.dao.GroupDAO;
import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.GroupDTO;

public class DateInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	GroupDAO groupdao;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String currDate = format.format(date);  //현재시간
		System.out.println("cuurDate:"+currDate);
		Date utilDate = format.parse(currDate); //Date(java.util) 타입으로 변환
			
		System.out.println("*****************************");
		System.out.println("util 현재시간 확인: "+utilDate);
		ArrayList<GroupDTO> deadlineList = groupdao.deadlineChk();
		
		for (int i = 0; i < deadlineList.size(); i++) {
			Date deadline = deadlineList.get(i).getDeadline();
			int currUser = deadlineList.get(i).getCurrUser();
			int gpIdx = deadlineList.get(i).getGpIdx();
			int maxUser =  deadlineList.get(i).getMaxUser();

			if(deadline.before(utilDate) && maxUser>currUser) {
				System.out.println(deadline+" / "+utilDate);
				System.out.println("모집인원미달 & 마감기한 지남");
				System.out.println("gpIdx:"+gpIdx+"/ deadline:"+deadline+" /currUser:"+currUser);
				int updateProg = 2;
				int result = groupdao.progUpdate(gpIdx, updateProg);
				System.out.println("진행상황 결과:"+result);
			}
			
			
		}
		System.out.println("*****************************");
		
	}

}
