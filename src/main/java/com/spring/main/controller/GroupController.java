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
	public @ResponseBody HashMap<String, Object> groupFileDelete(@RequestParam ArrayList<String> fileName, HttpSession session) { // 세션에서도
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
	public  ModelAndView groupUpdateForm(@PathVariable int gpIdx, HttpSession session) {
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
	
	
	@RequestMapping(value = "/groupCommentWrite", method = RequestMethod.GET)
	@ResponseBody HashMap<String , Object> groupCommentWrite(@RequestParam HashMap<String, String> params) {
		logger.info("공동구매 댓글쓰기 요청 params: {}", params);
		return groupService.groupCommentWrite(params);
	}
	
	@RequestMapping(value = "/groupCommentList/{gpIdx}", method = RequestMethod.GET)
	@ResponseBody HashMap<String , Object> groupCommentList(@PathVariable int  gpIdx,HttpSession session,	RedirectAttributes rAttr) {
		logger.info("공동구매 댓글리스트요청 gpIdx: {}", gpIdx);
		return groupService.groupCommentList(gpIdx,rAttr);
	}
	
	@RequestMapping(value = "/groupCommDel/{commIdx}", method = RequestMethod.GET)
	@ResponseBody HashMap<String , Object> groupCommDel(@PathVariable int  commIdx,HttpSession session) {
		logger.info("공동구매 댓글삭제 요청 gpIdx: {}", commIdx);
		return groupService.groupCommDel(commIdx);
	}
	
	
	@RequestMapping(value = "/currUserChk/{gpIdx}/{maxUser}", method = RequestMethod.GET)
	@ResponseBody HashMap<String , Object> currUserChk(@PathVariable int  gpIdx,@PathVariable int maxUser, HttpSession session,	RedirectAttributes rAttr) {
		logger.info("공동구매 현재 신청인원 확인 gpIdx: {}, updateMaxUser:{}", gpIdx, maxUser);
		return groupService.currUserChk(gpIdx,maxUser,rAttr);
	}
	
	@RequestMapping(value = "/groupCommRec/{commIdx}", method = RequestMethod.GET)
	@ResponseBody HashMap<String , Object> groupCommRec(@PathVariable int  commIdx, HttpSession session,RedirectAttributes rAttr) {
		logger.info("공동구매 댓글 추천 commIdx: {}", commIdx);
		return groupService.groupCommRec(commIdx,rAttr,session);
	}
	
	@RequestMapping(value = "/recCommList", method = RequestMethod.GET)
	@ResponseBody HashMap<String , Object> recCommList( HttpSession session,RedirectAttributes rAttr) {
		logger.info("공동구매 내가 추천한 댓글 리스트");
		return groupService.recCommList(rAttr,session);
	}
	

	@RequestMapping(value = "/groupRecommWrite", method = RequestMethod.GET)
	@ResponseBody HashMap<String , Object> groupRecommWrite(@RequestParam HashMap<String, String> params) {
		logger.info("공동구매 대댓글쓰기 요청 params: {}", params);
		return groupService.groupRecommWrite(params);
	}
	
	@RequestMapping(value = "/groupRecommList/{commIdx}", method = RequestMethod.GET)
	@ResponseBody HashMap<String , Object> groupRecommList(@PathVariable int commIdx) {
		logger.info("공동구매 대댓글 리스트 요청 commIdx: {}", commIdx);
		return groupService.groupRecommList(commIdx);
	}
	
	
	@RequestMapping(value = "/groupRecommDel/{com2ndIdx}", method = RequestMethod.GET)
	@ResponseBody HashMap<String , Object> groupRecommDel(@PathVariable int  com2ndIdx) {
		logger.info("공동구매 대댓글삭제 요청 gpIdx: {}", com2ndIdx);
		return groupService.groupRecommDel(com2ndIdx);
	}
	
	@RequestMapping(value = "/groupRepBoardForm/{gpIdx}", method = RequestMethod.GET)
	public ModelAndView reportBoardPage(@PathVariable int gpIdx,  HttpSession session) {
		logger.info("공동구매 게시글 신고 form 요청:"+gpIdx);
		return groupService.groupRepBoardForm(gpIdx,session);
	}
	
	@RequestMapping(value = "/groupRepBoard", method = RequestMethod.GET)
	@ResponseBody HashMap<String , Object> groupRepBoard(@RequestParam HashMap<String, String> params) {
		logger.info("공동구매 게시글 신고 요청 : params:{}",params);
		return groupService.groupRepBoard(params);
	}
	
	@RequestMapping(value = "/groupRepCommForm/{branch}/{commIdx}", method = RequestMethod.GET)
	public ModelAndView groupRepCommForm(@PathVariable int branch, @PathVariable int commIdx,  HttpSession session) {
		logger.info("공동구매 댓글/답글 신고 form 요청:"+branch+"/"+commIdx);
		return groupService.groupRepCommForm(branch,commIdx,session);
	}
	
	@RequestMapping(value = "/groupRepComm", method = RequestMethod.GET)
	@ResponseBody HashMap<String , Object> groupRepComm(@RequestParam HashMap<String, String> params) {
		logger.info("공동구매 댓글/답글 신고 요청 : params:{}",params);
		return groupService.groupRepComm(params);
	}
	
	

}
