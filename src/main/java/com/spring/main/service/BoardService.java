package com.spring.main.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dao.BoardDAO;
import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.GroupDTO;

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
		 
		 String category = null; 
		 String formcategory=null;
		 //추천수 불러오기
			int  recIdx = boarddao.recFind(dto);
			logger.info("게시글 추천수 수: {} ", recIdx);
			
		 if (dto != null) {
				category = boarddao.boardCtg(dto.getBrdctgidx()); // 카테고리 가져오기
				dto.setCategory(category); // 게시판카테고리idx 담기
				
				mav.addObject("dto", dto);
				
				if(category.equals("우리집자랑")) {
					formcategory = boarddao.formCtg(dto.getFormidx()); //  form 카테고리가져오기
					dto.setFormcategory(formcategory); //   폼카테고리idx 담기
				}
				logger.info("{}카테고리입니다./{}게시판글번호입니다.",category,boardIdx);
				boarddao.boardUpHit(boardIdx); //조회수 증가
	}
		 if(category.equals("자유게시판")){//페이지 보내기
			page="FreeDetail";
			 logger.info("1탐");
		 } else if(category.equals("우리집자랑")) {
			page="homedetail";
			 logger.info("2탐");
		 } else if(category.equals("팁게시판")) {
			page="tipdetail";
			 logger.info("3탐");
		 }else if(category.equals("질문과답변")) {
			page="qnadetail";
			 logger.info("4탐");
		 }else if(category.equals("고객의소리")) {
			page="sgtdetail";
			 logger.info("5탐");
		 }
		
		 mav.setViewName(page);
		 return mav;
	}

	@Transactional // 글등록에 실패하면 저장한 파일내용 등록도 실행되지 않도록
	public ModelAndView boardWrite(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav =new ModelAndView();
		BoardDTO boarddto=new BoardDTO();
		int boardctgidx = Integer.parseInt(params.get("boardCtgIdx"));//카테고리구별용
		
		boarddto.setBrdctgidx(boardctgidx);
		boarddto.setSubject(params.get("subject"));
		boarddto.setContent(params.get("content"));
		boarddto.setId(params.get("id"));
		if(boardctgidx==2) {//카테고리가 2 (우리집자랑)일경우
			boarddto.setKeyitems(params.get("keyitems"));//키아이템
			boarddto.setRoomsize(Integer.parseInt(params.get("roomsize")));//평수
			boarddto.setBudget(Integer.parseInt(params.get("budget")));//예산
			boarddto.setFormidx(Integer.parseInt(params.get("formidx")));//주거형태
		}
		if(boardctgidx==6) {
			boarddto.setEmail(params.get("email"));
		}
		int result = boarddao.boardWrite(boarddto);
		//실패시 다시 카테고리에 맞는 수정폼으로 보내기
		if(boardctgidx==1) {
			page = "redirect:/freeWriteForm";
		}else if(boardctgidx==2) {
			page = "redirect:/homeWriteForm";
		}else if(boardctgidx==3) {
			page = "redirect:/tipWriteForm";
		}else if(boardctgidx==4) {
			page = "redirect:/qnaWriteForm";
		}else if(boardctgidx==5) {
			page = "redirect:/sgtWriteForm";
		}
		// 1. session에서 fileList를 가져온다
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		logger.info("fileList:" + fileList.size());
		if (result > 0) {//글쓰기 성공시
			logger.info("카테고리번호{}글번호:{} ",boardctgidx,boarddto.getBoardIdx());
			
			// 2. fileList에 저장된 파일이 있는지 확인한다.
		if (fileList.size() > 0) {
			// 3. 업로드한 파일이 있을 경우 저장한 파일내용을 DB에 기록
			// newFileName, originFileName, idx
			// 맵에 있는 모든 값을 빼서 DB에 넣는다
			for (String key : fileList.keySet()) { // 여러개의 파일이 있을 수 있으므로 for문 사용
				boarddao.boardWriteFile(key, fileList.get(key), boarddto.getBoardIdx());
			}
		}
		
			/* page="redirect:/boardDetail?boardIdx="+boarddto.getBoardIdx(); */
		if(boardctgidx==1) {
		page="redirect:/Freelist";
		msg="글쓰기 성공했습니다.";
		}else if(boardctgidx==2) {
			page = "redirect:/homelist";
		}else if(boardctgidx==3) {
			page = "redirect:/tiplist";
		}else if(boardctgidx==4) {
			page = "redirect:/qnalist";
		}else if(boardctgidx==5) {
			page = "redirect:/sgtlist";
		}
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

	public ModelAndView updateForm(String boardIdx) {
		ModelAndView mav = new ModelAndView();
		logger.info("수정할 글 form 서비스");
		BoardDTO dto = boarddao.Boarddetail(boardIdx);
		logger.info("BoardDTO: " + dto);
		page = "redirect:/boarddetail?boardIdx=" +boardIdx;
		if (dto != null) {
			String category = boarddao.boardCtg(dto.getBrdctgidx()); // 카테고리 가져오기
			dto.setCategory(category); // 카테고리명 담기
			if(category.equals("우리집자랑")) {
				String formcategory = boarddao.formCtg(dto.getFormidx()); //  form 카테고리가져오기
				dto.setFormcategory(formcategory); //   폼카테고리idx 담기
			}
			mav.addObject("dto", dto);
			 if(category.equals("자유게시판")){//페이지 보내기
				 page="FreeUpdateForm";
			 } else if(category.equals("우리집자랑")) {
				 page="homedUpdateForm";
			 } else if(category.equals("팁게시판")) {
				 page="tipdUpdateForm";
			 }else if(category.equals("질문과답변")) {
				 page="qnaUpdateForm";
			 }else if(category.equals("고객의소리")) {
				 page="sgtUpdateForm";
			 }
		}
		mav.setViewName(page);
		return mav;
	
	}
	@Transactional
	public ModelAndView boardUpdate(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = new BoardDTO();
		logger.info("hello");
		logger.info("params : {}", params);
		int boardIdx =Integer.parseInt(params.get("boardIdx"));
		logger.info("hello : {}",boardIdx);
		int brdCtgIdx=Integer.parseInt(params.get("brdctgidx"));
		
		logger.info("게시글 번호 : {}, 게시판 카테고리 : {}",boardIdx,brdCtgIdx);
		
		dto.setBrdctgidx(brdCtgIdx);
		dto.setBoardIdx(boardIdx);
		dto.setSubject(params.get("subject"));
		dto.setContent(params.get("content"));
		dto.setId(params.get("id"));
		if(brdCtgIdx==2) {//카테고리가 2 (우리집자랑)일경우
			dto.setKeyitems(params.get("keyitems"));//키아이템
			dto.setRoomsize(Integer.parseInt(params.get("roomsize")));//평수
			dto.setBudget(Integer.parseInt(params.get("budget")));//예산
			dto.setFormidx(Integer.parseInt(params.get("formidx")));//주거형태
		}
		if(brdCtgIdx==5) {
			dto.setEmail(params.get("email"));
		}
		int result = boarddao.boardUpdate(dto);//성공시 dao실행
		logger.info("결과 : {}", result);
		//실패시 다시 카테고리에 맞는 수정으로 보내기
			page = "redirect:/boarddetail?boardIdx=" +boardIdx;
			msg="글 수정 실패했습니다.";			
		@SuppressWarnings("unchecked")//unchecked-미확인 오퍼레이션과 관련된 경고를 억제합니다.
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		logger.info("fileList:" + fileList.size());
		if (result > 0) {
			if (fileList.size() > 0) {
				for (String key : fileList.keySet()) { // 여러개의 파일이 있을 수 있으므로 for문 사용
					boarddao.boardUpdateFile(key, fileList.get(key), dto.getBoardIdx());
				}
			}
			msg="글 수정 성공하였습니다.";
		}else {
			for (String newFileName : fileList.keySet()) {
				File file = new File(root + "upload/" + newFileName);
				file.delete();
				}
		}
		mav.setViewName(page);
		return mav;
	}
	/* 게시글 삭제 */
	@Transactional
	public ModelAndView boardDel(String boardIdx ,String brdCtgIdx, HttpSession session,RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		String newFileName = boarddao.boardGetFileName(boardIdx);//보드파일찾기
		if (newFileName != null) { // 파일이 있으면
			int success = boarddao.boardPhotoDel(boardIdx); // DB에서 삭제
			logger.info("photos 삭제 결과:" + success);
		}
		int success = boarddao.boardDel(boardIdx);
		logger.info("글 삭제결과: " + success);
		
		if (success > 0 && newFileName != null) {
			HashMap<String, Object> map = fileDelete(newFileName, session);
			int result = (int) map.get("success");
			logger.info("result:" + result);
		}
		msg = "삭제되었습니다.";
		rAttr.addFlashAttribute("msg", msg);

		mav.setViewName("redirect:/groupListPage");
		return mav;
	}
	
	/*파일 삭제*/
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

	public ModelAndView boardUpload(MultipartFile file, HttpSession session) {
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
		mav.setViewName("boardUploadForm");

		return mav;
	}

	public ModelAndView getBoardList(int pageNum, int brdCtgIdx) {
		  ModelAndView mav = new ModelAndView();
		  logger.info("게시판 글 조회 요청");
		  
		  // startNum, endNum 생성
		  int limit = 10;
		  int startNum = (pageNum - 1) * limit + 1;
		  int endNum = pageNum * limit;
		  
		  // 데이터 조회 (board_mapper.xml에 <select id="getBoardList" ... > ... </select>가 있다고 가정.)
		  // ModelAndView에 반환할 데이터(최근 10개 목록) 추가
		  
		  System.out.println("startNum : " + startNum + ", endNum : " + endNum + ", boardCategoryIndex : " + brdCtgIdx);
		  
		  Object object = boarddao.getBoardList(startNum, endNum, brdCtgIdx);
		  mav.addObject("boardList", object);

		  // ModelAndView 데이터 반환
		  return mav;
		}
}


