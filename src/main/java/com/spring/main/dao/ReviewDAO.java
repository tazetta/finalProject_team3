package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.ReviewDTO;

public interface ReviewDAO {

	int allCount();

	ArrayList<ReviewDTO> reviewList(int start, int end,String comId);

	int reviewWrite(ReviewDTO reviewDTO);

	void reviewWriteFile(String key, String string, int revIdx);

	ReviewDTO reviewDetail(String revIdx);

	int reviewUpdate(ReviewDTO reviewDTO);

	int reviewDelete(String revIdx);

}
