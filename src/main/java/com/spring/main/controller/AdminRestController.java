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

import com.spring.main.service.AdminService;

@RestController
public class AdminRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;
	
	@RequestMapping(value = "/adminMemberList", method = RequestMethod.GET)
	public ModelAndView adminMemberlist(Model model) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminMemberList");
		return mav;
	}

	@RequestMapping(value = "/adminMemberList/{pagePerCnt}/{page}/{gradeIdx}/{stateIdx}/{searchId}", method = RequestMethod.GET)
	public HashMap<String, Object> list(@PathVariable int pagePerCnt, @PathVariable int page, @PathVariable String gradeIdx, @PathVariable String stateIdx, @PathVariable String searchId) {
		logger.info("pagePerCtn : {} / page : {}", pagePerCnt, page);
		logger.info("gradeIdx : {} ", gradeIdx);
		logger.info("stateIdx : {}", stateIdx);
		logger.info("searchId : {}", searchId);
		return service.list(pagePerCnt,page,gradeIdx, stateIdx, searchId);
	}
	
	@RequestMapping(value = "/adminPenaltyCfm/{id}/{stateIdx}", method = RequestMethod.GET)
	public HashMap<String, Object> adminPenaltyCfm(@PathVariable String id, @PathVariable String stateIdx) {
		logger.info("id : {} / state : {}", id, stateIdx);
		
		return service.penaltyCfm(id, stateIdx);
	}
	
	@RequestMapping(value = "/adminCompanyList", method = RequestMethod.GET)
	public ModelAndView adminCompanyList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminCompanyList");
		return mav;
	}
	
	@RequestMapping(value = "/adminCompanyList/{pagePerCnt}/{page}/{searchId}", method = RequestMethod.GET)
	public HashMap<String, Object> comList(@PathVariable int pagePerCnt, @PathVariable int page, @PathVariable String searchId) {
		logger.info("pagePerCtn : {} / page : {}", pagePerCnt, page);
		logger.info("searchId : {}", searchId);
		return service.comList(pagePerCnt,page, searchId);
	}
	
	@RequestMapping(value = "/adminSoundList", method = RequestMethod.GET)
	public ModelAndView adminSoundListPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminSoundList");
		return mav;
	}
	
	@RequestMapping(value = "/adminSoundList/{pagePerCnt}/{page}/{stgctg}", method = RequestMethod.GET)
	public HashMap<String, Object> adminSoundList(@PathVariable int pagePerCnt, @PathVariable int page, @PathVariable String stgctg) {
		logger.info("pagePerCtn : {} / page : {}", pagePerCnt, page);
		logger.info("searchId : {}", stgctg);
		return service.adminSoundList(pagePerCnt,page, stgctg);
	}
	
	@RequestMapping(value = "/adminReportedBrdList", method = RequestMethod.GET)
	public ModelAndView adminReportedBrdListPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminReportedBrdList");
		return mav;
	}
	
	@RequestMapping(value = "/adminReportedBrdList/{pagePerCnt}/{page}/{repCtgIdx}", method = RequestMethod.GET)
	public HashMap<String, Object> adminReportedBrdList(@PathVariable int pagePerCnt, @PathVariable int page, @PathVariable int repCtgIdx) {
		logger.info("pagePerCtn : {} / page : {}", pagePerCnt, page);
		logger.info("repCtg : {}", repCtgIdx);
		return service.adminReportedBrdList(pagePerCnt, page, repCtgIdx);
	}
	
	@RequestMapping(value = "/adminReportedCommList", method = RequestMethod.GET)
	public ModelAndView adminReportedCommListPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminReportedCommList");
		return mav;
	}
	
	@RequestMapping(value = "/adminReportedCommList/{pagePerCnt}/{page}/{repCtgIdx}", method = RequestMethod.GET)
	public HashMap<String, Object> adminReportedCommList(@PathVariable int pagePerCnt, @PathVariable int page, @PathVariable int repCtgIdx) {
		logger.info("pagePerCtn : {} / page : {}", pagePerCnt, page);
		logger.info("repCtg : {}", repCtgIdx);
		return service.adminReportedCommList(pagePerCnt, page, repCtgIdx);
	}
}
