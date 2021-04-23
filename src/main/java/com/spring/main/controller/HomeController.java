package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {


	private Logger logger = LoggerFactory.getLogger(this.getClass());


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("메인페이지");
		logger.info("김예지 완료");
		return "home";
	}


}
