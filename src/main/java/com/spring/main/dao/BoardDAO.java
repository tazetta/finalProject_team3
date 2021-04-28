package com.spring.main.dao;

import com.spring.main.dto.BoardDTO;

public interface BoardDAO {

	

	String boardCtg(int brdctgidx);

	String formCtg(int boardIdx);

	void boardUpHit(String boardIdx);

	BoardDTO Boarddetail(String boardIdx);

	int boardWrite(BoardDTO boarddto);

	void boardWriteFile(String key, String string, int boardIdx);
	



	
}