package com.spring.main.service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.GroupDAO;
import com.spring.main.dto.GroupDTO;

@Service
public class GroupService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	GroupDAO groupdao;

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
		Date deadline = Date.valueOf(transDate);
		
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

		logger.info("groupWrite result:" + result);
		if (result > 0) {
			logger.info("idx: " + groupDTO.getGpIdx());
			page = "groupList";
			msg = "글쓰기에 성공하였습니다";
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}

}
