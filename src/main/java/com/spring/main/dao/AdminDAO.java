package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.CompanyMemberDTO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.ReportDTO;

public interface AdminDAO {

	ArrayList<MemberDTO> listNewMember(String sqlDate);

	int cntNewMember(String sqlDate);

	int cntNewAdmin();

	ArrayList<MemberDTO> listAdmin();

	int reportedBrdCnt(String sqlDate);

	HashMap<String, Object> reportedBrdList(String sqlDate);

	int reportedCommCnt(String string);

	HashMap<String, Object> reportedCommList(String string);
	
	ArrayList<MemberDTO> adminMemberList(int start, int end, String gradeIdx, String stateIdx, String searchId);

	MemberDTO memberDetail(String id);

	ArrayList<CompanyMemberDTO> adminCompanyList(int start, int end, String searchId);

	int memberMaxCnt(String string, String stateIdx, String searchId);

	int companyMaxCnt(HashMap<String, Object> mapId);

	CompanyMemberDTO companyDetail(String comId);

	int penaltyCfm(String id, String stateIdx);

	int soundMaxCnt(int boardCtg);

	ArrayList<BoardDTO> adminSoundList(int start, int end, String stgctg);

	int soundMaxCnt(int boardCtg, String stgctg);

	BoardDTO adminSoundDetail(int boardIdx);

	MemberDTO checkPenalty(String loginId);

	int reportedBrdMaxCnt(int repCtgIdx);

	ArrayList<ReportDTO> adminReportedBrdList(int start, int end, int repCtgIdx);

	int reportedCommMaxCnt(int repCtgIdx);

	ArrayList<ReportDTO> adminReportedCommList(int start, int end, int repCtgIdx);

	ArrayList<ReportDTO> adminReportedGroupList(int start, int end, int repCtgIdx);

	int reportedGroupMaxCnt(int repCtgIdx);

	int adminGroupBlind(int gpIdx);

	int adminCommBlind(int commIdx);

	int adminBrdBlind(int boardIdx);

	int penaltyEndDay(String id, String stateIdx, String sqlDate, String adminId);

	int delEndDay(String id);	

}
