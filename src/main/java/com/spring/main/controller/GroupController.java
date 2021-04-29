package com.spring.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dto.GroupDTO;
import com.spring.main.service.GroupService;

@Controller
public class GroupController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	GroupService groupService;


	@RequestMapping(value = "/groupWriteForm", method = RequestMethod.GET)
	public String groupWriteForm(HttpSession session) {
		logger.info("공동구매 글쓰기 페이지로 이동");
		// 업로드할 파일이름을 저장한 HashMap생성해서 session에 저장(upload메서드에서 여러파일을 관리하기위해)
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		return "groupWriteForm";
	}

	@RequestMapping(value = "/groupWrite", method = RequestMethod.POST)
	public ModelAndView groupWrite(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("공동구매 글쓰기 요청");
		logger.info("params: {}", params);
		return groupService.groupWrite(params, session);
	}

	@RequestMapping(value = "/groupDetail", method = RequestMethod.GET)
	public ModelAndView groupDetail(@RequestParam int gpIdx, @RequestParam String loginId) {
		logger.info("공동구매 상세보기 요청: " + gpIdx);
		return groupService.detail(gpIdx,loginId);
	}

	@RequestMapping(value = "/groupUploadForm", method = RequestMethod.GET)
	public String groupUploadForm() {
		logger.info("공동구매 파일업로드 폼 이동");

		return "groupUploadForm";
	}

	@RequestMapping(value = "/groupUpload", method = RequestMethod.POST)
	public ModelAndView groupUpload(MultipartFile file, HttpSession session) { // groupUploadForm.jsp에서 보내는 file객체를 받고,
																				// session도 생성
		logger.info("파일업로드 요청");

		return groupService.fileUpload(file, session);
	}

	// 비동기로 받기 때문에 @ResponseBody
	@RequestMapping(value = "/groupFileDelete", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> groupFileDelete(@RequestParam String fileName, HttpSession session) { // 세션에서도
																														// 삭제
		logger.info(fileName + " ->파일 삭제 요청");
		return groupService.fileDelete(fileName, session);
	}

	// 게시물 삭제(photo내의 데이터 삭제 > bbs내의 데이터 삭제 > 파일삭제)
	@RequestMapping(value = "/groupDel/{gpIdx}", method = RequestMethod.GET)
	public ModelAndView groupDel(@PathVariable int gpIdx, HttpSession session, RedirectAttributes rAttr) {
		logger.info("삭제 요청: " + gpIdx);
		return groupService.groupDel(gpIdx, session, rAttr);
	}

	

	@RequestMapping(value = "/groupUpdateForm/{gpIdx}", method = RequestMethod.GET)
	public @ResponseBody ModelAndView groupUpdateForm(@PathVariable int gpIdx, HttpSession session) {
		logger.info("공동구매 수정하기 form 요청: " + gpIdx);
		// 업로드할 파일이름을 저장한 HashMap생성해서 session에 저장(upload메서드에서 여러파일을 관리하기위해)
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		return groupService.updateForm(gpIdx, session);
	}

	@RequestMapping(value = "/groupUpdate", method = RequestMethod.POST)
	public ModelAndView groupUpdate(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("공동구매 수정하기 요청");
		logger.info("params: {}", params);
		return groupService.groupUpdate(params, session);
	}

	@RequestMapping(value = "/applyGroup/{gpIdx}/{applyId}", method = RequestMethod.GET)
	public ModelAndView applyGroup(@PathVariable int gpIdx, @PathVariable String applyId, HttpSession session,
			RedirectAttributes rAttr) {
		logger.info("공동구매 신청 요청: " + gpIdx + "/" + applyId);
		return groupService.applyGroup(gpIdx, applyId, rAttr,session);
	}
	
	/*
	 * @RequestMapping(value = "/groupApplyChk/{gpIdx}/{applyId}", method =
	 * RequestMethod.GET) public HashMap<String, Object> groupApplyChk(@PathVariable
	 * String gpIdx, @PathVariable String applyId, HttpSession session) {
	 * logger.info("공동구매 실시간 확인 요청: " + gpIdx + "/" + applyId); return
	 * groupService.groupApplyChk(gpIdx, applyId); }
	 */
	
	@RequestMapping(value = "/applyList/{gpIdx}", method = RequestMethod.GET)
	@ResponseBody HashMap<String, Object> applyList(@PathVariable int gpIdx,HttpSession session,
			RedirectAttributes rAttr) {
		logger.info("공동구매 신청자 리스트 요청: " + gpIdx );
		return groupService.applyList(gpIdx,  rAttr,session);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		logger.info("로그아웃 요청");
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("loginId");
		mav.setViewName("main");
		return mav;
	}
	
	
	

}
