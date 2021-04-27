package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CompanyController {


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
	@RequestMapping(value = "/cMreviewlist", method = RequestMethod.GET)
	public String cMreviewlist() {
		logger.info("업체시공리뷰홈페이지");
		return "cMreviewlist";
	}
	
	
}