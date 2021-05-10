<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	#mainnavi {
	position: absolute;
	top: 5%;
	left: 20%;
}

#box {
	position: absolute;
	top: 30%;
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
.maintable{
	padding: 5px 10px;
	text-align: center;
	border: 1px solid lightgray;
	border-collapse: collapse;
	width: 90%;
}
#table{
	margin-left: 100px;
}
.btn{
	position: absolute;
	bottom :-40px;
	left: 75%;
}
th{
	width: 300px;
}

</style>
</head>
<body>
<hr/>
	<jsp:include page="mainnavi.jsp"></jsp:include> 
    <div id="box">
    <div style="background-color: #acd3fb; width: 100%; height: 100px; text-align: center;">
    	<br>
    	<h3>시공리뷰 상세보기</h3>
    </div>
    <br/>
    <div id="table">
	
	<table class="maintable">
		<tr>
			<th>업체명</th>
			<td class="maintable">${dto.comId}</td>
		</tr>
		<tr>
			<th>별점</th>
			<td class="maintable">★${dto.rate}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td class="maintable">${dto.id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td class="maintable">${dto.subject}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="maintable" style="height: 500px;">${dto.content}</td>
		</tr>
	</table>
	<div class="btn">
	<c:if test="${dto.id==sessionScope.loginId}">
	<button onclick="location.href='reviewUpdateForm?revIdx=${dto.revIdx}'">수정</button>
	<button onclick="location.href='reviewDelete?revIdx=${dto.revIdx}'">삭제</button>
	</c:if>
	</div>
	</div>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

</script>
</html>