package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.ExamDTO;

public interface ExamDAO {

	ArrayList<BoardDTO> interiorexamList(int start, int end);

	int allCount();

	int examWrite(ExamDTO examDTO);

	void examWriteFile(String key, String string, int combrdIdx);

	void examUpHit(int combrdIdx);

	ExamDTO examDetail(int combrdIdx);

	void groupUpdateFile(String key, String string, int combrdIdx);

	int examUpdate(ExamDTO examDTO);

	String examGetFileName(int combrdIdx);

	int examPhotoDel(int combrdIdx);

	int examDel(int combrdIdx);

}
