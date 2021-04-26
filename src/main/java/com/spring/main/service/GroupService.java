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
		page = "groupList";

		logger.info("groupWrite result:" + result);
		if (result > 0) {
			logger.info("idx: " + groupDTO.getGpIdx());
			page="redirect:/groupDetail?gpIdx="+groupDTO.getGpIdx();
			msg = "글쓰기에 성공하였습니다";
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

}
