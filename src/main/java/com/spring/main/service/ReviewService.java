package com.spring.main.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.ReviewDAO;
import com.spring.main.dto.ReviewDTO;

@Service
public class ReviewService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReviewDAO reviewDAO;
	
	@Value("#{config['Globals.root']}")
	String root;

	String page = "";
	String msg = "";
	
	public HashMap<String, Object> list(int page,String comId) {
		logger.info("리뷰리스트 내놔");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int allCnt = reviewDAO.allCount(comId);//전체 게시글 수
		//게시글수 :21개 ,페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		//예 : 21/5 =4.1이면 소수점을 버리고 1을 더해 5가 된다. 딱 떨어지면 그대로.
		int range = allCnt%10 > 0 ? Math.round(allCnt/10)+1 : Math.round(allCnt/10);
		
		//생성 가능한 페이지 보다 현재 페이지가 클 경우..현재페이지를 생성 가능한 페이지로 맞춰준다.
		page = page>range ? range : page;
		
		//시작,끝
		int end = page * 10;
		int start = end-10+1;
		
		map.put("reviewList", reviewDAO.reviewList(start,end,comId));
		//pagePerCnt의 기준으로 몇페이지나 만들수 있는가? 
		map.put("range",range);
		map.put("currPage", page);
		return map;
	}

	
	public ModelAndView reviewWrite(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		ReviewDTO reviewDTO = new ReviewDTO();
		reviewDTO.setComId(params.get("comId"));
		reviewDTO.setId(params.get("id"));
		reviewDTO.setSubject(params.get("subject"));
		reviewDTO.setContent(params.get("content"));
		reviewDTO.setRate(Float.parseFloat((params.get("rate"))));
		int result = reviewDAO.reviewWrite(reviewDTO);
		page = "redirect:/reviewWriteForm";
		msg="글쓰기에 실패했습니다.";
		logger.info("reviewWrite result:" + result);

		if (result > 0) { // 글쓰기 성공시
			page = "redirect:/reviewDetail?revIdx=" + reviewDTO.getRevIdx();
			msg = "글쓰기에 성공하였습니다";
		} 
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}



	public ModelAndView reviewDetail(String revIdx) {
		ModelAndView mav = new ModelAndView();
		logger.info("리뷰 상세보기 서비스");
		ReviewDTO reviewDTO = reviewDAO.reviewDetail(revIdx);
		logger.info("reviewDTO: " + reviewDTO);
		page = "reviewList";
		if (reviewDTO != null) {
			page = "reviewDetail";
			mav.addObject("dto", reviewDTO);
		}
		mav.setViewName(page);
		return mav;
	}


	public ModelAndView reviewUpdateForm(String revIdx) {
		ModelAndView mav = new ModelAndView();
		logger.info("리뷰 수정폼 서비스");
		ReviewDTO reviewDTO = reviewDAO.reviewDetail(revIdx);
		logger.info("reviewDTO: " + reviewDTO);
		page = "reviewList";
		if (reviewDTO != null) {
			page = "reviewUpdateForm";
			mav.addObject("dto", reviewDTO);
		}
		mav.setViewName(page);
		return mav;
	}


	public ModelAndView reviewUpdate(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		ReviewDTO reviewDTO = new ReviewDTO();
		reviewDTO.setRevIdx(Integer.parseInt(params.get("revIdx")));
		reviewDTO.setComId(params.get("comId"));
		reviewDTO.setId(params.get("id"));
		reviewDTO.setSubject(params.get("subject"));
		reviewDTO.setContent(params.get("content"));
		reviewDTO.setRate(Float.parseFloat((params.get("rate"))));
		int result = reviewDAO.reviewUpdate(reviewDTO);
		page = "redirect:/reviewUpdateForm";
		msg="글수정에 실패했습니다.";
		logger.info("reviewUpdate result:" + result);

		if (result > 0) { // 글수정 성공시
			page = "redirect:/reviewDetail?revIdx=" + reviewDTO.getRevIdx();
			msg = "글수정에 성공하였습니다";
		} 
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}


	public ModelAndView reviewDelete(String revIdx) {
		ModelAndView mav = new ModelAndView();
		int result = reviewDAO.reviewDelete(revIdx);
		page="redirect:/reviewDatail?revIdx"+revIdx;
		msg="삭제에 실패하였습니다.";
		if(result>0) {
			msg="삭제가 완료되었습니다.";
			page="reviewList";
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}

}
