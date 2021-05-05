package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

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


}
