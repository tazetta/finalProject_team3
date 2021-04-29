package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/myInteriorHistory", method = RequestMethod.GET)
	public String adminMain() {
		logger.info("인테리어변천사");
		return "myInteriorHistory";
	}
	
	@RequestMapping(value = "/mynavi", method = RequestMethod.GET)
	public String mynavi() {
		logger.info("마이페이지 네비게이션");
		return "mynavi";
	}
}
