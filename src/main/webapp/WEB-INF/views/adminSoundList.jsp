<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
table, td, th {
	border-collapse: collapse;
	padding: 10px 10px;
	margin: 10px;
	line-height: 100%;
	text-align: center;
}

table {
	border-top: 3px solid lightgray;
	border-bottom: 3px solid lightgray;
}

th {
	border-bottom: 1px solid lightgray;
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
</style>
</head>
<body>
	<div class="flexBox">
		<div>
			<div class="sideBar" style="margin-right: 15px;">
				<table style="border: none;">
					<tr>
						<td
							style="text-align: left; font-size: 20px; border: none; font-weight: 600; text-decoration: underline; text-underline-position: under;">Category</td>
					</tr>
					<tr>
						<td style="text-align: right; border: none; font-weight: 600;">메인></td>
					</tr>
					<tr>
						<td style="text-align: right; border: none;">일반회원 목록</td>
					</tr>
					<tr>
						<td style="text-align: right; border: none;">업체회원 목록</td>
					</tr>
					<tr>
						<td style="text-align: right; border: none;">고객의소리</td>
					</tr>
					<tr>
						<td style="text-align: right; border: none;">신고된 게시글</td>
					</tr>
					<tr>
						<td style="text-align: right; border: none;">신고된 댓글</td>
					</tr>
					<tr>
						<td style="text-align: right; border: none;"></td>
					</tr>
					<tr>
						<td style="text-align: right; border: none;"></td>
					</tr>
					<tr>
						<td style="text-align: right; border: none;"></td>
					</tr>
					<tr>
						<td style="text-align: right; border: none;"></td>
					</tr>
				</table>
			</div>
			<div class="sideBar">
				<form>
					<div
						style="display: flex; justify-content: space-between; margin-right: 10px;">
						<div class="headDESC">고객의 소리</div>
						<div>
							<select class="inputs">
								<option>전체</option>
								<option>게시판 관련</option>
								<option>유저 관련</option>
								<option>신고 관련</option>
								<option>기타</option>
							</select>
						</div>
					</div>
					<table>
						<tr>
							<th>제목</th>
							<th>카테고리</th>
							<th>신청자</th>
							<th>작성일</th>
						</tr>
						<tr>
							<td style="text-align: left;" onclick="popUp()">이런게 있었으면 좋겠습니다.</td>
							<td>게시판</td>
							<td>hello3892</td>
							<td>2021-04-12</td>
						</tr>
					</table>
					<div style="text-align: center;">
						<a href="#" class="pagingBtn">처 음</a> <a href="#"
							class="pagingBtn">이전</a> <a href="#" class="pagingBtn"
							style="background-color: skyblue; color: white;">&nbsp;1&nbsp;</a>
						<a href="cQuestionList?page=${currPage+1}" class="pagingBtn">다음</a>
						<a href="#" class="pagingBtn">마지막</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	function popUp(){
		window.open('adminSoundDetail','Detail','width=620, height=660, scrollbars=no, resizable=no');

	}
</script>
</html>
