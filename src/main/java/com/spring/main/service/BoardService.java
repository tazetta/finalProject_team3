package com.spring.main.service;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardDAO;
import com.spring.main.dto.BoardDTO;

@Service
public class BoardService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	BoardDAO boarddao;
	
	// properties파일 내용 불러오기
		@Value("#{config['Globals.root']}")
		String root;

		String page = "";
		String msg = "";
		
	public ModelAndView boarddetail(String boardIdx) {
		 ModelAndView mav = new ModelAndView();
		 logger.info("상세보기 서비스 요청합니다.");
		 BoardDTO dto=boarddao.Boarddetail(boardIdx);
		 logger.info("게시판글번호{}입니다.",boardIdx);
		 String category = null; 
		 String formcategory=null;
		 if (dto != null) {
				category = boarddao.boardCtg(dto.getBoardIdx()); // 카테고리 가져오기
				dto.setCategory(category); // 게시판카테고리idx 담기
				
				mav.addObject("dto", dto);
				
				boarddao.boardUpHit(boardIdx); //조회수 증가
				if(category.equals("2")) {
					formcategory = boarddao.formCtg(dto.getBoardIdx()); //  form 카테고리가져오기
					dto.setFormcategory(formcategory); //   폼카테고리idx 담기
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

	@Transactional // 글등록에 실패하면 저장한 파일내용 등록도 실행되지 않도록
	public ModelAndView boardWrite(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav =new ModelAndView();
		BoardDTO boarddto=new BoardDTO();
		int boardctg = Integer.parseInt(params.get("boardCtg"));//카테고리구별용
		
		boarddto.setBrdctgidx(boardctg);
		boarddto.setSubject(params.get("subject"));
		boarddto.setContent(params.get("content"));
		boarddto.setId(params.get("id"));
		if(boardctg==2) {//카테고리가 2 (우리집자랑)일경우
			boarddto.setRoomsize(Integer.parseInt(params.get("roomsize")));//평수
			boarddto.setBudget(Integer.parseInt(params.get("budget")));//예산
			boarddto.setFormcategory(params.get("formctg"));//주거형태
		}
		int result = boarddao.boardWrite(boarddto);
		//실패시 다시 카테고리에 맞는 수정폼으로 보내기
		if(boardctg==1) {
			page = "redirect:/freeWriteForm";
		}else if(boardctg==2) {
			page = "redirect:/homeWriteForm";
		}else if(boardctg==3) {
			page = "redirect:/tipWriteForm";
		}else if(boardctg==4) {
			page = "redirect:/qnaWriteForm";
		}else if(boardctg==5) {
			page = "redirect:/examWriteForm";
		}else if(boardctg==6) {
			page = "redirect:/sgtWriteForm";
		}
		// 1. session에서 fileList를 가져온다
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		logger.info("fileList:" + fileList.size());
		if (result > 0) {//글쓰기 성공시
			logger.info("카테고리번호{}글번호:{} ",boardctg,boarddto.getBoardIdx());
			
			// 2. fileList에 저장된 파일이 있는지 확인한다.
		if (fileList.size() > 0) {
			// 3. 업로드한 파일이 있을 경우 저장한 파일내용을 DB에 기록
			// newFileName, originFileName, idx
			// 맵에 있는 모든 값을 빼서 DB에 넣는다
			for (String key : fileList.keySet()) { // 여러개의 파일이 있을 수 있으므로 for문 사용
				boarddao.boardWriteFile(key, fileList.get(key), boarddto.getBoardIdx());
			}
		}
		
		page="redirect:/boardDetail?boardIdx="+boarddto.getBoardIdx();
		msg="글쓰기 성공했습니다.";
		}else{//글쓰기 실패시
			for (String newFileName : fileList.keySet()) {
				File file = new File(root + "upload/" + newFileName);
				file.delete();
			}
		}
		mav.addObject("msg",msg);
		mav.setViewName(page);
		return mav;
	}
	
	
}
