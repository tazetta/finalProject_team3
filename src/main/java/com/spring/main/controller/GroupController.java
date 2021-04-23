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

import com.spring.main.service.GroupService;

@Controller
public class GroupController {


	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GroupService groupService;

	@RequestMapping(value = "/groupListPage", method = RequestMethod.GET)
	public String home() {
		logger.info("공동구매 리스트로 이동");
		return "groupList";
	}
	
	@RequestMapping(value = "/groupWriteForm", method = RequestMethod.GET)
	public String groupWriteForm() {
		logger.info("공동구매 글쓰기 페이지로 이동");
		return "groupWriteForm";
	}
	
	@RequestMapping(value = "/groupWrite", method = RequestMethod.POST)
	public ModelAndView groupWrite( @RequestParam HashMap<String , String> params,HttpSession session) {
		logger.info("공동구매 글쓰기 요청");
		logger.info("params: {}" ,params);	
		return groupService.groupWrite(params, session);
	}
	
	@RequestMapping(value = "/groupDetail", method = RequestMethod.GET)
	public ModelAndView groupDetail(@RequestParam String gpIdx) {
		logger.info("공동구매 상세보기 요청: "+gpIdx);
		return groupService.detail(gpIdx);
	}
}
