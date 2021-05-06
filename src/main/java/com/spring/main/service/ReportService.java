package com.spring.main.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ReportService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ModelAndView companyReport(HashMap<String, String> params) {
		logger.info("신고요청 서비스 : "+params);
		
		return null;
	}

}
