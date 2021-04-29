package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.ReviewService;

@RestController
public class ReviewRestController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReviewService service;
	
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public ModelAndView index(@RequestParam String comId) {
		logger.info("리뷰 페이지 이동");
		ModelAndView mav = new ModelAndView();
		mav.addObject("comId", comId);
		mav.setViewName("reviewList");
		return mav;
	}
	
	//list/보여줄개수/페이지
	@RequestMapping(value = "/reviewList/{page}/{comId}", method = RequestMethod.GET)
	public HashMap<String, Object> reviewList(@PathVariable int page,@PathVariable String comId) {
		logger.info("page:{}",page);
		return service.list(page,comId);
	}
	
}
