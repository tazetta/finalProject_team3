<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String comId = (String)request.getSession().getAttribute("comId"); %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<style>
table, th,td {
	padding: 5px 10px;
	text-align: center;
	border: 1px solid black;
	border-collapse: collapse;
}

td{
	width: 500px;
}



input[type='text'] {
	width: 100%;
}
</style>
</head>
<body>
	<h3>시공사례상세보기</h3>
		<table>
			<tr>
				<th>업체명</th>
				<td>${dto.comId}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.subject}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td style="height: 500px; width: 300px;">${dto.content}</td>
			</tr>
		</table>
	<button onclick="location.href='interiorexamList'">목록</button>
	<%-- <c:if test="${dto.comId==comId}"> --%>
		<button onclick="location.href='examUpdateForm/${dto.combrdIdx}'">수정</button>
		<button onclick="location.href='examDel?combrdIdx=${dto.combrdIdx}'">삭제</button>
	<%-- </c:if> --%>
</body>
<script>
</script>
</html>