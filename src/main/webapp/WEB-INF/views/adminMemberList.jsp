<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>관리자 일반회원 목록</title>
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

table {
	border-top: 2px solid lightgray;
	border-bottom: 2px solid lightgray;
}

td {
	height: 55px;
}

form table th {
	border-bottom: 1px solid lightgray; 
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
	margin-bottom: 15px;
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
			<div>
				<div style="display: flex; justify-content: space-between; ">
					<div class="headDESC">
						일반회원목록
					</div>
					<div>
						<select class="inputs">
							<option>회원등급</option>
							<option>초보</option>
							<option>중수</option>
							<option>고수</option>
							<option>초고수</option>
							<option>신</option>
						</select> <select class="inputs">
							<option>현재 패널티</option>
							<option>작성 금지 1일</option>
							<option>작성 금지 3일</option>
							<option>작성 금지 5일</option>
							<option>작성 금지 7일</option>
							<option>작성 금지 30일</option>
							<option>계정 비활성화</option>
						</select> <select class="inputs">
							<option>탈퇴 여부</option>
							<option>초보</option>
							<option>중수</option>
							<option>고수</option>
							<option>초고수</option>
							<option>신</option>
						</select>
						<input type="text" class="inputs" placeholder="ID를 입력해주세요."/>
						<input type="button" class="inputs" value="검색" />
					</div>
				</div>
			</div>
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
								<td style="text-align: right; border: none; font-weight: 600;">일반회원
									목록></td>
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
						<table>
							<tr>
								<th>ID</th>
								<th style="width: 150px;">회원등급</th>
								<th>신고된 횟수 ▼</th>
								<th style="width: 150px;">가입일</th>
								<th style="width: 150px;">현재 패널티</th>
								<th>탈퇴 여부</th>
							</tr>
							<tr>
								<td><input type="button" class="inputs" value="hello3982" onclick="detailPopUp()"
									style="border: none; border-radius: 10px; width: 120px;" 
								/></td>
								<td>초고수</td>
								<td>7</td>
								<td>2021-04-12</td>
								<td>none</td>
								<td>false</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function detailPopUp(){
		var url = "adminMemberDetail";
		window.open(url,"상세보기","width=480, height=400");
	}
</script>
</html>
