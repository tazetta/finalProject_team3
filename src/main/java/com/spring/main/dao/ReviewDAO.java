package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.ReviewDTO;

public interface ReviewDAO {

	int allCount();

	ArrayList<ReviewDTO> reviewList(int start, int end);

}
