package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class cMemController {


	private Logger logger = LoggerFactory.getLogger(this.getClass());


	@RequestMapping(value = "/companydetail", method = RequestMethod.GET)
	public String home() {
		logger.info("업체상세보기.");
		return "companydetail";
	}
	@RequestMapping(value = "/companynavi", method = RequestMethod.GET)
	public String mainnavi() {
		logger.info("업체네비바실행");
		return "companynavi";
	}
	@RequestMapping(value = "/estimatelist", method = RequestMethod.GET)
	public String estimatelist() {
		logger.info("견적서리스트");
		return "estimatelist";
	}
	@RequestMapping(value = "/cMreviewlist", method = RequestMethod.GET)
	public String cMreviewlist() {
		logger.info("시공리뷰");
		return "cMreviewlist";
	}
	@RequestMapping(value = "/examlist", method = RequestMethod.GET)
	public String examlist() {
		logger.info("시공리스트");
		return "examlist";
	}
	
}