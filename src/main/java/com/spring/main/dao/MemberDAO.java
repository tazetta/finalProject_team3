package com.spring.main.dao;

import java.util.HashMap;

import com.spring.main.dto.CompanyMemberDTO;
import com.spring.main.dto.MemberDTO;

public interface MemberDAO {

	String login(String id);

	int overlay(HashMap<String, String> params);

	int join(HashMap<String, String> params);

	String idFind(HashMap<String, String> params);

	String comIdFind(HashMap<String, String> params);

	MemberDTO pwFind(HashMap<String, String> params);

	CompanyMemberDTO comPwFind(HashMap<String, String> params);

	int gradeCntBoard(String id);

	int gradeCntComm(String id);





}
