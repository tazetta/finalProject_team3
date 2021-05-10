package com.spring.main.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.BoardService;


@Controller
public class HomeController {
	
	private  Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	BoardService BoardService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		logger.info("main");
		ModelAndView mav = new ModelAndView();

		// 사진 있는 3개 데이터
		mav.addObject("list", BoardService.getMainhomeListLimit3());
		mav.setViewName("main");
		
		return mav;
	}
	
}
