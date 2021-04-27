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
		width: 100%;
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
	<form action="reviewUpdate" method="post">
			<input type="hidden" name="revIdx" value="${dto.revIdx}"/>
	<table>
		
		
		<tr>
			<th>업체명</th>
			<td><input type="text" name="comId" id="comId" value="${dto.comId}" readonly/></td>
		</tr>
		<tr>
			<th>별점</th>
			<td>
				<!-- 받아온값 c:if로 selected걸까? -->
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
			<td><input type="text" name="id" id="id" value="${dto.id}" readonly/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" id="subject" value="${dto.subject}"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" id="content">${dto.content}</textarea></td>
		</tr>
	</table>
	<input type="button" id="save" value="리뷰수정"/>
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