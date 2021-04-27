<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
table, td, th {
width:1100px;
	padding: 5px 10px;
	text-align: center;
	border: 1px solid black;
	border-collapse: collapse;
}

#kakaoLink {
	border: 1px solid gray;
}
#groupCnt{
color:red;
font-size:130%;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th>idx</th>
			<th>카테고리</th>
			
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>진행상황</th>
		</tr>
		<tr>
			<td>${dto.gpIdx}</td>
			<td><%-- <c:if test="${dto.gpCtgIdx ==1}">공동구매</c:if> <c:if
					test="${dto.gpCtgIdx ==2}">무료나눔</c:if> --%>
					${dto.category }
					</td>
			<td>${dto.subject}</td>
			<td>${dto.id}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.progress }</td>
		</tr>
		<tr>
			<td colspan="5"  style = "padding:20px">${dto.content }
			</td>
			<td style = "width:20%">현재인원/모집인원 : <span id="groupCnt">${dto.currUser }/${dto.maxUser}</span> <br />마감날짜 :
				<b>${dto.deadline}</b><br/>
				<button onclick="location.href='#'">신청</button>
				</td>
		</tr>
		<tr>
			<td colspan="6">
				<div id="kakaoLink">오픈카카오톡 링크 : <a href="${dto.chatURL }" target="_blanck">${dto.chatURL }</a></div>
				
			</td>
		</tr>
		<tr>
			<td colspan="6">신청자 
			<div id="applicant"></div>
			</td>
		</tr>
	</table>
	<button onclick="location.href='groupListPage'">목록</button>
	<button onclick="location.href='groupDel/${dto.gpIdx}'">삭제</button>
	<button onclick="location.href='groupUpdateForm/${dto.gpIdx}'">수정</button>
	
	<hr/>
	<b>댓글 <span>0</span></b>
	<div>현재 댓글이 없습니다</div>

</body>
<script></script>
</html>