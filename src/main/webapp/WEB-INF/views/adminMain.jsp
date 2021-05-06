<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>관리자 메인페이지</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
table, td, th {
	border-collapse: collapse;
	padding: 10px 10px;
	margin: 10px;
	line-height: 100%;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
}

td {
	height: 55px;
}

.flexBox {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.inputs {
	width: 130px;
	height: 35px;
	border: 2px solid lightslategrey;
	line-height: 100%;
	font-size: 16px;
}

.headDESC {
	font-size: 25px;
	font-weight: 600;
	color: tomato;
	margin-left: 10px;
	margin-bottom: 0px;
}

input[type="button"], input[type="submit"] {
	background-color: #acd3fb;
	cursor: pointer;
	color: white;
	font-weight: bold;
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #acd3fb;
	cursor: pointer;
	box-shadow: 0 2px 4px rgba(0, 79, 255, 0.6);
	border: 2px solid white;
	color: white;
}

#monitor {
	width: 750px;
	height: 500px;
	overflow: auto;
	border: 2px solid #acd3fb;
}

select:hover {
	cursor: pointer;
}

.pagingBtn {
	text-decoration: none;
	color: black;
	font-weight: 600;
	background-color: lightgray;
	margin: 1px 2px;
	margin-top: 0px;
	padding: 3px;
	border: 1px white;
}

.sideBar {
	float: left;
}

#main {
	font-weight: 600;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="flexBox">
		<div style="min-height: 800px;">
			<jsp:include page="adminSideBar.jsp" />
			<div class="sideBar">

				<div
					style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
					<form>
						<table style="min-width: 1190px;">
							<tr>
								<th colspan="2" style="text-align: left;">오늘 신규 가입자 수 : <span
									style="color: tomato"> ${memberCnt} </span> 명
								</th>
								<th colspan="2" style="text-align: left;">현재 관리자 총원 : <span
									style="color: tomato"> ${adminCnt} </span> 명
								</th>
							</tr>
							<tr>
								<td style="text-align: left;"><c:forEach
										items="${newMemberList}" var="newMemberList">
										<span
											style="color: tomato; border: 1px solid lightgray; border-radius: 2px; background-color: #F7BE81;">신규</span> ${newMemberList.id}<br />
										<br />
										<c:if test="${newMemberList == null}">
									현재 신규회원이 없습니다.
								</c:if>
									</c:forEach></td>
								<td><span style="color: #9fa8da"> </span><br />
								<br /></td>
								<td colspan="2"><c:forEach items="${adminList}"
										var="adminList">
									${adminList.id}<br />
										<br />
									</c:forEach></td>
							</tr>
							<tr>
								<th colspan="4"><br />
								<br /></th>
							</tr>
							<tr>
								<th colspan="2" style="text-align: left;">오늘 신고된 게시글 : <span
									style="color: tomato">${reportedBrdCnt}</span> 개
								</th>
								<th colspan="2" style="text-align: left;">오늘 신고된 댓글 : <span
									style="color: tomato">${reportedCommCnt}</span> 개
								</th>
							<tr>
								<td style="text-align: left;"><c:if
										test="${reportedBrdList eq null}">
									현재 신고된 게시글이 없습니다.<br />
										<br />
									</c:if> <c:if test="${reportedBrdList ne null}">
										<c:forEach items="${reportedBrdList}" var="reportedBrdList">
											${reportedBrdList.subject}<br />
											<br />
										</c:forEach>
									</c:if></td>
								<td style="color: lightgray;"></td>
								<td style="text-align: left;"><c:if
										test="${reportedCommList eq null}">
									현재 신고된 댓글이 없습니다.<br />
										<br />
									</c:if> <c:if test="${reportedCommList ne null}">
										<c:forEach items="${reportedCommList}" var="reportedBrdList">
											${reportedCommList.subject}<br />
											<br />
										</c:forEach>
									</c:if></td>
								<td style="color: lightgray;"></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: right;"><a href="adminReportedBrdList" style="color: #acd3fb">+더보기</a></td>
								<td colspan="2" style="text-align: right;"><a href="" style="color: #acd3fb">+더보기</a></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>

</script>
</html>
