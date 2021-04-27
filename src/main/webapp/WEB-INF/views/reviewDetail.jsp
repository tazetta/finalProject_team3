<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	table,td, th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		text-align: center;
	}
	
	input[type='text'],textarea{
		width: 90%;
	}
	textarea{
		height: 500px;
	}
	
	table{
		width:60%;
	}
	
	#editable{
		width: 99%;
		height: 500px;
		border: 1px solid gray;
		text-align: left;
		overflow: auto;
		margin:5px;
		padding:5px;
	}

</style>
</head>
<body>
<hr/>
	<button onclick="location.href='reviewUpdateForm?revIdx=${dto.revIdx}'">수정</button>
	<button onclick="location.href='reviewDelete?revIdx=${dto.revIdx}'">삭제</button>
	<button onclick="location.href='reviewList'">목록</button>
	<table>
		<tr>
			<th>업체명</th>
			<td>${dto.comId}</td>
		</tr>
		<tr>
			<th>별점</th>
			<td>★${dto.rate}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="height: 500px;">${dto.content}</td>
		</tr>
	</table>

</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

</script>
</html>