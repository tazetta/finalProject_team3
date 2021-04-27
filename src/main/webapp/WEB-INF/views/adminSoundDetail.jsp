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
	border: none;
	padding: 10px 10px;
	margin: 10px;
	line-height: 100%;
}

table {
	margin: 20px;
}

.flexBox {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.inputs {
	width: 260px;
	height: 35px;
	border: 2px solid #f2f2f2;
	line-height: 100%;
	font-size: 16px;
}

.inputs:focus {
	
}

.inputs::placeholder {
	color: #f2f2f2;
	font-weight: 600;
}

.headDESC {
	font-size: 25px;
	font-weight: 600;
	color: tomato;
	margin-left: 10px;
	margin-bottom: 0px;
}

input[type="button"], input[type="submit"] {
	border:none;
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
			<form style="border-left: 1px solid #f2f2f2; border-right: 1px solid #f2f2f2;">
				<table><tr>
				<td colspan="2">
				<div class="headDESC">고객의 소리</div>
				</td></tr>
					<tr>
						<td style="font-weight: bold;">카테고리 : </td>
						<td>게시판 관련</td>
					</tr>
					<tr>
						<td style="font-weight: bold;">신청자 : </td>
						<td>hello3902</td>
					</tr>
					<tr>
						<td style="font-weight: bold;">EMAIL : </td>
						<td>hello3902@naver.com</td>
					</tr>
					<tr>
						<td style="font-weight: bold;">제목 : </td>
						<td>이런게 있었으면 좋겠습니다.</td>
					</tr>
					<tr>
						<td colspan="2">
							<div style="border: 1px solid lightgray; width: 520px; height: 260px;">
								첨부한 이미지처럼 게시판이 바뀌었으면 좋겠어요!
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<span style="color: #acd3fb; font-size: large; font-weight: bold;">첨부파일</span>
							<div style="border: 1px solid lightgray; width: 520px; height: auto;">
								image01.png<br/>
								image02.png<br/>
								image03.png
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right;"><input type="button" class="inputs" style="width: 130px; border-radius: 7px;" value="닫기" onclick="closePopUp()"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
	function closePopUp(){
		window.close();
	}
</script>
</html>
