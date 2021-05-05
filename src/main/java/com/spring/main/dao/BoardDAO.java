package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.CommentsDTO;
import com.spring.main.dto.MyDTO;
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

	ArrayList<PhotoDTO> getMyPhotos(String id);

	// 게시판 목록 전체 개수 조회
	int getBoardListCount(int brdCtgIdx, String opt, String keyword);
	// 게시판 목록 조회
	ArrayList<BoardDTO> getBoardList(int startNum, int endNum, int brdCtgIdx, String opt, String keyword);
	//게시글 추천수 불러오기
	int recFind(BoardDTO dto);
	//댓글 가져오기
	ArrayList<CommentsDTO> boardCommentList(int boardIdx);
	//댓글 작성
	int boardCommentWrite(String comment, String boardIdx, String id );
	//댓글삭제(상태값변경)
	int boardCommDel(int commIdx);
	//세부검색기능
	ArrayList<BoardDTO> BoardSearchList(String startStr, String endStr, String opt, String keyword);
	//세부검색기능
	int BoardSearchList(String opt, String keyword);

	MyDTO pwconfirm(String loginId);
	
	int memberMaxCnt();
	//집자랑 세부검색
	Object homeMain(int start, int end, String order, String formcategory, int budget, int roomsize);
	//추천수
	Object CNTRECO(int start, int end, int CNTRECO);
	//게시판 cnt 업
	int boardCntUp(String boardIdx);
	//추천/취소 시 조회수도 올라가는거방지용
	int boardbhitDown(String boardIdx);
	//게시판 cnt 다운
	int boardCntDown(String boardIdx);
	//스크랩하기
	int boardScrap(int boardIdx, String id);
	//스크랩 삭제하기
	int boardScrapDel(int boardIdx, String id);

	// 우리집 자랑 게시판 목록 조회
	ArrayList<BoardDTO> getHomemain(int startNum, int endNum, String orderBy);
	
}
