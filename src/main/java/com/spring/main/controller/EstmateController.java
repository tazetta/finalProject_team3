package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EstmateController {


	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/estimatelist", method = RequestMethod.GET)
	public String estimatelist() {
		logger.info("견적서보는홈페이지");
		return "estimatelist";
	}

}
