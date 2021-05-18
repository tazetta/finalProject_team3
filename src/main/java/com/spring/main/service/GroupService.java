package com.spring.main.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.GroupDAO;
import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.Comments2ndDTO;
import com.spring.main.dto.CommentsDTO;
import com.spring.main.dto.GroupDTO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.ReportDTO;

@Service
public class GroupService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	GroupDAO groupdao;

	@Autowired
	MemberDAO memberdao;

	// properties파일 내용 불러오기
	@Value("#{config['Globals.root']}")
	String root;

	String page = "";
	String msg = "";

	@Transactional // 글등록에 실패하면 저장한 파일내용 등록도 실행되지 않도록
	public ModelAndView groupWrite(HashMap<String, String> params, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		ModelAndView mav = new ModelAndView();
		GroupDTO groupDTO = new GroupDTO();
		int groupCtg = Integer.parseInt(params.get("groupCtg"));
		int maxUser = Integer.parseInt(params.get("maxUser"));

		String str = params.get("deadline");
		SimpleDateFormat dfm = new SimpleDateFormat("yyyy-mm-dd");
		java.util.Date utilDate = null;
		try {
			utilDate = dfm.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String transDate = dfm.format(utilDate);
		Date deadline = Date.valueOf(transDate); // str -> sql DATE로 변환

		groupDTO.setGpCtgIdx(groupCtg);
		groupDTO.setId(params.get("id"));
		groupDTO.setSubject(params.get("subject"));
		groupDTO.setContent(params.get("content"));
		groupDTO.setChatURL(params.get("chatUrl"));
		groupDTO.setMaxUser(maxUser);
		groupDTO.setDeadline(deadline);
		groupDTO.setProgIdx(1); // 진행중
		groupDTO.setCurrUser(0); // 신청인원
		int result = groupdao.groupWrite(groupDTO);
		page = "redirect:/groupWriteForm";

		logger.info("groupWrite result:" + result);

		// 1. session에서 fileList를 가져온다
		@SuppressWarnings("unchecked")
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		logger.info("fileList:" + fileList.size());
		if (result > 0) { // 글쓰기 성공시
			logger.info("gpidx: " + groupDTO.getGpIdx()); // 공동구매 글 idx 뽑아오기

			// 2. fileList에 저장된 파일이 있는지 확인한다.
			if (fileList.size() > 0) {
				// 3. 업로드한 파일이 있을 경우 저장한 파일내용을 DB에 기록
				// newFileName, originFileName, idx, id
				// 맵에 있는 모든 값을 빼서 DB에 넣는다
				for (String key : fileList.keySet()) { // 여러개의 파일이 있을 수 있으므로 for문 사용
					groupdao.groupWriteFile(key, fileList.get(key), groupDTO.getGpIdx(), groupDTO.getId());
				}
			}

			page = "redirect:/groupDetail?gpIdx=" + groupDTO.getGpIdx() + "&loginId=" + loginId;

		} else { // 글쓰기 실패시
			for (String newFileName : fileList.keySet()) {
				File file = new File(root + "upload/" + newFileName);
				file.delete();
			}
		}

		mav.setViewName(page);
		return mav;
	}

	@Transactional
	public ModelAndView detail(int gpIdx, String loginId) {
		ModelAndView mav = new ModelAndView();
		logger.info("상세보기 서비스");
		GroupDTO dto = groupdao.groupDetail(gpIdx);
		logger.info("groupDTO: " + dto);
		page = "groupList";
		if (dto != null) {
			String category = groupdao.groupCtg(dto.getGpCtgIdx()); // 카테고리 가져오기
			dto.setCategory(category); // 카테고리명 담기

			String progress = groupdao.gpProgress(dto.getProgIdx()); // 진행상황 가져오기
			dto.setProgress(progress); // 진행상황 담기

			logger.info("progress:" + progress);

			/* 회원등급 가져오기 */
			MemberDTO memberDTO = memberdao.gradeChk(dto.getId());
			logger.info("gradeIdx:" + memberDTO.getGradeIdx());
			String grade = memberdao.getGrade(memberDTO.getGradeIdx()); // 회원등급명 가져오기
			logger.info("grade:" + grade);

			mav.addObject("dto", dto);
			mav.addObject("writerGrade", grade);

			groupdao.groupUpHit(gpIdx); // 조회수 증가

			String state = "";
			String applyId = groupdao.applyCheck(gpIdx, loginId); // 신청유무 조회
			logger.info("신청 아이디:" + applyId);

			if (applyId != null) {
				state = "true"; // 신청함
				logger.info("신청상태:" + state);

			} else {
				state = "false"; // 신청안함
				logger.info("신청상태:" + state);
			}

			mav.addObject("state", state);
			page = "groupDetail";
		}
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView fileUpload(MultipartFile file, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		logger.info("파일업로드 서비스");
		/* file Upload 시작 */
		// 1. 경로 설정
		File dir = new File(root + "upload/");

		// 2. 경로가 없으면 폴더 생성
		if (!dir.exists()) {
			logger.info("폴더없음, 폴더생성");
			dir.mkdir();
		}

		// 3. 파일명 추출
		String fileName = file.getOriginalFilename();

		// 4. 새 파일명 생성(현재시간을 m/s단위로 환산한 이름)
		String newFileName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
		logger.info(fileName + "=> " + newFileName);

		// 5. 파일 저장(JAVA nio활용 -> java7부터 가능)
		try {
			// MultipartFile에서 바이너리 데이터를 추출
			byte[] bytes = file.getBytes();
			// 저장할 경로 지정
			Path filePath = Paths.get(root + "upload/" + newFileName);
			// 파일 저장
			Files.write(filePath, bytes);

			// session에 내가 저장한 파일 내역을 저장한다.
			@SuppressWarnings("unchecked")
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList"); // writeForm에서
																											// 세션에 저장했던
																											// hashmap가져오고
			fileList.put(newFileName, fileName); // 중복되지 않는 newFileName를 키로 설정해서 새로운 파일명을 session에 저장
			logger.info("현재 저장된 파일 수: " + fileList.size());
			session.setAttribute("fileList", fileList); // 세션에 저장
			mav.addObject("path", "/photo/" + newFileName); // server에서 설정했던 path= /photo

		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.setViewName("groupUploadForm");

		return mav;
	}

	/* 파일삭제 */
	@Transactional
	public HashMap<String, Object> fileDelete(ArrayList<String> fileName, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int success = 1;
		try {
		for (int i = 0; i < fileName.size(); i++) {
			// File객체를 이용해 fileName으로 실제 파일 삭제
			File delFile = new File(root + "upload/" + fileName.get(i));
			logger.info("delete File: " + delFile);
			if (delFile.exists()) { // 해당 경로에 실제 파일이 있으면
				delFile.delete(); // 삭제
			} else {
				logger.info("이미 삭제된 파일");
			}
			// session에 있는 fileList에서도 파일명 삭제 -> 변경된 내용 session에 저장
			@SuppressWarnings("unchecked")
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			if (fileList.get(fileName.get(i)) != null) { // session의 list안에 삭제한 파일이 있다면
				fileList.remove(fileName.get(i)); // 실제로 지워진 파일이니까 파일명을 지정해서 session에서도 삭제
				logger.info("삭제후 남은 파일 수:" + fileList.size());
			}
			;
			session.setAttribute("fileList", fileList); // 변경된 내용을 다시 session에 저장
			
		}

		} catch (Exception e) {
			e.printStackTrace();
			success = 0;
		} finally {
			// 결과를 map에 담아서 반환
			map.put("success", success);
		}

		return map;
	}

	public HashMap<String, Object> groupList(int pagePerCnt, int page, int opt) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		// pagePerCnt의 기준으로 몇 페이지나 만들 수 있는가?(마지막 페이지)
		// -> 전체 게시글 수
		int allCnt = groupdao.groupAllCount(opt); // 공동구매 전체 게시글 수
		logger.info("group Purchase allCnt:" + allCnt);

		// 게시글 수 : 21개, 페이지 당 보여줄 수 : 10 =(나머지가 있는 경우 반올림해서)=> 최대 생성 가능한 페이지 : 3
		int range = allCnt % pagePerCnt > 0 ? Math.round(allCnt / pagePerCnt) + 1 : Math.round(allCnt / pagePerCnt);
		System.out.println("range:" + range);
		// 현재 페이지가 생성가능한 페이지보다 클 경우. .. 현재 페이지를 생성가능한 페이지로 맞춰준다.
		page = page > range ? range : page;

		// 시작, 끝
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;

		ArrayList<GroupDTO> groupList = groupdao.groupList(start, end, opt); // 리스트 담기
	
		logger.info("groupList size: " + groupList.size());

		map.put("list", groupList);
		map.put("range", range);
		map.put("currPage", page);

		return map;
	}

	/* 게시글 삭제 */
	@Transactional
	public ModelAndView groupDel(int gpIdx, HttpSession session, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		ArrayList<String> newFileName = groupdao.groupGetFileName(gpIdx);
		msg = "삭제에 실패했습니다";

		logger.info("newFileName: " + newFileName.size());
		
		if (newFileName.size()>0) { // 파일이 있으면
			
			int success = groupdao.groupPhotoDel(gpIdx); // DB에서 삭제
			logger.info("photos 삭제 결과:" + success);
		}

		int success = groupdao.groupDel(gpIdx);
		logger.info("글 삭제결과: " + success);

		if (success > 0 && newFileName.size()>0) {
			HashMap<String, Object> map = fileDelete(newFileName, session);
			int result = (int) map.get("success");
			logger.info("result:" + result);
		}
		msg = "삭제되었습니다.";
		rAttr.addFlashAttribute("msg", msg);

		mav.setViewName("redirect:/groupListPage");
		return mav;
	}

	public ModelAndView updateForm(int gpIdx, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		logger.info("수정할 글 form 서비스");
		GroupDTO dto = groupdao.groupDetail(gpIdx);
		logger.info("groupDTO: " + dto);
		page = "redirect:/groupDetail?gpIdx=" + gpIdx + "&loginId=" + loginId;
		if (dto != null) {
			String category = groupdao.groupCtg(dto.getGpCtgIdx()); // 카테고리 가져오기
			dto.setCategory(category); // 카테고리명 담기

			String progress = groupdao.gpProgress(dto.getProgIdx()); // 진행상황 가져오기
			dto.setProgress(progress); // 진행상황 담기

			mav.addObject("dto", dto);

			page = "groupUpdateForm";
		}
		mav.setViewName(page);
		return mav;

	}

	@Transactional
	public ModelAndView groupUpdate(HashMap<String, String> params, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		GroupDTO groupDTO = new GroupDTO();
		logger.info("글수정 서비스");

		int maxUser = Integer.parseInt(params.get("maxUser").toString());
		int gpCtgIdx = Integer.parseInt(params.get("gpCtgIdx").toString());
		int gpIdx = Integer.parseInt(params.get("gpIdx").toString());
		int progIdx = Integer.parseInt(params.get("progIdx").toString());

		/* sql Date로 변환 */
		String str = params.get("deadline");
		SimpleDateFormat dfm = new SimpleDateFormat("yyyy-mm-dd");
		java.util.Date utilDate = null;
		try {
			utilDate = dfm.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String transDate = dfm.format(utilDate);
		Date deadline = Date.valueOf(transDate);

		groupDTO.setGpIdx(gpIdx);
		groupDTO.setGpCtgIdx(gpCtgIdx);
		groupDTO.setSubject(params.get("subject"));
		groupDTO.setContent(params.get("content"));
		groupDTO.setChatURL(params.get("chatURL"));
		groupDTO.setMaxUser(maxUser);
		groupDTO.setDeadline(deadline);
		groupDTO.setProgIdx(progIdx); // 진행상황
		logger.info("groupdto:" + groupDTO);

		page = "redirect:/groupDetail?gpIdx=" + groupDTO.getGpIdx() + "&loginId=" + loginId;
		msg = "글 수정에 실패했습니다";
		int result = groupdao.groupUpdate(groupDTO); // 게시글 업데이트
		logger.info("글 업데이트 결과:" + result);

		// 1. session에서 fileList를 가져온다
		@SuppressWarnings("unchecked")
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		logger.info("fileList:" + fileList.size());
		if (result > 0) { // 글 수정 성공시
			logger.info("gpidx: " + groupDTO.getGpIdx()); // 공동구매 글 idx 뽑아오기

			// 2. fileList에 저장된 파일이 있는지 확인한다.
			if (fileList.size() > 0) {
				// 3. 업로드한 파일이 있을 경우 저장한 파일내용을 DB에 기록
				// newFileName, originFileName, gpIdx
				// 맵에 있는 모든 값을 빼서 DB에 넣는다
				for (String key : fileList.keySet()) { // 여러개의 파일이 있을 수 있으므로 for문 사용
					groupdao.groupUpdateFile(key, fileList.get(key), groupDTO.getGpIdx());
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

	public ModelAndView applyGroup(int gpIdx, String applyId, RedirectAttributes rAttr, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		logger.info("공동구매 신청 서비스");
		String applyCheck = groupdao.applyCheck(gpIdx, applyId);
		logger.info("공동구매 신청 여부:" + applyCheck);

		String state = "";
		msg = "신청에 실패했습니다";

		if (applyCheck != null) { // 이미 신청했다면
			int applyResult = groupdao.cancelGroup(gpIdx, applyId);
			logger.info("공동구매 취소 result: " + applyResult);
			int currResult = groupdao.currUserDown(gpIdx);
			logger.info("현재인원 감소 result:" + currResult);

			if (applyResult > 0 && currResult > 0) {
				msg = "신청취소 되었습니다";
				state = "false";
				logger.info("state:" + state);
			}

		} else {
			int applyResult = groupdao.applyGroup(gpIdx, applyId);
			logger.info("공동구매 신청 result: " + applyResult);
			int currResult = groupdao.currUserUp(gpIdx);
			logger.info("현재인원 증가 result:" + currResult);

			if (applyResult > 0 && currResult > 0) {
				msg = "신청되었습니다";
				state = "true";
				logger.info("state:" + state);
			}
		}
		groupdao.groupDownHit(gpIdx); // 조회수 감소
		
		GroupDTO dto = groupdao.groupDetail(gpIdx);
		if(dto.getCurrUser() ==dto.getMaxUser()) { //ㄴ모집인원과 현재 신청인원이 일치하면		
			int updateProg = 3;
			int result = groupdao.progUpdate(gpIdx,updateProg);
			logger.info("진행상황 마감 업데이트 result:" + result);
		}
		
		page = "redirect:/groupDetail?gpIdx=" + gpIdx + "&loginId=" + applyId;

		rAttr.addFlashAttribute("msg", msg);
		rAttr.addFlashAttribute("state", state);
		mav.setViewName(page);
		return mav;
	}

	public HashMap<String, Object> groupSearchList(int pagePerCnt, int page, String opt, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("검색리스트 서비스 ");
		// pagePerCnt의 기준으로 몇 페이지나 만들 수 있는가?(마지막 페이지)
		// -> 전체 게시글 수
		int allCnt = groupdao.groupSearchCount(opt, keyword); // 공동구매 검색 글 갯수
		logger.info("group Purchase searchCnt:" + allCnt);

		// 게시글 수 : 21개, 페이지 당 보여줄 수 : 10 =(나머지가 있는 경우 반올림해서)=> 최대 생성 가능한 페이지 : 3
		int range = allCnt % pagePerCnt > 0 ? Math.round(allCnt / pagePerCnt) + 1 : Math.round(allCnt / pagePerCnt);
		System.out.println("range:" + range);
		// 현재 페이지가 생성가능한 페이지보다 클 경우. .. 현재 페이지를 생성가능한 페이지로 맞춰준다.
		page = page > range ? range : page;

		// 시작, 끝
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		String startStr = Integer.toString(start);
		String endStr = Integer.toString(end);
		ArrayList<GroupDTO> groupList = groupdao.groupSearchList(startStr, endStr, opt, keyword); // 리스트 담기
		GroupDTO dto = null;

		logger.info("groupList size: " + groupList.size());

		String msg = keyword + "에 대한 검색결과가 없습니다. ";

		if (groupList.size() > 0) { // 검색결과가 있으면
			msg = keyword + "에 대한 검색결과가 " + groupList.size() + "건 있습니다.";
		}
		logger.info(msg);

		map.put("list", groupList);
		map.put("searchMsg", msg);
		map.put("range", range);
		map.put("currPage", page);

		return map;
	}

	public HashMap<String, Object> applyList(int gpIdx, RedirectAttributes rAttr, HttpSession session) {
		logger.info("신청자 리스트 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<GroupDTO> list = groupdao.applyList(gpIdx); //신청자 리스트 가져오기
		ArrayList<String> gradeList = new ArrayList<String>();
		logger.info("신청자  수:" + list.size());

		for (int i = 0; i < list.size() ; i++) {
			
				String applyId = list.get(i).getId(); //신청자 아이디 가져오기
				logger.info("applyId:"+applyId);
				
				MemberDTO applyGrade = memberdao.gradeChk(applyId); //신청자 아이디의 등급 idx가져오기
				logger.info("applyGrade: "+applyGrade.getGradeIdx());
				
				String memGrade =memberdao.getGrade(applyGrade.getGradeIdx()); //신청자 아이디의 등급명 가져오기
				logger.info("memberGrade:"+memGrade);
				gradeList.add(memGrade);

		}
		logger.info("size:"+gradeList.size());

		map.put("gradeList",gradeList);
		map.put("list", list);
		return map;
	}


	public HashMap<String, Object> groupCommentWrite(HashMap<String, String> params) {
		logger.info("공동구매 댓글쓰기 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = groupdao.groupCommentWrite(params);
		logger.info("댓글쓰기 result: " + result);
		msg = "댓글 등록에 실패했습니다";
		if (result > 0) {
			msg = "댓글이 등록되었습니다";
		}

		map.put("msg", msg);
		return map;
	}

	public HashMap<String, Object> groupCommentList(int gpIdx, RedirectAttributes rAttr) {
		logger.info("공동구매 댓글 리스트 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<CommentsDTO> list = groupdao.groupCommentList(gpIdx);
		int listSize = list.size();
		logger.info("listSize:" + listSize);

		map.put("listSize", listSize);
		map.put("list", list);
		return map;
	}

	public HashMap<String, Object> groupCommDel(int commIdx) {
		logger.info("공동구매 댓글 삭제 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = groupdao.groupCommDel(commIdx);
		msg = "댓글 삭제에 실패했습니다";
		if (result > 0) {
			msg = "댓글이 삭제 되었습니다";
		}
		map.put("msg", msg);
		return map;
	}

	public HashMap<String, Object> currUserChk(int gpIdx, int maxUser, RedirectAttributes rAttr) {
		logger.info("현재 신청인원 확인 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int currUser = groupdao.groupcurrUser(gpIdx);
		logger.info("currUser: " + currUser);

		map.put("currUser", currUser);
		return map;
	}

	public HashMap<String, Object> groupCommRec(int commIdx, RedirectAttributes rAttr, HttpSession session) {
		logger.info("댓글추천 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");

		String commRecChk = groupdao.groupCommRecChk(commIdx, loginId);
		logger.info("공동구매 댓글 추천 여부:" + commRecChk);

		String recResult = "";
		if (commRecChk != null) {
			logger.info("추천취소하기");
			int result = groupdao.groupCommDec(commIdx, loginId);
			logger.info("result:" + result);
			recResult = "false";
			msg = "추천취소되었습니다";
		} else {
			logger.info("추천하기");
			int result = groupdao.groupCommRec(commIdx, loginId);
			logger.info("result:" + result);
			recResult = "true";
			msg = "추천되었습니다";
		}

		map.put("recResult", recResult);
		map.put("msg", msg);
		return map;
	}

	/* 내가 추천한 댓글 가져오기 */
	public HashMap<String, Object> recCommList(RedirectAttributes rAttr, HttpSession session) {
		logger.info("내가 추천한 댓글리스트 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		ArrayList<GroupDTO> recCommList = groupdao.myRecList(loginId);
		logger.info("recCommListSize:" + recCommList.size());
		
		map.put("recCommList", recCommList);
		return map;
	}

	public HashMap<String, Object> groupRecommWrite(HashMap<String, String> params) {
		logger.info("공동구매 대댓글쓰기 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = groupdao.groupRecommWrite(params);
		logger.info("대댓글쓰기 result: " + result);
		msg = "답글 등록에 실패했습니다";
		if (result > 0) {
			msg = "답글이 등록되었습니다";
		}

		map.put("msg", msg);
		return map;
	}

	public HashMap<String, Object> groupRecommList(int commIdx) {
		logger.info("공동구매 대댓글 리스트 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Comments2ndDTO> list = groupdao.groupRecommList(commIdx);
		int listSize = list.size();
		logger.info("listSize:" + listSize);
		map.put("list", list);
		return map;
	}

	public HashMap<String, Object> groupRecommDel(int com2ndIdx) {
		logger.info("공동구매 대댓글 삭제 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = groupdao.groupRecommDel(com2ndIdx);
		msg = "답글 삭제에 실패했습니다";
		if (result > 0) {
			msg = "답글이 삭제 되었습니다";
		}
		map.put("msg", msg);
		return map;
	}

	public ModelAndView groupRepBoardForm(int gpIdx, HttpSession session) {
		logger.info("공동구매 게시글 신고 form 서비스");
		String loginId = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		GroupDTO dto = groupdao.groupDetail(gpIdx);
		if(dto!=null) {
			mav.addObject("dto",dto);
			mav.addObject("loginId",loginId);
		}
		mav.setViewName("groupReportBoard");
		return mav;
	}

	public HashMap<String, Object> groupRepBoard(HashMap<String, String> params) {
		logger.info("공동구매 게시글 신고 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = groupdao.groupRepBoard(params); 
		logger.info("result:"+result);
		String success="fail";
		if(result>0) {
			success="success";
		}
		map.put("success", success);
		return map;
		
	}

	public ModelAndView groupRepCommForm(int branch, int commIdx, HttpSession session) {
		logger.info("공동구매 댓글/답글신고 form 서비스");
		String loginId = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		if(branch==1) { //댓글신고 form요청
			logger.info("댓글신고 form 요청");
			CommentsDTO dto = groupdao.groupCommForm(commIdx);
			if(dto!=null) {
				mav.addObject("dto",dto);
				mav.addObject("loginId",loginId);
				mav.addObject("branch", 1);
			}
		}else if(branch==2) { //대댓글 신고 form 요청
			logger.info("대댓글신고 form 요청");
			Comments2ndDTO dto = groupdao.groupRecommForm(commIdx);
			if(dto!=null) {
				mav.addObject("dto",dto);
				mav.addObject("loginId",loginId);
				mav.addObject("branch", 2);
			}
		}
		mav.setViewName("groupReportComm");
		return mav;
	}


	public HashMap<String, Object> groupRepComm(HashMap<String, String> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = 0;
		String success= "fail";
		if(params.get("branch").equals("1")) { //댓글신고
			logger.info("공동구매 댓글 신고 서비스");
			result = groupdao.groupRepComm(params);
		}else { //대댓글 신고
			logger.info("공동구매 답글 신고 서비스");
			result = groupdao.groupRepRecomm(params);
		}
		logger.info("result:"+result);

		if(result>0) {
			success ="success";
		}
		map.put("success", success);
		return map;
	}

	
	

}
