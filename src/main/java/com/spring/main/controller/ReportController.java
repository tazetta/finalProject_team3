package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.ReportService;

@Controller
public class ReportController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReportService service;
	
	//업체 신고
	@RequestMapping(value = "/companyReportForm", method = RequestMethod.GET)
	public ModelAndView examWrcompanyReportForm(@RequestParam String comId) {
		logger.info("신고새창 페이지로 이동");
		ModelAndView mav = new ModelAndView();
		mav.addObject("comId",comId);
		mav.setViewName("companyReportForm");
		return mav;
	}
	
	@RequestMapping(value = "/companyReport", method = RequestMethod.POST)
	public ModelAndView companyReport(@RequestParam HashMap<String , String> params) {
		logger.info("신고요청");
		return service.companyReport(params);
	}
	
}
