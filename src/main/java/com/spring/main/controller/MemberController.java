package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.MemberService;

@RestController
public class MemberController {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService service;

	@RequestMapping(value = "/membership", method = RequestMethod.GET)
	public ModelAndView membership() {
		logger.info("로그인 페이지 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public  ModelAndView login(Model model, @RequestParam String id, @RequestParam String pw , HttpSession session) {
		logger.info("로그인 페이지 요청");
		ModelAndView mav = new ModelAndView();
		String msg = "아이디와 패스워드를 확인해 주세요.";
		String page = "login";
		if(service.login(id,pw)) {
			msg ="로그인에 성공 하였습니다.";
			page="main";
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}
	@RequestMapping(value = "/registForm", method = RequestMethod.GET)
	public ModelAndView registForm() {
		logger.info("회원가입 페이지 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("registForm");
		return mav;
	}
	@RequestMapping(value = "/overlay", method = RequestMethod.GET)
	public HashMap<String, Object> overlay(Model model , @RequestParam HashMap<String, String> params) {
		logger.info("아이디 중복확인  요청");
		logger.info("params {} " , params);
		boolean success = false;
		if(service.overlay(params) == 0) {
			success = true;
		}
		logger.info("success {} " , success);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		return map;
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(@RequestParam HashMap<String, String> params) {
		logger.info("회원가입 요청");
		ModelAndView mav = new ModelAndView();
		String plan = params.get("pw");
		logger.info("pw : " + params.get("pw"));
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String hash = encoder.encode(plan);
		logger.info("평문 : " + plan);
		logger.info("암호문 : " + hash);
		logger.info("params {} ",params);
		boolean success = false;
		if(service.join(params) > 0 ) {
			success = true;
		}
		logger.info("success {} ", success);
		mav.addObject("success", success);
		return mav;
	}
}
