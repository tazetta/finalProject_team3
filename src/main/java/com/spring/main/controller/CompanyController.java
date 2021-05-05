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

import com.spring.main.service.CompanyService;

@Controller
public class CompanyController {


	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CompanyService service;

	@RequestMapping(value = "/companydetail", method = RequestMethod.GET)
	public ModelAndView companydetail(HttpSession session) {
		String comId = (String) session.getAttribute("cLoginId");
		logger.info("업체페이지상세보기",comId);
		return service.companydetail(comId);
	}
	
	@RequestMapping(value = "/comMemUpdateForm", method = RequestMethod.POST)
	public ModelAndView comMemUpdateForm(@RequestParam HashMap<String , String> params ,HttpSession session) {
		String comId = (String) session.getAttribute("cLoginId");
		logger.info("업체정보수정폼이동");
		String pw = params.get("pw");
		logger.info(pw);
		return service.comMemUpdateForm(comId,pw);
	}
	
	@RequestMapping(value = "/comMemUpdate", method = RequestMethod.POST)
	public ModelAndView comMemUpdate(HttpSession session, @RequestParam HashMap<String , String> params) {
		logger.info("업체정보 수정");
		String comId = (String) session.getAttribute("cLoginId");
		return service.comMemUpdate(params,comId);
	}
	
	
	@RequestMapping(value = "/companynavi", method = RequestMethod.GET)
	public String mainnavi() {
		logger.info("업체네비바실행");
		return "companynavi";
	}
	@RequestMapping(value = "/cMreviewlist", method = RequestMethod.GET)
	public String cMreviewlist() {
		logger.info("업체시공리뷰홈페이지");
		return "cMreviewlist";
	}
	
	
}