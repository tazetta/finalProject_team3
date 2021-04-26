<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
table, td, th {
	padding: 5px 10px;
	text-align: center;
	border: 1px solid black;
	border-collapse: collapse;
}

#kakaoLink {
	border: 1px solid gray;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th>idx</th>
			<th>카테고리</th>
			<th>진행상황</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>${dto.gpIdx}</td>
			<td><%-- <c:if test="${dto.gpCtgIdx ==1}">공동구매</c:if> <c:if
					test="${dto.gpCtgIdx ==2}">무료나눔</c:if> --%>
					${dto.category }
					</td>
			<td>
			${dto.progress }
			</td>
			<td>${dto.subject}</td>
			<td>${dto.id}</td>
			<td>${dto.reg_date}</td>
		</tr>
		<tr>
			<td colspan="6" >${dto.currUser }/${dto.maxUser} <br />마감날짜:
				${dto.deadline}
			</td>
		</tr>
		<tr>
			<td colspan="6">${dto.content }
				<div id="kakaoLink">오픈카카오톡 링크 : ${dto.chatURL }</div>
			</td>
		</tr>
	</table>
	<button onclick="location.href='groupListPage'">목록</button>

</body>
<script></script>
</html>