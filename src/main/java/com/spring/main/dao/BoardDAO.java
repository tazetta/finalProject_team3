package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.Comments2ndDTO;
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

	ArrayList<PhotoDTO> getMyPhotos(int pagePerCnt, int page, String id);

	// 게시판 목록 전체 개수 조회
	int getBoardListCount(int brdCtgIdx, String opt, String keyword);
	// 게시판 목록 조회
	ArrayList<BoardDTO> getBoardList(int startNum, int endNum, int brdCtgIdx, String opt, String keyword);
	//게시글 추천수 불러오기
	int recFind(BoardDTO dto);
	//댓글 가져오기
	ArrayList<CommentsDTO> boardCommentList(int boardIdx);
	//댓글 작성
	int boardCommentWrite(HashMap<String, String> params);
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

	//추천/취소 시 조회수도 올라가는거방지용
	int boardbhitDown(String boardIdx);

	//스크랩하기
	int boardScrap(int boardIdx, String id);
	//스크랩 삭제하기
	int boardScrapDel(int boardIdx, String id);
	//파일리스트
	ArrayList<PhotoDTO> fileList(int boardIdx);

	// 꿀팁 게시판 목록 조회
	ArrayList<BoardDTO> getTipmain(int startNum, int endNum, String orderBy, String opt, String keyword);
	// 꿀팁 3개
	ArrayList <BoardDTO> gettipMainLimit3();
	
	// 도와줘요 게시판 목록 전체 개수 조회
	int getHelpmainCount(int brdCtgIdx, String opt, String keyword, char isWaitForAnswer);
	
	// 도와줘요 게시판 목록 조회
	ArrayList<BoardDTO> getHelpmainList(int startNum, int endNum, int brdCtgIdx, String opt, String keyword, String orderBy, char isWaitForAnswer);
	//댓글 추천 체크
	String boardCommRecChk(int commIdx, String loginId);
	//댓글 추천 취소
	int boardCommDec(int commIdx, String loginId);
	//댓글 추천
	int boardCommRec(int commIdx, String loginId);
	
	ArrayList<BoardDTO> myRecList(String loginId);
	
	int boardRecommWrite(HashMap<String, String> params);
	int getPhotoMax(String id);
	ArrayList<PhotoDTO> myInteriorSlider(String id);
	
	//우리집 자랑 목록 전체 개수 조회
	int gethomeMainCount(int formcategory,int budget, int roomsize);
	

	
	//우리집 자랑 목록 조회
	//ArrayList<BoardDTO> homeMainList(int startNum, int endNum, String keyword,String orderBy, String formcategory,int budget, int roomsize);
	ArrayList<BoardDTO> gethomeMainList(int startNum, int endNum, String orderBy, int formcategory, int budget, int roomsize);
	
	ArrayList<BoardDTO> getMainhomeLimit3();
	//대댓글리스트
	ArrayList<Comments2ndDTO> boardRecommList(int commIdx);
	//대댓글삭제
	int boardRecommDel(int com2ndIdx);

	//댓글신고
	int boardRepComm(HashMap<String, String> params);
	//대댓글신고
	int boardRepRecomm(HashMap<String, String> params);
	//댓글폼요청
	CommentsDTO boardCommForm(int commIdx);
	//대댓글폼요청
	Comments2ndDTO boardRecommForm(int commIdx);
	//게시글 신고하기
	int boardRepBoard(HashMap<String, String> params);
	//대댓글 추천체크
	String boardReCommRecChk(int com2ndIdx, String loginId);
	//대댓글 추천 취소
	int boardReCommDec(int com2ndIdx, String loginId);
	//대댓글 추천
	int boardReCommRec(int com2ndIdx, String loginId);
	//대댓글 cnt 감소
	int boardReCommcntDown(int com2ndIdx);
	//대댓글 cnt 증가
	int boardReCommcntUp(int com2ndIdx);
	//댓글 cnt 감소
	int boardCommcntDown(int commIdx);
	//댓글 cnt 증가
	int boardCommRecUp(int commIdx);
	//게시판 추천 아이디 중복체크
	String boardRecChk(int boardIdx, String loginId);
	//게시판 추천취소하기
	int boardDec(int boardIdx, String loginId);
	//게시판 추천하기
	int boardRec(int boardIdx, String loginId);
	//게시글 cnt 감소
	int boardCntDown(int boardIdx);
	//게시글 cnt 증가
	int boardCntUp(int boardIdx);
	ArrayList<BoardDTO> list();
	
	
	


		
	

	
}
