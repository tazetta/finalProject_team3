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
		logger.info("관리자 메인페이지");
		return service.cntNewMember();
	}
	
	@RequestMapping(value = "/adminMemberList", method = RequestMethod.GET)
	public String adminMemberList() {
		logger.info("관리자 일반회원 목록보기");
		return "adminMemberList";
	}
	
	@RequestMapping(value = "/adminMemberDetail", method = RequestMethod.GET)
	public String adminMemberDetail() {
		logger.info("관리자 일반회원 상세보기");
		return "adminMemberDetail";
	}

	
	@RequestMapping(value = "/adminSoundList", method = RequestMethod.GET)
	public String adminSoundList() {
		logger.info("관리자 고객의 소리 리스트 페이지로 이동");
		return "adminSoundList";
	}
	
	@RequestMapping(value = "/adminSoundDetail", method = RequestMethod.GET)
	public String adminSoundDetail() {
		logger.info("관리자 고객의 소리 상세보기 팝업");
		return "adminSoundDetail";
	}
	
	@RequestMapping(value = "/NewFile", method = RequestMethod.GET)
	public String NewFile() {
		logger.info("NewFile");
		return "NewFile";
	}

}
