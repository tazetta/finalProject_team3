package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BoardDTO;
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


}
