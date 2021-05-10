package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.CompanyDAO;
import com.spring.main.dao.ExamDAO;
import com.spring.main.dto.CompanyMemberDTO;

@Service
public class CompanyService {
	
	@Autowired CompanyDAO dao;
	@Autowired ExamDAO examDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	public ModelAndView companydetail(HttpSession session) {
		logger.info("업체정보보여줘");
		String comId = (String) session.getAttribute("cLoginId");
		ModelAndView mav = new ModelAndView();
		String msg="업체회원만 접근이 가능합니다.";
		String page="home";
		if(comId!=null) {
			CompanyMemberDTO dto = dao.companydetail(comId);
			Float rate = examDAO.reviewrate(comId);
			mav.addObject("rate",rate);
			mav.addObject("company", dto);
			page="companydetail";
			msg="";
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}


	public ModelAndView comMemUpdateForm(String comId, String pw) {
		logger.info("업체정보보여줘",pw);
		ModelAndView mav = new ModelAndView();
		
		String encrypt_pass = dao.pwchk(comId);
		logger.info(pw + " == " + encrypt_pass);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
		logger.info("success {} " , encrypt_pass);
		boolean result = encoder.matches(pw, encrypt_pass);
		String msg="비밀번호가 틀렸습니다.";
		String page="redirect:/companydetail?comId="+comId;
		if(result) {
			CompanyMemberDTO dto = dao.companydetail(comId);	
			logger.info(dto.getAddr());
			mav.addObject("company", dto);
			page="comMemUpdateForm";
		}
		mav.setViewName(page);
		mav.addObject("msg", msg);
		return mav;
	}


	public ModelAndView comMemUpdate(HashMap<String, String> params, String comId) {
		ModelAndView mav = new ModelAndView();
		String plain = params.get("pw");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encrypt = encoder.encode(plain);
		logger.info(plain  + "=>" + encrypt);
		params.put("pw", encrypt);
		int result = dao.comMemUpdate(params);
		
		String msg="수정에 실패했습니다";
		String page="redirect:/comMemUpdateForm?comId="+comId;
		if(result>0) {
			msg="수정이 완료되었습니다";
			page="redirect:/companydetail?comId="+comId;
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}


	public ModelAndView companyReport(HashMap<String, String> params) {
		logger.info("업체신고요청");
		ModelAndView mav = new ModelAndView();
		int result = dao.companyReport(params);
		//String comId = params.get("comId");
		String msg = "신고처리에 실패했습니다.";
		if(result>0) {
			msg="신고처리가 완료되었습니다.";	
		}
		mav.addObject("msg", msg);
		mav.setViewName("companyReportForm");
		return mav;
	}

}
