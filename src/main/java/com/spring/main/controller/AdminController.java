package com.spring.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@RequestMapping(value = "/adminCompanyDetail/{comid}", method = RequestMethod.GET)
	public ModelAndView adminCompanyDetail(@PathVariable String comid) {
		logger.info("관리자 업체회원 상세보기");
		return service.companyDetail(comid);
	}
	
	@RequestMapping(value = "/adminSoundDetail/{boardIdx}", method = RequestMethod.GET)
	public ModelAndView adminSoundDetail(@PathVariable int boardIdx) {
		logger.info("관리자 고객의 소리 상세보기 팝업");
		return service.adminSoundDetail(boardIdx);
	}
	
	@RequestMapping(value = "/download/{oriFileName}/{newFileName}", method = RequestMethod.GET)
	public void download(@PathVariable String oriFileName, @PathVariable String newFileName, HttpServletResponse resp) {
		logger.info("ori : {} / new : {}",oriFileName, newFileName);
		service.download(oriFileName, newFileName, resp);
	}
}
