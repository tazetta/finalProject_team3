package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.main.dao.BoardDAO;
import com.spring.main.dto.PhotoDTO;

@Service
public class MyService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardDAO dao;
	
	public HashMap<String, Object> myPhotos(int num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = "mingmang17";
		ArrayList<PhotoDTO> list = dao.getMyPhotos(id); 
		map.put("images", list);
		return map;
	}

}
