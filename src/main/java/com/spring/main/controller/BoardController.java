package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.AdminService;
import com.spring.main.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired BoardService BoardService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;
	
	@RequestMapping(value = "/FAQ", method = RequestMethod.GET)
	public String home() {
		logger.info("고객센터페이지입니다.");
		return "FAQ";
	}
	@RequestMapping(value = "/FAQsend", method = RequestMethod.GET)
	public String FAQsend() {
		return "FAQsend";
	}
	@RequestMapping(value = "/mainnavi", method = RequestMethod.GET)
	public String mainnavi() {
		return "mainnavi";
	}
	@RequestMapping(value = "/examlist", method = RequestMethod.GET)
	public String examlist() {
		logger.info("시공사례리스트");
		return "examlist";
	}
	@RequestMapping(value = "/boarddetail", method = RequestMethod.GET)
	public ModelAndView boarddetail(@RequestParam String boardIdx) {
		logger.info("게시글idx{}상세보기",boardIdx);
		return BoardService.boarddetail(boardIdx);
	}
	
}