package com.spring.main.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dto.MemberDTO;

@Service
public class AdminService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminDAO dao;
	
	public ModelAndView cntNewMember() {
		ModelAndView mav = new ModelAndView();
		String sqlDate = new SimpleDateFormat("yy/MM/dd").format(new Date(System.currentTimeMillis()));
		logger.info("date:{}",sqlDate);
		int cnt = dao.cntNewMember("21/04/23");
		logger.info("오늘 가입자 수: {} ", cnt);
		
		ArrayList<MemberDTO> list = dao.listNewMember("21/04/23");
		logger.info("오늘 가입자 ID : {}", list.size());
		mav.addObject("newMemberList", list);
		mav.addObject("cnt", cnt);
		mav.setViewName("adminMain");
		
		return mav;
	}
	
}
