<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
	<style>
	 #monitor{
	  margin: 5px;
	  width: 50%;
	  height: 300px;
	  overFlow: auto;
	  border: 1px solid black;

	 }
	 input[type="button"]:hover {
	background-color: #acd3fb;
	cursor: pointer;
	box-shadow: 0 2px 4px rgba(0, 79, 255, 0.6);
	border: 2px solid white;
	color: white;
}
input[type="button"]{
	margin: 20px;
	overFlow: auto;

}
	</style>
</head>
<body>
   <h4>쪽지 보내기</h4>
	<hr/>
	<form>
	<div id="loginArea">
	 받는사람:<input id="nick" type="text" placeholder="받을 아이디 입력해 주세요."/>
	 <input type="button" onclick="sendMsg()" value="보내기"/>
	 </div>
	 <div id="monitor" contenteditable="true"></div>
	</form>

</body>
<script>
 var webSocket = null;


 //메시지를 서버에 전송
 	function sendMsg(){
	 webSocket.send($("#nick").val()+">"+$("#msg").val());
	 $("#msg").val("");

 }

 
</script>
</html>

