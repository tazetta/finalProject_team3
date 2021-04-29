package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.CompanyMemberDTO;
import com.spring.main.dto.GroupDTO;
import com.spring.main.dto.MemberDTO;

public interface MemberDAO {

	String login(String id);

	int overlay(HashMap<String, String> params);

	int join(HashMap<String, String> params);

	MemberDTO idFind(HashMap<String, String> params);

	CompanyMemberDTO comIdFind(HashMap<String, String> params);

	MemberDTO pwFind(HashMap<String, String> params);

	String comPwFind(HashMap<String, String> params);

	int gradeCntBoard(String id);

	int gradeCntComm(String id);

	String adLogin(String id, String pw);

	String cLogin(String id);

	int resetPw(String id, String encrypt);

	int resetCPw(String id, String encrypt);



	





}
