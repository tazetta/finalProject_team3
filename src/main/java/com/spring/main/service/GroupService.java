package com.spring.main.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import com.spring.main.dao.GroupDAO;
import com.spring.main.dto.GroupDTO;

@Service
public class GroupService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	GroupDAO groupdao;
	
	//properties파일 내용 불러오기
	@Value("#{config['Globals.root']}") String root; 
		

	String page = "";
	String msg = "";

	@Transactional //글등록에 실패하면 저장한 파일내용 등록도 실행되지 않도록
	public ModelAndView groupWrite(HashMap<String, String> params, HttpSession session) {
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
		Date deadline = Date.valueOf(transDate); //sql DATE로 변환
		
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
		
		//1. session에서 fileList를 가져온다
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
				
		if (result > 0) { //글쓰기 성공시
			logger.info("idx: " + groupDTO.getGpIdx()); //공동구매 글 idx 뽑아오기
			
			//2. fileList에 저장된 파일이 있는지 확인한다.
			 if(fileList.size()>0) {
				 //3. 업로드한 파일이 있을 경우 저장한 파일내용을 DB에 기록
				 //newFileName, originFileName, idx
				 // 맵에 있는 모든 값을 빼서 DB에 넣는다
				 for (String key : fileList.keySet()) { //여러개의 파일이 있을 수 있으므로 for문 사용
					 groupdao.groupWriteFile(key,fileList.get(key),groupDTO.getGpIdx());
				}
			 }
			
			page="redirect:/groupDetail?gpIdx="+groupDTO.getGpIdx();
			msg = "글쓰기에 성공하였습니다";
		}else { //글쓰기 실패시
			
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	public  ModelAndView detail(String gpIdx) {
		ModelAndView mav = new ModelAndView();
		logger.info("상세보기 서비스");
		GroupDTO dto = groupdao.groupDetail(gpIdx);
		logger.info("groupDTO: "+dto);
		page="groupList";
		if(dto!=null) {
			String category =groupdao.groupCtg(dto.getGpCtgIdx()); //카테고리 가져오기
			dto.setCategory(category); //카테고리명 담기
			
			String progress = groupdao.gpProgress(dto.getProgIdx()); //진행상황 가져오기
			dto.setProgress(progress); //진행상황 담기
			mav.addObject("dto", dto);
			page="groupDetail";
		}
		mav.setViewName(page);
		return mav;
	}
	
	
	public ModelAndView fileUpload(MultipartFile file, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		logger.info("파일업로드 서비스");
		/* file Upload 시작 */
		//1. 경로 설정
		File dir = new File(root+"upload/");
		
		//2. 경로가 없으면 폴더 생성
		if(!dir.exists()) {
			logger.info("폴더없음, 폴더생성");
			dir.mkdir();
		}
		
		//3. 파일명 추출
		String fileName = file.getOriginalFilename();
		
		//4. 새 파일명 생성(현재시간을 m/s단위로 환산한 이름)
		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
		logger.info(fileName+"=> "+newFileName);
		
		//5. 파일 저장(JAVA nio활용 -> java7부터 가능)
		try {
			//MultipartFile에서 바이너리 데이터를 추출
			byte[] bytes =file.getBytes();
			//저장할 경로 지정 
			Path filePath = Paths.get(root+"upload/"+newFileName);
			//파일 저장
			Files.write(filePath, bytes);
			
			//session에 내가 저장한 파일 내역을 저장한다.
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList"); //writeForm에서 세션에 저장했던 hashmap가져오고
			fileList.put(newFileName,fileName); //중복되지 않는 newFileName를 키로 설정해서 새로운 파일명을 session에 저장
			logger.info("현재 저장된 파일 수: "+fileList.size());
			session.setAttribute("fileList", fileList);		//세션에 저장
			mav.addObject("path","/photo/"+newFileName); //server에서 설정했던 path= /photo
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.setViewName("groupUploadForm");
		
		return mav;
	}
	
	public HashMap<String, Object> fileDelete(String fileName, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// File객체를 이용해 fileName으로 실제 파일 삭제
		File delFile = new File(root+"upload/"+fileName);
		int success = 1;
		try {
			logger.info("delete File: "+delFile);
			if(delFile.exists()) { //해당 경로에 실제 파일이 있으면
				delFile.delete(); //삭제
			}else {
				logger.info("이미 삭제된 파일");
			}
			// session에 있는 fileList에서도 파일명 삭제 -> 변경된 내용 session에 저장
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			if(fileList.get(fileName)!=null){ //session의 list안에 삭제한 파일이 있다면
				fileList.remove(fileName); //실제로 지워진 파일이니까 파일명을 지정해서 session에서도 삭제
				logger.info("삭제후 남은 파일 수:"+fileList.size());
			};
			session.setAttribute("fileList", fileList); // 변경된 내용을 다시 session에 저장
			
		} catch (Exception e) {
			e.printStackTrace();
			success = 0 ;
		}finally {
			// 결과를 map에 담아서 반환
			map.put("success", success);
		}
		
		return map;
	}

}
