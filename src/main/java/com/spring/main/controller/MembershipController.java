package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class MembershipController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());


	@RequestMapping(value = "/membership", method = RequestMethod.GET)
	public String home() {
		logger.info("멤버쉽 서비스 요청");
		return "login";
	}
}
