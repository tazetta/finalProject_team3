package com.spring.main.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.main.service.MyService;

@RestController
public class MyRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MyService service;
	
	@RequestMapping(value = "/myPhotos/{num}", method = RequestMethod.GET)
	public HashMap<String, Object> list(@PathVariable int num) {
		HashMap<String , Object> map = new HashMap<String, Object>();	
		logger.info("pagePerCnt :{}, page :{}",num);
		logger.info("리스트 요청");
		return service.myPhotos(num);
	}
}
