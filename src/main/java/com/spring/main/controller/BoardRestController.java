package com.spring.main.controller;

import java.sql.Date;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.service.BoardService;;

@RestController
public class BoardRestController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired BoardService BoardService;


	@RequestMapping(value = "/FreeListPage", method = RequestMethod.GET)
	public ModelAndView home() {
		logger.info("자유게시판으로");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Freelist");
		return mav;
	}
	@RequestMapping(value = "/helpSearchList", method = RequestMethod.GET)
	public ModelAndView BoardSearchList(Model model, @RequestParam HashMap<String, String> params,
			RedirectAttributes rAttr) {
		logger.info("도와줘요 자취만렙 세부검색 리스트");
		ModelAndView mav = new ModelAndView();
		String opt = params.get("opt");
		String keyword = params.get("keyword");
		mav.addObject("searchopt", opt);
		mav.addObject("keyword", keyword);
		
		mav.setViewName("helpSearchList");
		return mav;
	}
	@RequestMapping(value = "/homemain/{pagePerCnt}/{page}/{order}/{formcategory}/{budget}/{roomsize}",  method = RequestMethod.GET)
	public HashMap<String, Object> homeMainList(@PathVariable int pagePerCnt,@PathVariable int page,
		@PathVariable String order,@PathVariable String formcategory,@PathVariable int budget,@PathVariable int roomsize){
		logger.info("pagePerCnt : {} / page : {}", pagePerCnt, page);
		logger.info("order :{}",  order);
		logger.info("formcategory : {} ", formcategory);
		logger.info("budget :{}", budget);
		logger.info("roomsize : {}", roomsize);
		
		return BoardService.homeMainList(pagePerCnt,page, order,formcategory,budget,roomsize);
	}
	@RequestMapping(value = "/homemain/{pagePerCnt}/{page}/{cntreco}", method = RequestMethod.GET)
	public HashMap<String, Object> cntboardList(@PathVariable int pagePerCnt,@PathVariable int page, @PathVariable int CNTRECO){
		
		logger.info("pagePerCnt : {} / page :{}", pagePerCnt, page);
		logger.info("cntreco : {} ", CNTRECO);
		return BoardService.cntboardList(pagePerCnt,page,CNTRECO);
	}
	
	@RequestMapping(value = "/tipMain/{pagePerCnt}/{page}/{cntreco}", method = RequestMethod.GET)
	public HashMap<String, Object> tipMain(@PathVariable int pagePerCnt,@PathVariable int page, @PathVariable int CNTRECO){
		
		logger.info("pagePerCnt : {} / page :{}", pagePerCnt, page);
		logger.info("cntreco : {} ", CNTRECO);
		return BoardService.cntboardList(pagePerCnt,page,CNTRECO);
	}
	
		
	
}
