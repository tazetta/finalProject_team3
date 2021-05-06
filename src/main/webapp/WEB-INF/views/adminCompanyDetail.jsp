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
	border-bottom: 1px solid lightgray;
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
</style>
</head>
<body>
	<div class="flexBox">
		<div>
			<form>
				<div class="headDESC">${dto.comName}</div>
				<table>
					<tr>
						<th>ID</th>
						<td>${dto.comId}</td>
						<th>기업명</th>
						<td>${dto.comName}</td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td colspan="3">${dto.license}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${dto.phone}</td>
						<th>가입일</th>
						<td>${dto.reg_date}</td>
					<tr>
						<th>현재 별점</th>
						<td>${dto.rate}/5</td>
						<th>리뷰</th>
						<td>${dto.cnt}</td>
					</tr>
					<tr>
						<th>패널티 부여</th>
						<td colspan="3">
							<select class="inputs" id="penaltyVal">
								<option value="2">블라인드 1일</option>
								<option value="3">블라인드 3일</option>
								<option value="4">블라인드 5일</option>
								<option value="5">블라인드 7일</option>
								<option value="6">블라인드 30일</option>
								<option value="7">계정 비활성화</option>
							</select>
							<input type="button" id="penaltyBtn" class="inputs" value="확인"/> 
						</td>
					</tr>
					<tr>
						<th colspan="2">신고된 횟수</th>
						<td colspan="2">3</td>
					</tr>
					<tr>
						<th colspan="4">신고 사유</th>
					</tr>
					<tr>
						<td colspan="4">
							연락 두절 / 2021-04-12<br/><br/>
							연락 두절 / 2021-02-03<br/><br/>
							연락 두절 / 2021-01-02
						</td>
					</tr>
		

				</table>
				<div style="text-align: center;"><input type="button" class="inputs" value="창 닫기" onclick="closePopUp()"/></div>
			</form>
		</div>
	</div>
</body>
<script>
	function closePopUp() {
		window.close();
	}
	

</script>
</html>
