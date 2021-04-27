package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.GroupDTO;
import com.spring.main.dto.MemberDTO;

public interface GroupDAO {

	int groupWrite(GroupDTO groupDTO);

	GroupDTO groupDetail(String gpIdx);

	void groupWriteFile(String key, String string, int gpIdx);

	String groupCtg(int gpCtgIdx);
	
	String gpProgress(int progIdx);

	int groupAllCount(int opt);

	ArrayList<GroupDTO> groupList(int start, int end, int opt);

	String groupGetFileName(int gpIdx);

	int groupPhotoDel(int gpIdx);

	int groupDel(int gpIdx);

	void groupUpHit(String gpIdx);

	
	int groupSearchCount(String opt, String keyword);

	ArrayList<GroupDTO> groupSearch(HashMap<String, String> params);


	

}
