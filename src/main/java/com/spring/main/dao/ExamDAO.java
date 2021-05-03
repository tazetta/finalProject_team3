package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.ExamDTO;
import com.spring.main.dto.ReviewDTO;

public interface ExamDAO {

	ArrayList<BoardDTO> interiorexamList(int start, int end);

	int allCount(String comId);

	int examWrite(ExamDTO examDTO);

	void examWriteFile(String key, String string, int combrdIdx);

	void examUpHit(int combrdIdx);

	ExamDTO examDetail(int combrdIdx);

	void groupUpdateFile(String key, String string, int combrdIdx);

	int examUpdate(ExamDTO examDTO);

	String examGetFileName(int combrdIdx);

	int examPhotoDel(int combrdIdx);

	int examDel(int combrdIdx);

	ArrayList<ExamDTO> list();

	ExamDTO interiorCompanyDetail(String comId);

	ArrayList<ReviewDTO> comExamList(int start, int end, String comId);

	ArrayList<ExamDTO> examSemiList(String comId);

	ArrayList<ReviewDTO> reviewSemiList(String comId);

	ArrayList<ExamDTO> examListScroll(int cnt);

}
