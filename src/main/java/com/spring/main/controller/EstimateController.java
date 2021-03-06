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

import com.spring.main.service.EstimateService;

@Controller
public class EstimateController {


	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired EstimateService service;
	
	
	@RequestMapping(value = "/estimatelist", method = RequestMethod.GET)
	public String estimatelist() {
		logger.info("견적서보는홈페이지");
		return "estimatelist";
	}
	
	@RequestMapping(value = "/estimateWriteForm", method = RequestMethod.GET)
	public ModelAndView estimateWriteForm(HttpSession session, @RequestParam String comId ) {
		logger.info("인테리어업체 견적서보내기 페이지로 이동");
		ModelAndView mav = new ModelAndView();
		mav.addObject("comId", comId);
		mav.setViewName("estimateWriteForm");
		return mav;
	}
	
	@RequestMapping(value = "/estimateWrite", method = RequestMethod.POST)
	public ModelAndView estimateWrite( @RequestParam HashMap<String , String> params) {
		logger.info("견적서 글쓰기 요청");
		logger.info("params: {}" ,params);	
		return service.estimateWrite(params);
	}
	
	@RequestMapping(value = "/estimateDetail", method = RequestMethod.GET)
	public ModelAndView estimateDetail( @RequestParam String estIdx) {
		logger.info("견적서 상세보기 요청");
		logger.info("견적서 번호: {}" ,estIdx);	
		return service.estimateDetail(estIdx);
	}

}
