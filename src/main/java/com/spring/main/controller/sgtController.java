package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class sgtController {


	private Logger logger = LoggerFactory.getLogger(this.getClass());


	@RequestMapping(value = "/FAQ", method = RequestMethod.GET)
	public String home() {
		logger.info("고객센터페이지입니다.");
		return "FAQ";
	}


}
