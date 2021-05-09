package com.spring.main.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

import com.spring.main.dto.BoardDTO;
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
	/*
	@RequestMapping(value = "/helpSearchList", method = RequestMethod.GET)
	public Map<String, Object> gethelplist(
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="opt", required=false, defaultValue="all") String opt,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword){
			logger.info("pageNum : "+ pageNum +",opt: "+ opt + ",keyword : "+ keyword);
			Map<String, Object> map = BoardService.getBoardList(pageNum, 4, opt, keyword);
			return map;
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
		logger.info("cntBoardList");
		logger.info("pagePerCnt : {} / page :{}", pagePerCnt, page);
		logger.info("cntreco : {} ", CNTRECO);
		return BoardService.cntboardList(pagePerCnt,page,CNTRECO);
	}
	*/
	
	/**
	 * 꿀팁 목록 조회
	 * @param pageNum 이동하려는 페이지 번호
	 * @param orderBy 정렬 (최신순/추천순)
	 * @return
	 */
	@RequestMapping(value = "/api/tip", method = RequestMethod.GET)
	public Map<String, Object> getApitipmainrecent(
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="orderBy", required=false, defaultValue="recent") String orderBy,
			@RequestParam(value="opt", required=false, defaultValue="all") String opt,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword
			){
		logger.info("tipList");
		
		System.out.println("pageNum: " + pageNum + ", orderBy : " + orderBy + ", opt : " + opt + ", keyword : " + keyword);
		
		return BoardService.getTipmain(pageNum, orderBy, opt, keyword); //사용
	}

	
	
	
	/**
	 * 자유게시판 목록 조회
	 * @param pageNum 이동하려는 페이지번호
	 * @param opt 선택한 select 값
	 * @param keyword 입력한 검색어 값
	 * @return
	 * */
	@RequestMapping(value = "/api/freelist", method = RequestMethod.GET)
	public Map<String, Object> getApiFreelist(
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="opt", required=false, defaultValue="all") String opt,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword) {
		
		logger.info("pageNum : " + pageNum + ", opt : " + opt + ", keyword : " + keyword);
		
		Map<String, Object> map = BoardService.getBoardList(pageNum, 1, opt, keyword);
		
		return map;
	}
	

	
	/**
	 * 도와줘요 게시판 목록 조회
	 * @param pageNum 이동하려는 페이지번호
	 * @param opt 선택한 select 값
	 * @param keyword 입력한 검색어 값
	 * @return
	 */
	@RequestMapping(value = "/api/helpmain",method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> getApiHelpmain(
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="opt", required=false, defaultValue="all") String opt,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="orderBy", required=false, defaultValue="recent") String orderBy,
			@RequestParam(value="isWaitForAnswer", required=false, defaultValue="F") char isWaitForAnswer) {
		
		logger.info("pageNum : " + pageNum + ", opt : " + opt + ", keyword : " + keyword + ", orderBy : " + orderBy + ", isWaitForAnswer : " + isWaitForAnswer);
		
		Map<String, Object> map = BoardService.getHelpmain(pageNum, opt, keyword, orderBy, isWaitForAnswer);
		
		return map;
	}
	
	/**
	 * 우리집 자랑 게시판 목록 조회 
	 * @param pageNum 이동하려는 페이지 번호
	 * @param orderBy 정렬 (최신순/추천순)
	 * @return
	*/
	@RequestMapping(value = "/api/homemain", method = RequestMethod.GET)
	public Map<String, Object> getApiHomemainList(
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="orderBy", required=false, defaultValue="recent") String orderBy,
			@RequestParam(value="formcategory", required=false, defaultValue="")String formcategory,
			@RequestParam(value="budget", required=false, defaultValue="")int budget,
			@RequestParam(value="roomsize", required=false, defaultValue="") int roomsize
			){
		logger.info("homemainlist");
		logger.info("파람들 : " + pageNum+ ",orderBy:" +orderBy+ ",formcategory"+ formcategory+",budget"+budget+",roomsize"+roomsize);
		return BoardService.homeMainList(pageNum, keyword,orderBy, formcategory, budget, roomsize);
	}

	
	
}
