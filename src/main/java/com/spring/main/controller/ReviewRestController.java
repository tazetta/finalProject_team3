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
	public ModelAndView index(@RequestParam String comId,@RequestParam float rate) {
		logger.info("리뷰 페이지 이동");
		ModelAndView mav = new ModelAndView();
		mav.addObject("comId", comId);
		mav.addObject("rate", rate);
		mav.setViewName("reviewList");
		return mav;
	}
	
	//list/보여줄개수/페이지
	@RequestMapping(value = "/reviewList/{page}/{comId}", method = RequestMethod.GET)
	public HashMap<String, Object> reviewList(@PathVariable int page,@PathVariable String comId) {
		logger.info("page:{}",page);
		return service.list(page,comId);
	}
	
	@RequestMapping(value = "/cMreviewlist", method = RequestMethod.GET)
	public ModelAndView cMreviewlist() {
		logger.info("업체시공리뷰홈페이지");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cMreviewlist");
		return mav;
	}
	
	@RequestMapping(value = "/cMreviewList/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> cMreviewList(HttpSession session, @PathVariable int page) {
		logger.info("page:{}",page);
		String comId = (String) session.getAttribute("cLoginId");
		logger.info("업체 아이디:{}",comId);
		return service.list(page,comId);
	}
	
}
