package com.spring.main.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.ExamService;

@RestController
public class ExamRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ExamService examService;
	
	@RequestMapping(value = "/interiorexamList", method = RequestMethod.GET)
	public ModelAndView index(Model model) {
		logger.info("리뷰 페이지 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("interiorexamList");
		return mav;
	}
	
	//list/보여줄개수/페이지
	//@PathVariable : 경로에 있는 변수 받기
	@RequestMapping(value = "/interiorexamList/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> reviewList(@PathVariable int page) {
		logger.info("page:{}",page);
		return examService.list(page);
	}
	
}
