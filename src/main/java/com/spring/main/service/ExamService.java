package com.spring.main.service;

import java.io.File;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.EstimateDAO;
import com.spring.main.dao.ExamDAO;
import com.spring.main.dao.ReviewDAO;
import com.spring.main.dto.ExamDTO;
import com.spring.main.dto.GroupDTO;
import com.spring.main.dto.ReviewDTO;

@Service
public class ExamService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ExamDAO examDAO;
	@Autowired EstimateDAO estimateDAO;
	
	@Value("#{config['Globals.root']}")
	String root;

	String page = "";
	String msg = "";
	
//	public HashMap<String, Object> list(int page) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		
//		int allCnt = examDAO.allCount();//전체 게시글 수
//		//게시글수 :21개 ,페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
//		//예 : 21/5 =4.1이면 소수점을 버리고 1을 더해 5가 된다. 딱 떨어지면 그대로.
//		int range = allCnt%10 > 0 ? Math.round(allCnt/10)+1 : Math.round(allCnt/10);
//		
//		//생성 가능한 페이지 보다 현재 페이지가 클 경우..현재페이지를 생성 가능한 페이지로 맞춰준다.
//		page = page>range ? range : page;
//		
//		//시작,끝
//		int end = page * 10;
//		int start = end-10+1;
//		
//		map.put("interiorexamList", examDAO.interiorexamList(start,end));
//		//pagePerCnt의 기준으로 몇페이지나 만들수 있는가? 
//		map.put("range",range);
//		map.put("currPage", page);
//		return map;
//	}

	@Transactional // 글등록에 실패하면 저장한 파일내용 등록도 실행되지 않도록
	public ModelAndView examWrite(HashMap<String, String> params, HttpSession session) {

		String comId = "company1"; // 세션아이디 넣을예정

		ModelAndView mav = new ModelAndView();
		ExamDTO examDTO = new ExamDTO();

		examDTO.setComId(params.get("comId"));
		examDTO.setSubject(params.get("subject"));
		examDTO.setContent(params.get("content"));
		
		int result = examDAO.examWrite(examDTO);
		page = "redirect:/examWriteForm";

		logger.info("examWrite result:" + result);

		// 1. session에서 fileList를 가져온다
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		logger.info("fileList:" + fileList.size());
		if (result > 0) { // 글쓰기 성공시
			logger.info("gpidx: " + examDTO.getCombrdIdx()); // 시공사례 글 idx 뽑아오기

			// 2. fileList에 저장된 파일이 있는지 확인한다.
			if (fileList.size() > 0) {
				// 3. 업로드한 파일이 있을 경우 저장한 파일내용을 DB에 기록
				// newFileName, originFileName, idx
				// 맵에 있는 모든 값을 빼서 DB에 넣는다
				for (String key : fileList.keySet()) { // 여러개의 파일이 있을 수 있으므로 for문 사용
					examDAO.examWriteFile(key, fileList.get(key), examDTO.getCombrdIdx());
				}
			}

			page = "redirect:/examDetail?combrdIdx=" + examDTO.getCombrdIdx();
			msg = "글쓰기에 성공하였습니다";

		} else { // 글쓰기 실패시
			for (String newFileName : fileList.keySet()) {
				File file = new File(root + "upload/" + newFileName);
				file.delete();
			}
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView examDetail(int combrdIdx) {
		ModelAndView mav = new ModelAndView();
		logger.info("상세보기 서비스");
		ExamDTO dto = examDAO.examDetail(combrdIdx);
		logger.info("ExamDTO: " + dto);
		page = "interiorexamList";
		if (dto != null) {
			mav.addObject("dto", dto);
			examDAO.examUpHit(combrdIdx); // 조회수 증가
			page = "examDetail";
		}
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView updateForm(int combrdIdx) {
		ModelAndView mav = new ModelAndView();
		logger.info("수정폼 서비스");
		ExamDTO dto = examDAO.examDetail(combrdIdx);
		logger.info("ExamDTO: " + dto);
		page = "interiorexamList";
		if (dto != null) {
			mav.addObject("dto", dto);
			page = "examUpdateForm";
		}
		mav.setViewName(page);
		return mav;
	}

	@Transactional
	public ModelAndView examUpdate(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ExamDTO examDTO = new ExamDTO();
		logger.info("시공사례수정 서비스");

		examDTO.setCombrdIdx(Integer.parseInt(params.get("combrdIdx")));
		examDTO.setSubject(params.get("subject"));
		examDTO.setContent(params.get("content"));


		page = "redirect:/examDetail?combrdIdx=" + examDTO.getCombrdIdx();
		msg = "글 수정에 실패했습니다";
		int result = examDAO.examUpdate(examDTO); // 게시글 업데이트
		logger.info("글 업데이트 결과:" + result);

		// 1. session에서 fileList를 가져온다
		@SuppressWarnings("unchecked")
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		logger.info("fileList:" + fileList.size());
		if (result > 0) { // 글 수정 성공시
			logger.info("gpidx: " + examDTO.getCombrdIdx()); // 시공사례 글 idx 뽑아오기

			// 2. fileList에 저장된 파일이 있는지 확인한다.
			if (fileList.size() > 0) {
				// 3. 업로드한 파일이 있을 경우 저장한 파일내용을 DB에 기록
				// newFileName, originFileName, gpIdx
				// 맵에 있는 모든 값을 빼서 DB에 넣는다
				for (String key : fileList.keySet()) { // 여러개의 파일이 있을 수 있으므로 for문 사용
					examDAO.groupUpdateFile(key, fileList.get(key), examDTO.getCombrdIdx());
				}
			}
			msg = "글수정에 성공하였습니다";
		} else { // 글수정 실패시
			for (String newFileName : fileList.keySet()) {
				File file = new File(root + "upload/" + newFileName);
				file.delete();
			}
		}
		mav.setViewName(page);
		return mav;
	}
	
	@Transactional
	public ModelAndView examDel(int combrdIdx, HttpSession session, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		String newFileName = examDAO.examGetFileName(combrdIdx);
		msg = "삭제에 실패했습니다";

		logger.info("newFileName: " + newFileName);
		if (newFileName != null) { // 파일이 있으면
			int success = examDAO.examPhotoDel(combrdIdx); // DB에서 삭제
			logger.info("photos 삭제 결과:" + success);
		}

		int success = examDAO.examDel(combrdIdx);
		logger.info("글 삭제결과: " + success);

		if (success > 0 && newFileName != null) {
			HashMap<String, Object> map = fileDelete(newFileName, session);
			int result = (int) map.get("success");
			logger.info("result:" + result);
		}
		msg = "삭제되었습니다.";
		rAttr.addFlashAttribute("msg", msg);

		mav.setViewName("redirect:/interiorexamList");
		return mav;
	}
	
	/* 파일삭제 */
	@Transactional
	public HashMap<String, Object> fileDelete(String fileName, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// File객체를 이용해 fileName으로 실제 파일 삭제
		File delFile = new File(root + "upload/" + fileName);
		int success = 1;
		try {
			logger.info("delete File: " + delFile);
			if (delFile.exists()) { // 해당 경로에 실제 파일이 있으면
				delFile.delete(); // 삭제
			} else {
				logger.info("이미 삭제된 파일");
			}
			// session에 있는 fileList에서도 파일명 삭제 -> 변경된 내용 session에 저장
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			if (fileList.get(fileName) != null) { // session의 list안에 삭제한 파일이 있다면
				fileList.remove(fileName); // 실제로 지워진 파일이니까 파일명을 지정해서 session에서도 삭제
				logger.info("삭제후 남은 파일 수:" + fileList.size());
			}
			;
			session.setAttribute("fileList", fileList); // 변경된 내용을 다시 session에 저장

		} catch (Exception e) {
			e.printStackTrace();
			success = 0;
		} finally {
			// 결과를 map에 담아서 반환
			map.put("success", success);
		}

		return map;
	}

	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		ArrayList<ExamDTO> list = examDAO.list();
		mav.addObject("list",list);
		mav.setViewName("interiorexamList");
		return mav;
	}

	public ModelAndView interiorCompanyDetail(String comId) {
		ModelAndView mav = new ModelAndView();
		ExamDTO dto = examDAO.interiorCompanyDetail(comId);
		ArrayList<ExamDTO> examList = examDAO.examSemiList(comId);
		ArrayList<ReviewDTO> reviewList = examDAO.reviewSemiList(comId);
		Float rate = examDAO.reviewrate(comId);
		mav.addObject("rate",rate);
		mav.addObject("examList",examList);
		mav.addObject("reviewList", reviewList);
		mav.addObject("dto",dto);
		mav.setViewName("interiorCompanyDetail");
		return mav;
	}

	public HashMap<String, Object> comExamList(int page,String comId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int allCnt = examDAO.allCount(comId);//전체 게시글 수
		//게시글수 :21개 ,페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		//예 : 21/5 =4.1이면 소수점을 버리고 1을 더해 5가 된다. 딱 떨어지면 그대로.
		int range = allCnt%10 > 0 ? Math.round(allCnt/10)+1 : Math.round(allCnt/10);
		
		//생성 가능한 페이지 보다 현재 페이지가 클 경우..현재페이지를 생성 가능한 페이지로 맞춰준다.
		page = page>range ? range : page;
		
		//시작,끝
		int end = page * 10;
		int start = end-10+1;
		
		map.put("list", examDAO.comExamList(start,end,comId));
		//pagePerCnt의 기준으로 몇페이지나 만들수 있는가? 
		map.put("range",range);
		map.put("currPage", page);
		return map;
	}

	public HashMap<String, Object> examListScroll(int count) {
		int cnt = count*8;
		int allCnt = examDAO.allScrollCount();
		logger.info("전체 게시물수:{},불러올 게시물수:{}",allCnt,cnt);
		HashMap<String, Object> map = new HashMap<String, Object>();	
		if(allCnt>=cnt) {
			map.put("list",examDAO.examListScroll(cnt));			
		}else {
			map.put("list",examDAO.examListScroll(allCnt));			
		}
		return map;
	}

	public HashMap<String, Object> estimatelist(int page, String comId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int allCnt = examDAO.allCount(comId);//전체 게시글 수
		//게시글수 :21개 ,페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		//예 : 21/5 =4.1이면 소수점을 버리고 1을 더해 5가 된다. 딱 떨어지면 그대로.
		int range = allCnt%10 > 0 ? Math.round(allCnt/10)+1 : Math.round(allCnt/10);
		
		//생성 가능한 페이지 보다 현재 페이지가 클 경우..현재페이지를 생성 가능한 페이지로 맞춰준다.
		page = page>range ? range : page;
		
		//시작,끝
		int end = page * 10;
		int start = end-10+1;
		
		map.put("list", examDAO.estimateList(start,end,comId));
		//pagePerCnt의 기준으로 몇페이지나 만들수 있는가? 
		map.put("range",range);
		map.put("currPage", page);
		return map;
	}

	

}
