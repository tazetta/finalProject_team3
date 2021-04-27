package com.spring.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardDAO;
import com.spring.main.dto.BoardDTO;

@Service
public class BoardService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	BoardDAO boarddao;
	
	
	public ModelAndView boarddetail(String boardIdx) {
		 ModelAndView mav = new ModelAndView();
		 logger.info("상세보기 서비스 요청합니다.");
		 BoardDTO dto=boarddao.Boarddetail(boardIdx);
		 logger.info("게시판글번호{}입니다.",boardIdx);
		 String page="";
		 String category = null; 
		 String formcategory=null;
		 if (dto != null) {
				category = boarddao.boardCtg(dto.getBoardIdx()); // 카테고리 가져오기
				dto.setCategory(category); // 카테고리idx 담기
				
				mav.addObject("dto", dto);
				
				boarddao.boardUpHit(boardIdx); //조회수 증가
				if(category.equals("2")) {
					formcategory = boarddao.formCtg(dto.getBoardIdx()); //  form 카테고리가져오기
					dto.setFormcategory(formcategory); //  boardidx 담기
				}
	}
		 if(category.equals("1")){//페이지 보내기
			 mav.setViewName("freedetail");
		 } else if(category == "2") {
			 mav.setViewName("homedetail");
		 } else if(category == "3") {
			 mav.setViewName("tipdetail");
		 }else if(category == "4") {
			 mav.setViewName("qnadetail");
		 }else if(category == "5") {
			 mav.setViewName("examdetail");
		 }else if(category == "6") {
			 mav.setViewName("sgtdetail");
		 }
		
			 
		 mav.setViewName(page);
		 return mav;
	}
	
	
}
