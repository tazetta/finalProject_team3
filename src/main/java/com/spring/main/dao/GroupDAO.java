package com.spring.main.dao;

import com.spring.main.dto.GroupDTO;

public interface GroupDAO {

	int groupWrite(GroupDTO groupDTO);

	GroupDTO groupDetail(String gpIdx);

	void groupWriteFile(String key, String string, int gpIdx);

	String groupCtg(int gpCtgIdx);

	String gpProgress(int progIdx);

	

}
