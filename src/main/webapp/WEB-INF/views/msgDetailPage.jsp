<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		
		<style></style>
	</head>
	<body>
	<h3>쪽지 상세보기</h3>
	<table>
		<tr>
			<th>보낸사람</th>
			<td><input id="sender" type="text" value="${info.sender}" readonly/></td>
		</tr>
		<tr>
			<th>받는 사람</th>
			<td><input id="receiver"type="text" value="${info.receiver}" readonly/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${info.content}</td>
		</tr>
	</table>
		<button onclick="msgFormPopUp()">답장</button>
	</body>
	<script>
	function msgFormPopUp(){
		var receiver = $("#sender").val();
		var url = "msgFormPopUp/"+receiver;
		console.log(receiver);
		window.open(url,"쪽지보내기폼","width=500, height=450");
		self.close();
	}
	</script>
</html>