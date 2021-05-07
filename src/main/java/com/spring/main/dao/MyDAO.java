package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.EstimateDTO;
import com.spring.main.dto.MsgDTO;
import com.spring.main.dto.MyDTO;

public interface MyDAO {



	MyDTO detail(String id);

	int update(HashMap<String, String> params);

	int delete(String id);

	int join(HashMap<String, String> params);

	ArrayList<MyDTO> list();


	String login(String id);

	MyDTO myprofile(String loginId);

	int profileupdate(MyDTO dto);


	int receiverAllCount(String sessionId);
	
	ArrayList<MsgDTO>  receiveList(int start, int end, String sessionId);
	
	int senderAllCount(String sessionId);
	
	ArrayList<MsgDTO>  senderList(int start, int end, String sessionId);
	
	MsgDTO msgDetail(int msgIdx);

	MsgDTO whoSR(int msgIdx);
	
	int deleteSender(int msgIdx);
	
	int deleteReceiver(int msgIdx);
	
	int myupdate(MyDTO dto);

	int mypwreset(String id, String encrypt);

	void newPw(MyDTO dto);

	int mywriteboardAllCount(String sessionId);

	ArrayList<MyDTO> mywriteboardList(int start, int end, String sessionId);

	int mywritetipAllCount(String sessionId);

	ArrayList<MyDTO> mywritetipList(int start, int end, String sessionId);

	int mywriteqnaAllCount(String sessionId);

	ArrayList<MyDTO> mywriteqnaList(int start, int end, String sessionId);

	int myestimateAllCount(String sessionId);

	ArrayList<MyDTO> myestimateList(int start, int end, String sessionId);

	EstimateDTO estDetail(int estIdx);

	int mygroupwriteAllCount(String sessionId);

	ArrayList<MyDTO> mygroupwriteList(int start, int end, String sessionId);

	int receiverChk(String receiver);

	int sendMsg(HashMap<String, String> params);
	
	int mygroupbuyAllCount(String sessionId);

	ArrayList<MyDTO> mygroupbuyList(int start, int end, String sessionId);


}
