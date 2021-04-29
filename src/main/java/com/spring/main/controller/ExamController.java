package com.spring.main.controller;

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

import com.spring.main.service.ExamService;
import com.spring.main.service.GroupService;

@Controller
public class ExamController {


	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ExamService examService;

	
	@RequestMapping(value = "/examWriteForm", method = RequestMethod.GET)
	public String examWriteForm(HttpSession session) {
		logger.info("시공사례 글쓰기 페이지로 이동");
		//업로드할 파일이름을 저장한 HashMap생성해서 session에 저장(upload메서드에서 여러파일을 관리하기위해)
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		return "examWriteForm";
	}
	
	@RequestMapping(value = "/examWrite", method = RequestMethod.POST)
	public ModelAndView examWrite( @RequestParam HashMap<String , String> params,HttpSession session) {
		logger.info("시공사례 글쓰기 요청");
		logger.info("params: {}" ,params);	
		return examService.examWrite(params, session);
	}
	
	@RequestMapping(value = "/examDetail", method = RequestMethod.GET)
	public ModelAndView examDetail(@RequestParam int combrdIdx) {
		logger.info("시공사례 상세보기 요청: "+combrdIdx);
		return examService.examDetail(combrdIdx);
	}
		
	//게시물 삭제(photo내의 데이터 삭제 > bbs내의 데이터 삭제 > 파일삭제)
	@RequestMapping(value = "/examDel", method = RequestMethod.GET)
	public ModelAndView groupDel(@RequestParam int combrdIdx, HttpSession session, RedirectAttributes rAttr) {
		logger.info("삭제 요청: "+combrdIdx);
		return examService.examDel(combrdIdx, session, rAttr);
	}
		
	@RequestMapping(value = "/examUpdateForm/{combrdIdx}", method = RequestMethod.GET)
	public  @ResponseBody  ModelAndView groupUpdateForm(@PathVariable int combrdIdx,HttpSession session) {
		logger.info("시공사례 수정하기 form 요청: "+combrdIdx);
		//업로드할 파일이름을 저장한 HashMap생성해서 session에 저장(upload메서드에서 여러파일을 관리하기위해)
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		return examService.updateForm(combrdIdx);
	}
		
	@RequestMapping(value = "/examUpdate", method = RequestMethod.POST)
	public ModelAndView examUpdate( @RequestParam HashMap<String , String> params,HttpSession session) {
		logger.info("시공사례 수정하기 요청");
		logger.info("params: {}" ,params);	
		return examService.examUpdate(params, session);
	}
	
	@RequestMapping(value = "/interiorCompanyDetail", method = RequestMethod.GET)
	public ModelAndView examWriteForm(HttpSession session,@RequestParam String comId ) {
		logger.info("인테리어업체 상세보기 페이지로 이동");
		return examService.interiorCompanyDetail(comId);
	}
	
	
	
		
}
