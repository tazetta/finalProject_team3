package com.spring.main.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.EstimateDAO;
import com.spring.main.dto.EstimateDTO;

@Service
public class EstimateService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired EstimateDAO estimateDAO;
	String page="";
	String msg="";
	
	
	
	public ModelAndView estimateWrite(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		EstimateDTO dto = new EstimateDTO();
		dto.setAddress(params.get("address"));
		dto.setBudget(Integer.parseInt(params.get("budget")));
		dto.setComId(params.get("comId"));
		dto.setId(params.get("id"));
		dto.setPhone(params.get("phone"));
		dto.setRoomsize(params.get("roomsize"));
		dto.setContent(params.get("content"));
		int result = estimateDAO.estimateWrite(dto);
		page = "redirect:/estimateWriteForm";
		msg="견적서보내기를 실패했습니다.";
		logger.info("estimateWrite result:" + result);

		if (result > 0) { // 글쓰기 성공시
			page = "redirect:/interiorCompanyDetail?comId="+dto.getComId();
			msg = "견적서보내기를 성공하였습니다";
		} 
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}



	public ModelAndView estimateDetail(String estIdx) {
		ModelAndView mav = new ModelAndView();
		EstimateDTO dto = estimateDAO.estimateDetail(estIdx);
		mav.addObject("dto", dto);
		mav.setViewName("estimateDetail");
		return mav;
	}

	
	
	

}
