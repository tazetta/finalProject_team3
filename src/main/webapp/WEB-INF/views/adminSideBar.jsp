<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.right {
text-align: right;
border: none;
}

a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: #acd3fb;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="sideBar" style="margin-right: 15px;">
		<table style="border: none;" class="sideBarTable">
			<tr><td style="text-align: left;  font-size: 20px; border: none; font-weight: 600; text-decoration: underline; text-underline-position: under;">Category</td></tr>
			<tr><td id="main" class="right"><a href="adminMain">메인</a></td></tr>
			<tr><td id="generalMember" class="right"><a href="adminMemberList">일반회원 목록</a></td></tr>
			<tr><td id="companyMember" class="right"><a href="adminCompanyList">업체회원 목록</a></td></tr>
			<tr><td id="sound" class="right"><a href="adminSoundList">고객의 소리</a></td></tr>
			<tr><td id="reportedBrd" class="right"><a href="adminReportedBrdList">신고된 게시글</a></td></tr>
			<tr><td id="reportedComm" class="right"><a href="adminReportedCommList">신고된 댓글</a></td></tr>
			<tr><td id="reportedGroup" class="right"><a href="adminReportedGroupList">신고된 공동구매</a></td></tr>
		</table>
	</div>
</body>
</html>