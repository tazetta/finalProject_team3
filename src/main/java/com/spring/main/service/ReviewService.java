package com.spring.main.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.main.dao.ReviewDAO;

@Service
public class ReviewService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReviewDAO dao;
	
	public HashMap<String, Object> list(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int allCnt = dao.allCount();//전체 게시글 수
		//게시글수 :21개 ,페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		//예 : 21/5 =4.1이면 소수점을 버리고 1을 더해 5가 된다. 딱 떨어지면 그대로.
		int range = allCnt%10 > 0 ? Math.round(allCnt/10)+1 : Math.round(allCnt/10);
		
		//생성 가능한 페이지 보다 현재 페이지가 클 경우..현재페이지를 생성 가능한 페이지로 맞춰준다.
		page = page>range ? range : page;
		
		//시작,끝
		int end = page * 10;
		int start = end-10+1;
		
		map.put("reviewList", dao.reviewList(start,end));
		//pagePerCnt의 기준으로 몇페이지나 만들수 있는가? 
		map.put("range",range);
		map.put("currPage", page);
		return map;
	}

}
