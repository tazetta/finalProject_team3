package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.GroupDTO;

public interface GroupDAO {

	int groupWrite(GroupDTO groupDTO);

	GroupDTO groupDetail(String gpIdx);

	void groupWriteFile(String key, String string, int gpIdx);

	String groupCtg(int gpCtgIdx);
	
	String gpProgress(int progIdx);

	int groupAllCount();

	ArrayList<GroupDTO> groupList(int start, int end);

	String groupGetFileName(int gpIdx);

	int groupPhotoDel(int gpIdx);

	int groupDel(int gpIdx);


	

}
