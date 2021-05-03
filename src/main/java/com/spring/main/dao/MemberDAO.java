package com.spring.main.dao;

import java.util.HashMap;

import com.spring.main.dto.CompanyMemberDTO;
import com.spring.main.dto.MemberDTO;

public interface MemberDAO {

	String login(String id);

	int overlay(HashMap<String, String> params);

	int join(HashMap<String, String> params);

	MemberDTO idFind(HashMap<String, String> params);

	CompanyMemberDTO comIdFind(HashMap<String, String> params);

	MemberDTO pwFind(HashMap<String, String> params);

	CompanyMemberDTO comPwFind(HashMap<String, String> params);

	int gradeCntBoard(String id);

	int gradeCntComm(String id);

	String adLogin(String id, String pw);

	String cLogin(String id);

	MemberDTO gradeChk(String loginId);

	int gradeUpdate(int gradeIdx, String loginId);

	String getGrade(int gradeIdx);

	int cOverlay(HashMap<String, String> params);

	int company_nameOverChk(HashMap<String, String> params);

	int licenChk(HashMap<String, String> params);

	int cJoin(HashMap<String, String> params);




}
