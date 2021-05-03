package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
		return service.adminMain();
	}
	
	@RequestMapping(value = "/adminMemberDetail/{id}", method = RequestMethod.GET)
	public ModelAndView adminMemberDetail(@PathVariable String id) {
		logger.info("관리자 일반회원 상세보기 {} ",id);
		return service.memberDetail(id);
	}
	
	@RequestMapping(value = "/adminCompanyList", method = RequestMethod.GET)
	public String adminCompanyList() {
		logger.info("관리자 일반회원 목록보기");
		return "adminCompanyList";
	}
	
	@RequestMapping(value = "/adminCompanyDetail", method = RequestMethod.GET)
	public String adminCompanyDetail() {
		logger.info("관리자 업체회원 상세보기");
		return "adminCompanyDetail";
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
	
	@RequestMapping(value = "/adminReportedBrdList", method = RequestMethod.GET)
	public String adminReportedBrdList() {
		logger.info("신고된 게시글 리스트");
		return "adminReportedBrdList";
	}
	
	@RequestMapping(value = "/adminReportedCommList", method = RequestMethod.GET)
	public String adminReportedCommList() {
		logger.info("신고된 댓글 리스트");
		return "adminReportedCommList";
	}
	
	@RequestMapping(value = "/NewFile", method = RequestMethod.GET)
	public String NewFile() {
		logger.info("NewFile");
		return "NewFile";
	}

}
