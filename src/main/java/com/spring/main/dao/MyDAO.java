package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.MyDTO;

public interface MyDAO {



	MyDTO detail(String id);

	int update(HashMap<String, String> params);

	int delete(String id);

	int join(HashMap<String, String> params);

	ArrayList<MyDTO> list();


	String login(String id);

	MyDTO myprofile(String loginId);

	int profileupdate(MyDTO dto);

	int receiveAllCount();

}
