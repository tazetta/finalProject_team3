package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.PhotoDTO;

public interface BoardDAO {

	
	//게시판 카테고리찾기
	String boardCtg(int brdctgidx);
	//우리집자랑 카테고리(원룸/아파트/단독주택/기타)
	String formCtg(int boardIdx);
	//게시글 조회수 올리기
	void boardUpHit(String boardIdx);
	//게시글 상세보기
	BoardDTO Boarddetail(String boardIdx);
	//게시글 작성
	int boardWrite(BoardDTO boarddto);
	//게시글작성(사진)
	void boardWriteFile(String key, String string, int boardIdx);
	//게시글 수정
	int boardUpdate(BoardDTO dto);
	//게시글 수정(사진)
	void boardUpdateFile(String key, String string, int boardIdx);
	//게시글 파일찾기
	String boardGetFileName(String boardIdx);
	//게시글 삭제(사진)
	int boardPhotoDel(String boardIdx);
	//게시글 삭제
	int boardDel(String boardIdx);
	//게시글 추천수 가져오기
	String boardrecommendFind(int recidx);
	
	
	ArrayList<PhotoDTO> getMyPhotos(String id);
	



	
}
