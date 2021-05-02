package com.spring.main.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.MyDTO;
import com.spring.main.service.MyService;

@Controller
public class MyController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MyService myService;
	

	@RequestMapping(value = "/myInteriorHistory", method = RequestMethod.GET)
	public String adminMain() {
		logger.info("인테리어변천사");
		return "myInteriorHistory";
	}

	@RequestMapping(value = "/mynavi", method = RequestMethod.GET)
	public String mynavi() {
		logger.info("마이페이지 네비게이션");
		return "mynavi";
	}

	@RequestMapping(value = "/myprofile", method = RequestMethod.GET)
	public String myprofile() {
		logger.info("마이페이지 ");
		return "myprofile";
	}

	@RequestMapping(value = "/mywrite", method = RequestMethod.GET)
	public String mywrite() {
		logger.info("내 작성글 페이지");
		return "mywrite";
	}
	
	@RequestMapping(value = "/mywriteboard", method = RequestMethod.GET)
	public String mywriteboard(Model model) {		
		ArrayList<MyDTO> list = myService.list();
		logger.info("내 작성글 게시판");
		model.addAttribute("boardList",list);		
		return "mywriteboard";
	}
	


	

	@RequestMapping(value = "/mywriteqna", method = RequestMethod.GET)
	public String mywriteqna() {
		logger.info("내 작성글 질문 및 답변");
		return "mywriteqna";
	}

	@RequestMapping(value = "/mywritetip", method = RequestMethod.GET)
	public String mywritetip() {
		logger.info("내 작성글 꿀팁");
		return "mywritetip";
	}

	@RequestMapping(value = "/msgpage", method = RequestMethod.GET)
	public String msgpage() {
		logger.info("쪽지 메인 페이지");
		return "mywriteboard";
	}

	@RequestMapping(value = "/msgreceivepage", method = RequestMethod.GET)
	public String msgreceivepage() {
		logger.info("받은 쪽지 전체페이지");
		return "msgreceivepage";
	}

	@RequestMapping(value = "/msgsendpage", method = RequestMethod.GET)
	public String msgsendpage() {
		logger.info("보낸 쪽지 전체페이지");
		return "msgsendpage";
	}

	@RequestMapping(value = "/myestimate", method = RequestMethod.GET)
	public String myestimate() {
		logger.info("견적서 페이지");
		return "myestimate";
	}

	@RequestMapping(value = "/mygrouppage", method = RequestMethod.GET)
	public String mygrouppage() {
		logger.info("내 공동구매 페이지");
		return "mygrouppage";
	}

	@RequestMapping(value = "/mygroupbuy", method = RequestMethod.GET)
	public String mygroupbuy() {
		logger.info("신청한 공동구매 페이지");
		return "mygroupbuy";
	}

	@RequestMapping(value = "/mygroupwrite", method = RequestMethod.GET)
	public String mygroupwrite() {
		logger.info("작성한 공동구매 페이지");
		return "mygroupwrite";
	}

	@RequestMapping(value = "/myscrappage", method = RequestMethod.GET)
	public String myscrappage() {
		logger.info("스크랩북 페이지");
		return "myscrappage";
	}
	
}
