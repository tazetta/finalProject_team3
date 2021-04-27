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
</style>
</head>
<body>
	<div class="flexBox" >
		<div style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
			<div class="sideBar" style="margin-right: 15px;">
				<table style="border: none;">
					<tr><td style="text-align: left;  font-size: 20px; border: none; font-weight: 600; text-decoration: underline; text-underline-position: under;">Category</td></tr>
					<tr><td style="text-align: right; border: none; font-weight: 600;">메인></td></tr>
					<tr><td style="text-align: right; border: none;">일반회원 목록</td></tr>
					<tr><td style="text-align: right; border: none;">업체회원 목록</td></tr>
					<tr><td style="text-align: right; border: none;">고객의소리</td></tr>
					<tr><td style="text-align: right; border: none;">신고된 게시글</td></tr>
					<tr><td style="text-align: right; border: none;">신고된 댓글</td></tr>
					<tr><td style="text-align: right; border: none;"></td></tr>
					<tr><td style="text-align: right; border: none;"></td></tr>
					<tr><td style="text-align: right; border: none;"></td></tr>
					<tr><td style="text-align: right; border: none;"></td></tr>
				</table>
			</div>
			<div class="sideBar">
				<form>
					<table style="min-width: 600px;">
						<tr>
							<th colspan="2" style="text-align: left;">오늘 신규 가입자 수 : <span style="color: tomato">${cnt}</span> 명</th>
							<th colspan="2"  style="text-align: left;">현재 관리자 총원 : <span style="color: tomato">4</span> 명</th>
						</tr>
						<tr>
							<td style="text-align: left;">
							<c:forEach items="${newMemberList}" var="list" >
								<span style="color: tomato; border: 1px solid lightgray; border-radius: 2px; background-color: #F7BE81;">신규</span> ${list.id}<br/><br/>
							</c:forEach>
							</td>
							<td>
								<span style="color: #9fa8da">일반회원</span><br/><br/>
								<span style="color: #9fa8da">일반회원</span><br/><br/>
								<span style="color: #9fa8da">일반회원</span><br/><br/>
								<span style="color: #bcaaa4">업체회원</span><br/><br/>
								<span style="color: #9fa8da">일반회원</span><br/><br/>
							</td>
							<td colspan="2">
								admin1234<br/><br/>
								nimda4321<br/><br/>
								solo65464<br/><br/>
								honjfhfhf<br/><br/>
							</td>
						</tr>
						<tr>
							<th colspan="4"><br/><br/></th>
						</tr>
						<tr>
							<th colspan="2" style="text-align: left;">오늘 신고된 게시글 : <span style="color: tomato">16</span> 개</th>
							<th colspan="2" style="text-align: left;">오늘 신고된 댓글 : <span style="color: tomato">116</span> 개</th>
						<tr>
							<td  style="text-align: left;">
								특가! 오늘만 9,900원! <br/><br/>
								이업체 사람*끼들인가? <br/><br/>
								***님 너무 못하시네요
							</td>
							<td style="color:lightgray;">
								광고<br/><br/>
								욕실 및 무분별한 비방<br/><br/>
								욕설 및 무분별한 비방
							</td>
							<td style="text-align: left;">
								ㅄㅋㅋㅋㅋㅋㅋㅋㅋ<br/><br/>
								ㅅㅂ사람이면 이렇게 안함<br/><br/>
								니가 뭔데 그래
							</td>
							<td style="color:lightgray;">
								욕실 및 무분별한 비방<br/><br/>
								욕실 및 무분별한 비방<br/><br/>
								욕실 및 무분별한 비방
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: right;"><span style="color: #acd3fb">+더보기</span></td>
							<td colspan="2" style="text-align: right;"><span style="color: #acd3fb">+더보기</span></td>
						</tr>
					</table>
				</form>
			</div>
			
		</div>
	</div>
</body>
<script>

</script>
</html>
