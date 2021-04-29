package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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

import com.spring.main.service.AdminService;
import com.spring.main.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService BoardService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminService service;

	@RequestMapping(value = "/FAQ", method = RequestMethod.GET)
	public String FAQ() {
		logger.info("고객센터페이지입니다.");
		return "FAQ";
	}
	@RequestMapping(value = "/Freeview", method = RequestMethod.GET)
	public String Freeview() {
		logger.info("프리뷰.");
		return "Freeview";
	}
	@RequestMapping(value = "/Freelist", method = RequestMethod.GET)
	public String Freelist() {
		logger.info("자유게시판");
		return "Freelist";
	}
	@RequestMapping(value = "/FAQsend", method = RequestMethod.GET)
	public String FAQsend() {
		return "FAQsend";
	}

	@RequestMapping(value = "/mainnavi", method = RequestMethod.GET)
	public String mainnavi() {
		return "mainnavi";
	}

	@RequestMapping(value = "/examlist", method = RequestMethod.GET)
	public String examlist() {
		logger.info("시공사례리스트");
		return "examlist";
	}

	@RequestMapping(value = "/boarddetail", method = RequestMethod.GET)
	public ModelAndView boarddetail(@RequestParam String boardIdx) {
		logger.info("게시글idx{}상세보기", boardIdx);
		return BoardService.boarddetail(boardIdx);
	}

	@RequestMapping(value = "/boardWriteForm", method = RequestMethod.GET)
	public String boardWriteForm(HttpSession session, @RequestParam String boardCtgIdx) {
		logger.info("{} 카테고리글쓰기 페이지로 이동", boardCtgIdx);
		// 업로드할 파일이름을 저장한 HashMap생성해서 session에 저장(upload메서드에서 여러파일을 관리하기위해)
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		String page = "";
		if (boardCtgIdx.equals("1")) {
			page = "freeWriteForm";
			logger.info("1 카테고리글쓰기 페이지로 이동");
		} else if (boardCtgIdx.equals("2")) {
			page = "HomeWriteForm";
			logger.info("2 카테고리글쓰기 페이지로 이동");
		} else if (boardCtgIdx.equals("3")) {
			page = "TipWriteForm";
			logger.info("3 카테고리글쓰기 페이지로 이동");
		} else if (boardCtgIdx.equals("4")) {
			page = "QnaWriteForm";
			logger.info("4 카테고리글쓰기 페이지로 이동");
		} else if (boardCtgIdx.equals("5")) {
			page = "examWriteForm";
			logger.info("5 카테고리글쓰기 페이지로 이동");
		} else if (boardCtgIdx.equals("6")) {
			page = "SgtWriteForm";
			logger.info("6 카테고리글쓰기 페이지로 이동");
		}
		return page;
	}
	@RequestMapping(value = "/boardUploadForm", method = RequestMethod.GET)
	public String groupUploadForm() {

		logger.info("업로드폼열기");
		return "boardUploadForm";
	}
	@RequestMapping(value = "/boardUpload", method = RequestMethod.POST)
	public ModelAndView groupUpload(MultipartFile file, HttpSession session) { // groupUploadForm.jsp에서 보내는 file객체를 받고,
																				// session도 생성
		logger.info("파일업로드 요청");

		return BoardService.boardUpload(file, session);
	}
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public ModelAndView boardWrite(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("{}번째 게시판 글쓰기 요청",params);
		return BoardService.boardWrite(params, session);
	}

	@RequestMapping(value = "/boardUpdateForm/{boardIdx}", method = RequestMethod.GET)
	public @ResponseBody ModelAndView groupUpdateForm(@PathVariable String boardIdx, HttpSession session) {
		logger.info("글수정하기 form 요청: " + boardIdx);
		// 업로드할 파일이름을 저장한 HashMap생성해서 session에 저장(upload메서드에서 여러파일을 관리하기위해)
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		return BoardService.updateForm(boardIdx);
	}

	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public ModelAndView groupUpdate(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("수정하기 요청");
		logger.info("params: {}", params);
		return BoardService.boardUpdate(params, session);
	}

	@RequestMapping(value = "/boardDel/{boardIdx}")
	public ModelAndView boardDel(@PathVariable String boardIdx, @PathVariable String brdCtgIdx, HttpSession session,RedirectAttributes rAttr) {
		logger.info("삭제하는글번호{}", boardIdx);
		logger.info("삭제하는카테고리{}", brdCtgIdx);
		return BoardService.boardDel(boardIdx,brdCtgIdx,session,rAttr);
	}
	// 비동기로 받기 때문에 @ResponseBody
	@RequestMapping(value = "/boardFileDelete", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> boardFileDelete(@RequestParam String fileName, HttpSession session) { // 세션에서도
																														// 삭제
		logger.info(fileName + " ->파일 삭제 요청");
		return BoardService.fileDelete(fileName, session);
	}
	
	
}