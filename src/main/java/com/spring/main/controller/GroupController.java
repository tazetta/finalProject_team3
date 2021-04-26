package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.GroupService;

@Controller
public class GroupController {


	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GroupService groupService;

	@RequestMapping(value = "/groupListPage", method = RequestMethod.GET)
	public String home() {
		logger.info("공동구매 리스트로 이동");
		return "groupList";
	}
	
	@RequestMapping(value = "/groupWriteForm", method = RequestMethod.GET)
	public String groupWriteForm() {
		logger.info("공동구매 글쓰기 페이지로 이동");
		return "groupWriteForm";
	}
	
	@RequestMapping(value = "/groupWrite", method = RequestMethod.POST)
	public ModelAndView groupWrite( @RequestParam HashMap<String , String> params,HttpSession session) {
		logger.info("공동구매 글쓰기 요청");
		logger.info("params: {}" ,params);	
		return groupService.groupWrite(params, session);
	}
	
	@RequestMapping(value = "/groupDetail", method = RequestMethod.GET)
	public ModelAndView groupDetail(@RequestParam String gpIdx) {
		logger.info("공동구매 상세보기 요청: "+gpIdx);
		return groupService.detail(gpIdx);
	}
	
	@RequestMapping(value = "/groupUploadForm", method = RequestMethod.GET)
	public String groupUploadForm(HttpSession session) {
		logger.info("공동구매 파일업로드 폼 이동");
		//업로드할 파일이름을 저장한 HashMap생성해서 session에 저장(upload메서드에서 여러파일을 관리하기위해)
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		return "groupUploadForm";
	}
	
	@RequestMapping(value = "/groupUpload", method = RequestMethod.POST)
	public ModelAndView groupUpload(MultipartFile file, HttpSession session) { //groupUploadForm.jsp에서 보내는 file객체를 받고, session도 생성
		logger.info("파일업로드 요청");
		
		return groupService.fileUpload(file, session);
	}
}
