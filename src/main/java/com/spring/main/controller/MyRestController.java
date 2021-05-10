package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.service.MyService;

@RestController
public class MyRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MyService service;
	
	@RequestMapping(value = "/myPhotos/{pagePerCnt}/{page}/{id}", method = RequestMethod.GET)
	public HashMap<String, Object> list(@PathVariable int pagePerCnt, @PathVariable int page, @PathVariable String id) {
		HashMap<String , Object> map = new HashMap<String, Object>();	
		logger.info("pagePerCnt :{}, page :{}",pagePerCnt, page);
		logger.info("ID : {} ", id);
		return service.myPhotos(pagePerCnt, page, id);
	}
	
	
	@RequestMapping(value = "/mywriteboardList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> mywriteboardList(@PathVariable int page , @PathVariable int pagePerCnt ,HttpSession session) {
		logger.info("작성한 게시판");
		return service.mywriteboardList(pagePerCnt,page,session);	
	}
	@RequestMapping(value = "/mywritetipList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> mywritetipList(@PathVariable int page , @PathVariable int pagePerCnt ,HttpSession session) {
		logger.info("작성한 꿀팁");
		return service.mywritetipList(pagePerCnt,page,session);	
	}
	@RequestMapping(value = "/mywriteqnaList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> mywriteqnaList(@PathVariable int page , @PathVariable int pagePerCnt ,HttpSession session) {
		logger.info("작성한 질문 및 답변");
		return service.mywriteqnaList(pagePerCnt,page,session);	
	}
	
	@RequestMapping(value = "/myestimateList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> myestimateList(@PathVariable int page , @PathVariable int pagePerCnt ,HttpSession session) {
		logger.info("작성한 견적서");
		return service.myestimateList(pagePerCnt,page,session);	
	}
	@RequestMapping(value = "/estDetail/{msgIdx}", method = RequestMethod.GET)
	public ModelAndView estDetail(@PathVariable int msgIdx) {
		logger.info("견적서 상세보기");
		return service.estDetail(msgIdx);
	}
	@RequestMapping(value = "/mygroupwriteList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> mygroupwriteList(@PathVariable int page , @PathVariable int pagePerCnt ,HttpSession session) {
		logger.info("작성한 공동구매");
		return service.mygroupwriteList(pagePerCnt,page,session);	
	}
	
	@RequestMapping(value = "/mygroupbuyList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> mygroupbuyList(@PathVariable int page , @PathVariable int pagePerCnt ,HttpSession session) {
		logger.info("신청한 공동구매");
		return service.mygroupbuyList(pagePerCnt,page,session);	
	}
	
	@RequestMapping(value = "/myscrapList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> myscrapList(@PathVariable int page , @PathVariable int pagePerCnt ,HttpSession session) {
		logger.info("스크랩");
		return service.myscrapList(pagePerCnt,page,session);	
	}
	
	
	@RequestMapping(value = "/mywritehomeList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> mywritehomeList(@PathVariable int page , @PathVariable int pagePerCnt ,HttpSession session) {
		logger.info("우리집 자랑");
		return service.mywritehomeList(pagePerCnt,page,session);	
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/msgReceiveList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> msgReceiveList(@PathVariable int page , @PathVariable int pagePerCnt ,HttpSession session) {
		logger.info("받은쪽지함 리스트");
		return service.msgReceiveList(pagePerCnt,page,session);	
		
	}
	@RequestMapping(value = "/msgSenderList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> msgSenderList(@PathVariable int page , @PathVariable int pagePerCnt ,HttpSession session) {
		logger.info("보낸쪽지함 리스트");
		return service.msgSenderList(pagePerCnt,page,session);	
		
	}
	
	@RequestMapping(value = "/msgDetailPopUp/{msgIdx}", method = RequestMethod.GET)
	public ModelAndView msgDetail(@PathVariable int msgIdx) {
		logger.info("쪽지 상세보기");
		return service.msgDetail(msgIdx);
		
	}
	@RequestMapping(value = "/msgDelete/{msgIdx}", method = RequestMethod.GET)
	public HashMap<String, Object> msgDelete(@PathVariable int msgIdx ,HttpSession session , RedirectAttributes rAttr) {
		logger.info("쪽지 삭제하기");
		return service.msgDelete(msgIdx , session ,rAttr);
		
	}
	@RequestMapping(value = "/msgFormPopUp", method = RequestMethod.GET)
	public ModelAndView msgFormPopUp(HttpSession session) {
		logger.info("쪽지쓰기 팝업창");
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		mav.addObject("loginId", loginId);
		mav.setViewName("msgForm");
		return mav;
		
	}
	
	@RequestMapping(value = "/sendMsg", method = RequestMethod.POST)
	public HashMap<String, Object> sendMsg(@RequestParam HashMap<String, String> params) {
		logger.info("쪽지쓰기 요청");
		logger.info("params {}" + params);
		
		return service.sendMsg(params);
		
	}
	@RequestMapping(value = "/reMsgFormPopUp/{receiver}", method = RequestMethod.GET)
	public ModelAndView reMsgFormPopUp(@PathVariable HashMap<String, String> params) {
		logger.info("쪽지쓰기 팝업창2 ");
		logger.info("params {}" + params);
		String receiver = params.get("receiver");
		logger.info("받는사람 {} " , receiver);
		ModelAndView mav = new ModelAndView();
		boolean success = true;
		mav.addObject("receiver", receiver);
		mav.setViewName("msgReForm");
		
		return mav;
		
	}

}
