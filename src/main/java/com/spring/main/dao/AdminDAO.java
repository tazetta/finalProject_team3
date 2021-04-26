package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.MemberDTO;

public interface AdminDAO {

	ArrayList<MemberDTO> listNewMember(String sqlDate);

	int cntNewMember(String sqlDate);

}
