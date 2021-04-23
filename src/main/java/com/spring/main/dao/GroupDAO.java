package com.spring.main.dao;

import com.spring.main.dto.GroupDTO;

public interface GroupDAO {

	int groupWrite(GroupDTO groupDTO);

	GroupDTO groupDetail(String gpIdx);

}
