package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.AdminService;

@Controller
public class AdminController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;
	
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public ModelAndView adminMain() {
		logger.info("관리자 메인페이지로 이동");
		return service.cntNewMember();
	}
	
	@RequestMapping(value = "/adminCompanyDetail", method = RequestMethod.GET)
	public String adminCompanyDetail() {
		logger.info("업체회원 상세보기 메인페이지로 이동");
		return "adminCompanyDetail";
	}
	
}
