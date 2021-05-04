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
			<td>${info.sender}</td>
		</tr>
		<tr>
			<th>보낸사람</th>
			<td>${info.reg_date}</td>
		</tr>
		<tr>
			<th>보낸사람</th>
			<td>${info.content}</td>
		</tr>
	</table>
	</body>
	<script></script>
</html>