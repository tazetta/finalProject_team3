package com.spring.main.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat/{userId}")
public class webSocketController {
	static HashMap<String, Session> userList = new HashMap<String, Session>(); // 데이터 공유위해 static

	// 서버 접속 요청시
	@OnOpen
	public void onOpen(Session session, @PathParam("userId") String userId) {
		// session엔 웹소켓에 접속하는 접속자의 정보가 담겨있음
		System.out.println("userId:" + userId);
		// userId를 키로 삼고 있기 때문에 중복되면 안됨
		if (userList.get(userId) != null) { // hashMap안에 userId가 이미 있을 경우
			sendMsg(session, userId + "는 이미 존재하는 아이디 입니다");
		} else {
			userList.put(userId, session); // 참여자 전원에게 알림
			String msg = userId + "님 께서 입장하셨습니다. 현재인원: " + userList.size();
			broadcast(msg);
		}
	}

	// 메시지 전체에게 전송
	private void broadcast(String msg) {
		for (String userId : userList.keySet()) { //
			Session session = userList.get(userId);
			try {
				session.getBasicRemote().sendText(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	// 메시지 수신시
	@OnMessage
	public void onMsg(String msg, Session session) {
		System.out.println("session: " + session);
		System.out.println("msg: " + msg);
		broadcast(msg);
	}

	// 메시지 전송시
	public void sendMsg(Session session, String msg) {
		try {
			session.getBasicRemote().sendText(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 서버 종료시
	@OnClose
	public void onClose(Session session) {
		String closeId = session.getId();
		System.out.println("누가 종료?: " + closeId);
		String msg = "";

		// 해당 세션으로 userId를 찾고, 해당되는 값을 remove (이미 나간 사람에게 메시지 전송X)
		for (String userId : userList.keySet()) { // map에서 값을 하나하나 빼서

			String sessionId = userList.get(userId).getId(); // 세션값을 찾아내고 찾아낸 세션의 Id가져옴

			if (sessionId.equals(closeId)) { // map에 있는 아이디와 종료한 세션Id가 일치하면
				userList.remove(userId); // map에서 나간 userId 삭제
				msg = userId + "님 께서 종료하셨습니다. 남은인원: " + userList.size();
				break; // map에서 삭제했으면 for문 빠져나오기
			}
		}
		broadcast(msg);
	}

	// 에러 발생시
	@OnError
	public void onError(Throwable e, Session session) {
		System.out.println("문제 session: " + session);
		System.out.println(e.toString());
	}

}
