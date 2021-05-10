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

import com.spring.main.service.ExamService;
import com.spring.main.service.ReviewService;

@RestController
public class ExamRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ExamService examService;
	
	@RequestMapping(value = "/interiorexamList", method = RequestMethod.GET)
	public ModelAndView index(Model model) {
		logger.info("전문가인테리어 페이지 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("interiorexamList");
		return mav;
	}
	
	@RequestMapping(value = "/interiorCompanyDetail", method = RequestMethod.GET)
	public ModelAndView examWriteForm(HttpSession session,@RequestParam String comId ) {
		logger.info("인테리어업체 상세보기 페이지로 이동");
		return examService.interiorCompanyDetail(comId);
	}
	
	@RequestMapping(value = "/companyDetailExam", method = RequestMethod.GET)
	public ModelAndView companyDetailExam(@RequestParam String comId ) {
		logger.info("시공사례 전체보기 페이지로 이동");
		ModelAndView mav = new ModelAndView();
		mav.addObject("comId", comId);
		mav.setViewName("companyDetailExam");
		return mav;
	}
	@RequestMapping(value = "/examListScroll/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> examListScroll(@PathVariable int pagePerCnt, @PathVariable int page) {
		HashMap<String , Object> map = new HashMap<String, Object>();	
		logger.info("pagePerCnt :{}, page :{}",pagePerCnt, page);
		return examService.examListScroll(pagePerCnt, page);
	}
	
//	//list/보여줄개수/페이지
	@RequestMapping(value = "/comExamList/{page}/{comId}", method = RequestMethod.GET)
	public HashMap<String, Object> comExamList(@PathVariable int page, @PathVariable String comId) {
		logger.info("page:{} , comId:{}",page,comId);
		return examService.comExamList(page,comId);
	}
	
	@RequestMapping(value = "/estimatelist/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> estimatelist(@PathVariable int page,HttpSession session) {
		logger.info("page:{} , comId:{}",page);
		String comId = (String) session.getAttribute("cLoginId");
		return examService.estimatelist(page,comId);
	}
	
	@RequestMapping(value = "/examlist", method = RequestMethod.GET)
	public ModelAndView examlist() {
		logger.info("시공사례리스트 페이지 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("examlist");
		return mav;
	}
	
	@RequestMapping(value = "/examlist/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> examlist(@PathVariable int page,HttpSession session) {
		String comId = (String) session.getAttribute("cLoginId");
		logger.info("page:{} , comId:{}",page,comId);
		return examService.comExamList(page,comId);
	}
	
}
