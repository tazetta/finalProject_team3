<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String comId = (String)request.getSession().getAttribute("comId"); %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<style>
#mainnavi {
	position: absolute;
	top: 5%;
	left: 20%;
}

#box {
	position: absolute;
	margin-top:20px;
	left: 20%;
	width: 50%;
}
button,input[type='button'] {
	height: 30px;
	border: none;
	background-color: #acd3fb;
	cursor: pointer;
	color: white;
	font-weight: bold;
}

button:hover {
	background-color: #acd3fb;
	cursor: pointer;
	box-shadow: 0 2px 4px rgba(0, 79, 255, 0.6);
	border: 2px solid white;
	color: white;
}
.maintable {
	padding: 5px 10px;
	text-align: center;
	border: 1px solid lightgray;
	border-collapse: collapse;
	width: 90%;
}
#table{
	margin-left: 100px;
}
.하단버튼{
	float: right;
	margin: 10px;
}
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
}
</style>
</head>
<body>
	<jsp:include page="mainnavi.jsp"></jsp:include> 
   <div class="container" style="text-align: center; ">
    <div style="background-color: #acd3fb; width: 1000px; height: 100px; text-align: center;">
    	<br>
    	<h3>시공사례 상세보기</h3>
    
    <br/>
    <div id="table">
		<table class="maintable">
			<tr>
				<th>업체명</th>
				<td class="maintable">${dto.comId}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td class="maintable">${dto.subject}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="maintable"  style="height: 500px; width: 300px;">${dto.content}</td>
			</tr>
		</table>
		</div>
		<div class="btn">
			
			<c:if test="${dto.comId==sessionScope.cLoginId}">
				<button class="하단버튼" onclick="location.href='examUpdateForm/${dto.combrdIdx}'">수정</button>
				<button class="하단버튼" onclick="location.href='examDel?combrdIdx=${dto.combrdIdx}'">삭제</button>
			</c:if>
		</div>
	</div>
	</div>
</body>
<script>
</script>
</html>