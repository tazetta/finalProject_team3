package com.spring.main.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.MyDTO;
import com.spring.main.service.MyService;

@Controller
public class MyController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MyService myService;
	

	@RequestMapping(value = "/myInteriorHistory", method = RequestMethod.GET)
	public ModelAndView adminMain(HttpSession session) {
		logger.info("인테리어변천사");
		String id = (String) (session.getAttribute("loginId"));
		return myService.myInteriorSlider(id);
	}

	@RequestMapping(value = "/mynavi", method = RequestMethod.GET)
	public String mynavi() {
		logger.info("마이페이지 네비게이션");
		return "mynavi";
	}

	
	
	
	
	
	//패스워드 확인창 이동
	@RequestMapping(value = "/pwconfirm")  
	public String pwconfirm(Model model) {
		logger.info("회원정보 패스워드확인창 이동");
		return "pwconfirm" ;
	}
	//수정,전 비밀번호 일치여부 체크
	@RequestMapping(value = "/checkPw") 
	public ModelAndView  checkPw( HttpSession session, @RequestParam String pw) {
		String str ="";
		boolean success = myService.checkPw(pw,session);
		if(success==true) {
			str = "redirect:/myprofile";
		}else {
			str = "redirect:/pwconfirm";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(str);
		return mav;
	}
	//수정 페이지 이동
	@RequestMapping(value = "/myprofile")
	public String myprofile(Model model,HttpSession session) {
		String page = "myprofile";
		logger.info("회원정보 수정페이지로 이동");
		model.addAttribute("dto", myService.myprofile(session));
		return page;
	}
	/* 회원정보 업데이트 */
	@RequestMapping(value = "/myupdate")
	public ModelAndView myupdate(@ModelAttribute MyDTO dto, HttpSession session) {
		logger.info("회원정보 수정요청");
		return myService.myupdate(dto,session);
	}
	/* 패스워드 변경 페이지 이동 */
	@RequestMapping(value = "/mypwreset")
	public String mypwreset(Model model) {
		logger.info("회원 비밀번호 변경 페이지로 이동");
		return "mypwreset";
	}
	/* 패스워드 암호화 변경 */
	@RequestMapping(value = "/pwreset", method = RequestMethod.POST)
	public ModelAndView pwreset(@RequestParam String newPw,HttpSession session) {
		logger.info("회원 비밀번호 변경 요청",newPw);
		return myService.pwreset(newPw,session);
	}

	/* 내작성글 전체 페이지 이동 */
	@RequestMapping(value = "/mywrite", method = RequestMethod.GET)
	public String mywrite() {
		logger.info("내 작성글 페이지이동");
		return "mywrite";
	}
	/* 내작성글 게시판 */
	@RequestMapping(value = "/mywriteboard", method = RequestMethod.GET)
	public String mywriteboard() {
		logger.info("내 작성글 게시판");
		return "mywriteboard";
	}
	/* 내작성글 꿀팁 */
	@RequestMapping(value = "/mywritetip", method = RequestMethod.GET)
	public String mywritetip() {
		logger.info("내 작성글 꿀팁");
		return "mywritetip";
	}
	/* 내작성글 질문 및 답변 */
	@RequestMapping(value = "/mywriteqna", method = RequestMethod.GET)
	public String mywriteqna() {
		logger.info("내 작성글 질문 및 답변");
		return "mywriteqna";
	}
	
	/* 내 견적서 페이지 */
	@RequestMapping(value = "/myestimate", method = RequestMethod.GET)
	public String myestimate() {
		logger.info("내 견적서 페이지");
		return "myestimate";
	}
	
	/* 작성한 공동구매 */
	@RequestMapping(value = "/mygroupwrite", method = RequestMethod.GET)
	public String mygroupwrite() {
		logger.info("작성한 공동구매 페이지");
		return "mygroupwrite";
	}

	/* 신청한 공동구매 */
	@RequestMapping(value = "/mygroupbuy", method = RequestMethod.GET)
	public String mygroupbuy() {
		logger.info("신청한 공동구매 페이지");
		return "mygroupbuy";
	}
	
	/* 공동구매 전체 페이지 */
	@RequestMapping(value = "/mygrouppage", method = RequestMethod.GET)
	public String mygrouppage() {
		logger.info("내 공동구매 페이지");
		return "mygrouppage";
	}

	/* 스크랩 전체 페이지 */
	@RequestMapping(value = "/myscrappage", method = RequestMethod.GET)
	public String myscrappage() {
		logger.info("스크랩북 전체페이지");
		return "myscrappage";
	}
	
	/* 스크랩 우리집 자랑 */
	@RequestMapping(value = "/myscraphome", method = RequestMethod.GET)
	public String myscraphome() {
		logger.info("스크랩북 홈");
		return "myscraphome";
	}
	
	/* 스크랩 꿀팁 */
	@RequestMapping(value = "/myscraptip", method = RequestMethod.GET)
	public String myscraptip() {
		logger.info("스크랩북 팁");
		return "myscraptip";
	}
	
	
	
	
	/* 우리집 자랑 */
	@RequestMapping(value = "/mywritehome", method = RequestMethod.GET)
	public String mywritehome() {
		logger.info("우리집 자랑 페이지");
		return "mywritehome";
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



	@RequestMapping(value = "/msgsenderpage", method = RequestMethod.GET)
	public String msgsenderpage() {
		logger.info("보낸 쪽지 전체페이지");
		return "msgsenderpage";
	}

	@RequestMapping(value = "/msgAllPage", method = RequestMethod.GET)
	public String msgAllPage() {
		logger.info("보낸 쪽지 전체페이지");
		return "msgAllPage";
	}
}
