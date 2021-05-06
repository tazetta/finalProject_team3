<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>게시글 신고</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
table, td, th {
	border-collapse: collapse;
	border: none;
	padding: 10px 10px;
	margin: 10px;
	line-height: 100%;
	text-align: left;
}

th {
	width: 110px;
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
	border: none;
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
			<form action="#"> 
				<div class="headDESC">게시글 신고</div>
				<table>
					<tr>
						<th>게시글 제목</th>
						<td style="width: 350px;">title</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td style="width: 350px;">writer</td>
					</tr>
					<tr>
						<th>신고자</th>
						<td>${sessionScope.loginId }</td>
					</tr>
					<tr>
						<th>신고사유</th>
						<td><select class="inputs" name="category" style="width: 180px;">
								<option>신고사유</option>
								<option value="11">욕설 및 무분별한 비방</option>
								<option  value="12">과도한 광고</option>
								<option  value="13">사행성 유도</option>
								<option  value="14"> 기타</option>
						</select>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
						<hr/>
							<div style="display: flex; justify-content: space-between;">
								<input type="button" class="inputs" value="신고하기" style="width: 130px;" /> 
								<input type="button" class="inputs" value="닫기" style="width: 130px;" />
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
	
</script>
</html>
