package com.spring.main.dao;

import com.spring.main.dto.EstimateDTO;

public interface EstimateDAO {

	int estimateWrite(EstimateDTO dto);

	EstimateDTO estimateDetail(String estIdx);

}
