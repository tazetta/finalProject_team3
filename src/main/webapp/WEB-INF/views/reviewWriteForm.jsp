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
	

</style>
</head>
<body>
<hr/>
<form action="reviewWrite" method="post">
	<table>
		<tr>
			<th>업체</th>
			<td><input type="text" name="comId" value="company1" readonly/></td><!-- 로그인 세션 받아올예정 -->
		</tr>
		<tr>
			<th>별점</th>
			<td>
				<select name="rate" id="rate">
					<option value="5.0">★5.0</option>
					<option value="4.0">★4.0</option>
					<option value="3.0">★3.0</option>
					<option value="2.0">★2.0</option>
					<option value="1.0">★1.0</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="id" value="${sessionScope.loginId}" readonly/></td><!-- 로그인 세션 받아올예정 -->
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" id="subject"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content" id="content"></textarea>
			</td>
		</tr>
	</table>
	<input type="button" id="save" value="리뷰작성"/>	
</form>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
$("#save").click(function(){
	if($("#subject").val()==""||$("#content").val()==""){
		console.log($("#subject").val()+"/"+$("#content").val())
		alert("제목과 내용을 모두 작성해주세요");
	}else{
		$("form").submit();
	}
});
</script>
</html>