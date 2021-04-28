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
			<form>
				<div>
					<div class="sideBar" style="margin-right: 15px;">
						<table style="border: none;">
							<tr>
								<td
									style="text-align: left; font-size: 20px; border: none; font-weight: 600; text-decoration: underline; text-underline-position: under;">Category</td>
							</tr>
							<tr>
								<td style="text-align: right; border: none;">메인</td>
							</tr>
							<tr>
								<td style="text-align: right; border: none;">일반회원
									목록</td>
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
								<td style="text-align: right; border: none; font-weight: 600;">신고된 댓글></td>
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
					<div class="sideBar" style="margin-right: 15px;">
						<div
							style="display: flex; justify-content: space-between; margin-right: 10px;">
							<div class="headDESC">신고된 댓글</div>
							<div>
								<select class="inputs">
									<option>신고사유</option>
									<option>무분별한 욕설 및 비방</option>
									<option>과도한 광고</option>
									<option>사행성 조장</option>
									<option>기타</option>
								</select>
							</div>
						</div>
						<table style="min-width: 900px;">
							<tr>
								<th style="width: 250px;">게시글 제목</th>
								<th style="width: 100px;">신고 사유</th>
								<th style="width: 150px;">신고받은 회원</th>
								<th style="width: 100px;">신고일</th>
								<th style="width: 100px;">신고 처리</th>
								<th>확인</th>
							</tr>
							<tr>
								<td>제 게시글 보면 2000원 버는 방법 나와있어요.</td>
								<td>과도한 광고</td>
								<td>youtuber2000</td>
								<td>2021-04-12</td>
								<td><input type="checkbox" value="블라인드" />블라인드</td>
								<td><input type="button" value="확인" style="width: 50px;"
									class="inputs" /></td>
							</tr>
						</table>
						<div style="text-align: center;">
							<a href="#" class="pagingBtn">처 음</a> <a href="#"
								class="pagingBtn">이전</a> <a href="#" class="pagingBtn"
								style="background-color: skyblue; color: white;">&nbsp;1&nbsp;</a>
							<a href="cQuestionList?page=${currPage+1}" class="pagingBtn">다음</a>
							<a href="#" class="pagingBtn">마지막</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
	
</script>
</html>
