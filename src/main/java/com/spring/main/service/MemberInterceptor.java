package com.spring.main.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.MemberDTO;

public class MemberInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	MemberDAO memberdao;
	
	@Override
	@Transactional
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		
		String url = request.getRequestURI().substring(request.getContextPath().length());
		
		String loginId = (String) session.getAttribute("loginId");
		
		System.out.println("*********************************************************");
		System.out.println("url: "+url);
		System.out.println("loginID:" + loginId);
		int  cntResult = 0;
		if(url.contains("comm")||url.contains("Comm")) {
			System.out.println("cntComm+1");
			cntResult = memberdao.gradeCntComm(loginId); //회원등급 댓글 카운트
		}else {
			System.out.println("cntBoard+1");
			cntResult = memberdao.gradeCntBoard(loginId); // 회원등급 글 카운트
		}
		System.out.println("cntResult:" + cntResult);
		
		MemberDTO dto  =memberdao.gradeChk(loginId);
		
		 int gradeIdx = 1; //회원등급 - 초보
		 int gradeResult = 0;
		if(dto!=null) {
			if( dto.getCntBoard() >=10 && dto.getCntComm()>=30 && dto.getGradeIdx() ==1) {
				gradeIdx =2;
				gradeResult= memberdao.gradeUpdate(gradeIdx,loginId);
				System.out.println("초보->중수 UpdateResult:"+gradeResult);	
			}else if(dto.getCntBoard() >=20 && dto.getCntComm()>=60 && dto.getGradeIdx() ==2) {
				gradeIdx =3;
				gradeResult= memberdao.gradeUpdate(gradeIdx,loginId);
				System.out.println("중수 ->고수 UpdateResult:"+gradeResult);
			}else if(dto.getCntBoard()>=50&& dto.getCntComm()>=150 && dto.getGradeIdx() ==3) {
				gradeIdx =4;
				gradeResult= memberdao.gradeUpdate(gradeIdx,loginId);
				System.out.println("고수 ->초고수 UpdateResult:"+gradeResult);
			}else if(dto.getCntBoard()>=150&& dto.getCntComm()>=500 && dto.getGradeIdx() ==4) {
				gradeIdx =5;
				gradeResult= memberdao.gradeUpdate(gradeIdx,loginId);
				System.out.println("초고수 ->신 UpdateResult:"+gradeResult);
			}
		}
		System.out.println("*********************************************************");
		
	}

}
