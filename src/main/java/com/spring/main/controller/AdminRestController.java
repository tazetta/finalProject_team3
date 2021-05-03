package com.spring.main.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.AdminService;

@RestController
public class AdminRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;
	
	@RequestMapping(value = "/adminMemberList", method = RequestMethod.GET)
	public ModelAndView adminMemberlist(Model model) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminMemberList");
		return mav;
	}

	@RequestMapping(value = "/adminMemberIndex", method = RequestMethod.GET)
	public ModelAndView adminMemberIndex(Model model) {
		logger.info("adminMemberIndex");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminMemberList");
		return mav;
	}

	@RequestMapping(value = "/adminMemberList/{pagePerCnt}/{page}/{gradeIdx}/{stateIdx}/{searchId}", method = RequestMethod.GET)
	public HashMap<String, Object> list(@PathVariable int pagePerCnt, @PathVariable int page, @PathVariable String gradeIdx, @PathVariable String stateIdx, @PathVariable String searchId) {
		logger.info("pagePerCtn : {} / page : {}", pagePerCnt, page);
		logger.info("gradeIdx : {} ", gradeIdx);
		logger.info("stateIdx : {}", stateIdx);
		logger.info("searchId : {}", searchId);
		return service.list(pagePerCnt,page,gradeIdx, stateIdx, searchId);
	}
	
	
}
