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
	@RequestMapping(value = "/boardWriteForm", method = RequestMethod.GET)
	public String boardWriteForm(HttpSession session,@RequestParam String boardCtgIdx) {
		logger.info("{}카테고리글쓰기 페이지로 이동",boardCtgIdx);
		//업로드할 파일이름을 저장한 HashMap생성해서 session에 저장(upload메서드에서 여러파일을 관리하기위해)
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		String page="";
		if(boardCtgIdx.equals("1")) {
			page="freeWriteForm";
		}else if(boardCtgIdx=="2") {
			page="homeWriteForm";
		}else if(boardCtgIdx=="3") {
			page="tipWriteForm";
		}else if(boardCtgIdx=="4") {
			page="qnaWriteForm";
		}else if(boardCtgIdx=="5") {
			page="examWriteForm";
		}else if(boardCtgIdx=="6") {
			page="sgtWriteForm";
		}
		return page;
	}
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public ModelAndView boardWrite( @RequestParam HashMap<String , String> params,HttpSession session) {
		logger.info("{}번째 게시판 글쓰기 요청");
		return BoardService.boardWrite(params, session);
	}
	
}