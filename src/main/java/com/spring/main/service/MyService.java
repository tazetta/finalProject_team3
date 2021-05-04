package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardDAO;
import com.spring.main.dao.MyDAO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.MyDTO;
import com.spring.main.dto.PhotoDTO;

@Service
public class MyService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardDAO dao;
	@Autowired MyDAO MyDAO; 
	
	@Value("#{config['Globals.root']}")
	String root;

	String page = "";
	String msg = "";
	
	public HashMap<String, Object> myPhotos(int num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = "mingmang17";
		ArrayList<PhotoDTO> list = dao.getMyPhotos(id); 
		map.put("images", list);
		return map;
	}

	public ArrayList<MyDTO> list() {
		logger.info("리스트 접근");
		ArrayList<MyDTO> list = MyDAO.list();
		return list;
	}
	
	
	
	
	
	
	
	
	public MyDTO myprofile(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		logger.info("수정할 회원 id:"+loginId);
		return MyDAO.myprofile(loginId);
	}
	
	public boolean checkPw(String pw, HttpSession session) { //수정,전 비밀번호 일치여부 체크
		logger.info("입력한 비밀번호:"+pw);
		String id = (String) session.getAttribute("loginId");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encrypt_pass  = MyDAO.login(id);
		logger.info("현재 비밀번호:"+encrypt_pass);
		return encoder.matches(pw, encrypt_pass);
	}
	
	public ModelAndView profileupdate(@ModelAttribute MyDTO dto,HttpSession session) {
		logger.info("수정할 params:"+dto.getName()+"/"+dto.getPhone()+"/"+dto.getEmail());

		ModelAndView mav = new ModelAndView();
		int success = MyDAO.profileupdate(dto);
		page = "redirect:/myLib_UpdateForm";
		msg = "회원정보 수정에 실패하였습니다.";
		
		if(success>0) {
			dto.getId();
			msg = "회원정보를 수정하였습니다.";
			page = "myLib_UpdateForm";
		}
		logger.info("수정성공여부:"+success);
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	

	
	
	

	public HashMap<String, Object> msgReceiveList(int pagePerCnt, int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sessionId = (String) session.getAttribute("loginId");
		int allCount =  MyDAO.receiverAllCount(sessionId);
		logger.info("총 갯수 : "  + allCount);
		int range = allCount%pagePerCnt > 0 ? Math.round(allCount/pagePerCnt)+1 : Math.round(allCount/pagePerCnt);
		logger.info("총 페이지(range): " + range);
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		map.put("list", MyDAO.receiveList(start,end,sessionId));

		map.put("range", range);
		map.put("currPage", page);
		return map;
	}



}
