package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.service.GroupService;
import com.spring.main.service.ReviewService;

@Controller
public class ReviewController {


	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ReviewService reviewService;


	@RequestMapping(value = "/reviewWriteForm", method = RequestMethod.GET)
	public String reviewWriteForm(HttpSession session) {
		logger.info("리뷰 글쓰기 페이지로 이동");
		return "reviewWriteForm";
	}
	
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public ModelAndView reviewWrite( @RequestParam HashMap<String , String> params) {
		logger.info("리뷰 글쓰기 요청");
		logger.info("params: {}" ,params);	
		return reviewService.reviewWrite(params);
	}
	
	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
	public ModelAndView reviewDetail(@RequestParam String revIdx) {
		logger.info("리뷰 상세보기 요청: "+revIdx);
		return reviewService.reviewDetail(revIdx);
	}
	
	@RequestMapping(value = "/reviewUpdateForm", method = RequestMethod.GET)
	public ModelAndView groupUploadForm(@RequestParam String revIdx) {
		logger.info("리뷰 수정 폼 이동");
		return reviewService.reviewUpdateForm(revIdx);
	}
	
	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.POST)
	public ModelAndView reviewUpdate( @RequestParam HashMap<String , String> params) {
		logger.info("리뷰 수정 요청");
		logger.info("params: {}" ,params);	
		return reviewService.reviewUpdate(params);
	}
	
	@RequestMapping(value = "/reviewDelete", method = RequestMethod.GET)
	public ModelAndView reviewDelete(@RequestParam String revIdx) {
		logger.info("리뷰 삭제 요청");
		logger.info("삭제할 리뷰: {}" ,revIdx);	
		return reviewService.reviewDelete(revIdx);
	}


}
