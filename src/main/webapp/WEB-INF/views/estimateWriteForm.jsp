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
<form action="estimateWrite" method="post">
	<table>
		<tr>
			<th>업체</th>
			<td><input type="text" name="comId" value="${comId}" readonly/></td><!-- 업체명 받아올예정 -->
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="id" value="${sessionScope.loginId}" readonly/></td><!-- 로그인 세션 받아올예정 -->
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" id="address"/></td>
		</tr>
		<tr>
			<th>연락저</th>
			<td><input type="text" name="phone" id="phone"/></td>
		</tr>
		<tr>
			<th>평수</th>
			<td><input type="number" name="roomsize" id="roomsize"/> 평</td>
		</tr>
		<tr>
			<th>예산</th>
			<td><input type="number" name="budget" id="budget"/> 만원</td>
		</tr>
		<tr>
			<th>세부사항</th>
			<td>
				<textarea name="content" id="content"></textarea>
			</td>
		</tr>
	</table>
	<input type="button" id="save" value="견적서보내기"/>	
</form>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
$("#save").click(function(){
	if($("#address").val()==""||$("#roomsize").val()==""||$("#budget").val()==""){
		alert("평수,예산,주소를 모두 작성해주세요");
	}else{
		$("form").submit();
	}
});
</script>
</html>