<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>채팅창</title>
<style>
#monitor {
	margin: 5px;
	width: 600px;
	height: 500px;
	overflow: auto;
	border: 1px solid;
	resize: none; 
}
</style>

</head>
<body>
	<form>
		<div id="loginArea">
			닉네임 <input id="nick" type="text" />
		<input id="login" type="button" value="로그인" />

			<!-- 로그인 클릭시 웹소켓에 접속 -->
		</div>
		<textarea readonly id="monitor"></textarea>
		<!-- <div id="monitor" contenteditable="true" </div> -->
		<div>
			<input id="msg" type="text" /> <input type="button"
				onclick="sendMsg()" value="전송" /> <input type="button"
				onclick="disConn()" value="나가기" />
			<!-- 나가기 클릭시 웹소켓 연결 종료 -->
		</div>
	</form>

</body>
<script>
var webSocket = null;

	$("#login").click(function(){
		if($("#nick").val()==''){
			alert("닉네임을 입력해주세요");
		}else{
			var url ="ws://localhost:8080/main/chat/"+$("#nick").val(); //누구로 접속했는지
			 console.log(url);
			 webSocket = new WebSocket(url); //웹소켓 객체 생성
			 
			 //웹소켓이 연결되었을 경우(서버에서 연결수락시)
			 webSocket.onopen =function(ws){
				 console.log("ONOPEN: ",ws);
			 }
			 
			 //웹소켓이 끊겼을 경우
			 webSocket.onclose =function(ws){
				 console.log("ONCLOSE: ",ws);
			 }
			 
			 //서버로부터 메시지를 받았을 경우
			 webSocket.onmessage =function(ws){
				 console.log("ONMESSAGE: ",ws);
				 var content = $("#monitor").html();
				 content += ws.data+"\n";
				 $("#monitor").html(content);
			 }
		}
			
		 
	 });

	 //웹소켓 종료
	 function disConn(){
		 webSocket.close();
		 window.open('','_self').close();
	 }
	 
	 //메시지를 서버에 전송
	 function sendMsg(){
		 if($("#nick").val()==''){
			 alert("로그인이 필요합니다");
		 }else{
			 
		 webSocket.send($("#nick").val()+"> "+$("#msg").val());
		 $("#msg").val(""); //전송하고나서 value 초기화
		 }
	 }




</script>
</html>