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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.BoardDAO;
import com.spring.main.dao.MyDAO;
import com.spring.main.dto.EstimateDTO;
import com.spring.main.dto.MsgDTO;
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
	
	public HashMap<String, Object> myPhotos(int pagePerCnt, int page, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page * pagePerCnt;
		int start = end - (pagePerCnt - 1);
		int photoMaxCnt = dao.getPhotoMax(id);
		ArrayList<PhotoDTO> list = dao.getMyPhotos(start, end, id); 
		logger.info("list Size : {}", list.size());
		int maxPage = (int) Math.ceil(photoMaxCnt / (double) pagePerCnt);
		logger.info("사진 수 : {}", photoMaxCnt);
		map.put("maxPage", maxPage);
		map.put("list", list);
		map.put("currPage", page);
		return map;
	}

	
	/* 내가 작성한 게시글 */
	public HashMap<String, Object> mywriteboardList(int pagePerCnt, int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sessionId = (String) session.getAttribute("loginId");
		int allCount =  MyDAO.mywriteboardAllCount(sessionId);
		logger.info("총 갯수 : "  + allCount);
		int range = allCount%pagePerCnt > 0 ? Math.round(allCount/pagePerCnt)+1 : Math.round(allCount/pagePerCnt);
		logger.info("총 페이지(range): " + range);
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		map.put("list", MyDAO.mywriteboardList(start,end,sessionId));

		map.put("range", range);
		map.put("currPage", page);
		return map;
	}
	/* 내가 작성한 꿀팁 */
	public HashMap<String, Object> mywritetipList(int pagePerCnt, int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sessionId = (String) session.getAttribute("loginId");
		int allCount =  MyDAO.mywritetipAllCount(sessionId);
		logger.info("총 갯수 : "  + allCount);
		int range = allCount%pagePerCnt > 0 ? Math.round(allCount/pagePerCnt)+1 : Math.round(allCount/pagePerCnt);
		logger.info("총 페이지(range): " + range);
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		map.put("list", MyDAO.mywritetipList(start,end,sessionId));

		map.put("range", range);
		map.put("currPage", page);
		return map;
	}
	

	public HashMap<String, Object> mywriteqnaList(int pagePerCnt, int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sessionId = (String) session.getAttribute("loginId");
		int allCount =  MyDAO.mywriteqnaAllCount(sessionId);
		logger.info("총 갯수 : "  + allCount);
		int range = allCount%pagePerCnt > 0 ? Math.round(allCount/pagePerCnt)+1 : Math.round(allCount/pagePerCnt);
		logger.info("총 페이지(range): " + range);
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		map.put("list", MyDAO.mywriteqnaList(start,end,sessionId));

		map.put("range", range);
		map.put("currPage", page);
		return map;
	}
	
	/* 내가 작성한 공동구매 */
	public HashMap<String, Object> mygroupwriteList(int pagePerCnt, int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sessionId = (String) session.getAttribute("loginId");
		int allCount =  MyDAO.mygroupwriteAllCount(sessionId);
		logger.info("총 갯수 : "  + allCount);
		int range = allCount%pagePerCnt > 0 ? Math.round(allCount/pagePerCnt)+1 : Math.round(allCount/pagePerCnt);
		logger.info("총 페이지(range): " + range);
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		map.put("list", MyDAO.mygroupwriteList(start,end,sessionId));

		map.put("range", range);
		map.put("currPage", page);
		return map;
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
	
	/* 회원정보 수정 */
	public ModelAndView myupdate(@ModelAttribute MyDTO dto,HttpSession session) {
		logger.info("수정할 params:"+dto.getName()+"/"+dto.getPhone()+"/"+dto.getEmail());

		ModelAndView mav = new ModelAndView();
		int success = MyDAO.myupdate(dto);
		page = "redirect:/myprofile";
		msg = "회원정보 수정에 실패하였습니다.";
		
		if(success>0) {
			dto.getId();
			msg = "회원정보를 수정하였습니다.";
			page = "myupdate";
		}
		logger.info("수정성공여부:"+success);
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}
	
	
	/* 패스워드 변경 */
	public ModelAndView pwreset(String newPw, HttpSession session) {
        logger.info("새로바꿀 비밀번호:"+newPw);    
        String loginId = (String) session.getAttribute("loginId");
        logger.info("해당 id:"+loginId);
        MyDTO dto = new MyDTO();
        dto.setId(loginId); //dto에 해당 id를 넣는다.
       
        String encrypt_pass  = MyDAO.login(loginId);
        logger.info("변경전 비밀번호:"+encrypt_pass); // 1. 현재 비밀번호 확인
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
      
        ModelAndView mav = new ModelAndView();
        logger.info(newPw,encrypt_pass+"서비");
       boolean success = encoder.matches(newPw, encrypt_pass);
        if(success==true) {
        	msg= "이전과 동일한 비밀번호입니다. 다시 입력해주세요.";
			page = "mypwreset";
        }else {
        	String encrypt = encoder.encode(newPw);
			dto.setPw(encrypt); //새로운 비밀번호를 dto에 담는다(암호화된)
			MyDAO.newPw(dto); //담은 비밀번호를 dao에 다시 담는다
			page = "myprofile";
			msg= "비밀번호가 변경되었습니다.";
        }
		logger.info("변경 후 비밀번호:"+dto.getPw());
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav; 
	}

	public ModelAndView estDetail(int estIdx) {
		EstimateDTO dto = MyDAO.estDetail(estIdx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", dto);
		mav.setViewName("myestimatedetail");
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
	

	

	public HashMap<String, Object> msgSenderList(int pagePerCnt, int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sessionId = (String) session.getAttribute("loginId");
		int allCount =  MyDAO.senderAllCount(sessionId);
		logger.info("총 갯수 : "  + allCount);
		int range = allCount%pagePerCnt > 0 ? Math.round(allCount/pagePerCnt)+1 : Math.round(allCount/pagePerCnt);
		logger.info("총 페이지(range): " + range);
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		map.put("list", MyDAO.senderList(start,end,sessionId));

		map.put("range", range);
		map.put("currPage", page);
		return map;
	}

	public ModelAndView msgDetail(int msgIdx) {
		MsgDTO dto = MyDAO.msgDetail(msgIdx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", dto);
		mav.setViewName("msgDetailPage");
		return mav;
	}

	public ModelAndView msgDelete(int msgIdx, HttpSession session, RedirectAttributes rAttr) {
		MsgDTO dto =  MyDAO.whoSR(msgIdx);
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		String sender = dto.getSender();
		String receiver = dto.getReceiver();
		String msg ="삭제 실패하였습니다.";
		String page = "msgAllPage";
		if(loginId.equals(sender)) {
			MyDAO.deleteSender(msgIdx);
			msg = "삭제 성공하였습니다.";
			page = "redirect:/msgsenderpage";
		}else if(loginId.equals(receiver)) {
			MyDAO.deleteReceiver(msgIdx);
			msg = "삭제 성공하였습니다.";
			page = "redirect:/msgreceivepage";
		}
		rAttr.addFlashAttribute("msg", msg);
		mav.setViewName(page);
		return mav;
	}


	public HashMap<String, Object> myestimateList(int pagePerCnt, int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sessionId = (String) session.getAttribute("loginId");
		int allCount =  MyDAO.myestimateAllCount(sessionId);
		logger.info("총 갯수 : "  + allCount);
		int range = allCount%pagePerCnt > 0 ? Math.round(allCount/pagePerCnt)+1 : Math.round(allCount/pagePerCnt);
		logger.info("총 페이지(range): " + range);
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		
		map.put("list", MyDAO.myestimateList(start,end,sessionId));

		map.put("range", range);
		map.put("currPage", page);
		return map;
	}


	public ModelAndView myInteriorSlider(String id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<PhotoDTO> slide = dao.myInteriorSlider(id);
		mav.addObject("slide", slide);
		mav.setViewName("myInteriorHistory");
		return mav;
	}




	



}
