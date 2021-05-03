package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.CompanyMemberDTO;
import com.spring.main.dto.MemberDTO;

public interface AdminDAO {

	ArrayList<MemberDTO> listNewMember(String sqlDate);

	int cntNewMember(String sqlDate);

	int cntNewAdmin();

	ArrayList<MemberDTO> listAdmin();

	int reportedBrdCnt(String sqlDate);

	HashMap<String, Object> reportedBrdList(String sqlDate);

	int reportedCommCnt(String string);

	HashMap<String, Object> reportedCommList(String string);
	
	ArrayList<MemberDTO> adminMemberList(int start, int end, String gradeIdx, String stateIdx, String searchId);

	MemberDTO memberDetail(String id);

	ArrayList<CompanyMemberDTO> adminCompanyList(int start, int end, String searchId);

	int memberMaxCnt(String string, String stateIdx, String searchId);

	int companyMaxCnt(HashMap<String, Object> mapId);



}
