package com.spring.main.dao;

import java.util.HashMap;

import com.spring.main.dto.CompanyMemberDTO;

public interface CompanyDAO {

	CompanyMemberDTO companydetail(String comId);

	int comMemUpdate(HashMap<String, String> params);

	String pwchk(String comId);

	int companyReport(HashMap<String, String> params);

}
