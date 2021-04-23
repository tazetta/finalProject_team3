<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<style>
table, td {
	padding: 5px 10px;
	text-align: center;
	border: 1px solid black;
	border-collapse: collapse;
}

#editable {
	width: 600px;
	height: 400px;
	border: 1px solid gray;
	text-align: left;
	overflow: auto;
	padding: 5px;
}

input[type='text'] {
	width: 100%;
}
</style>
</head>
<body>
	<h3>글쓰기</H3>
	<form action="groupWrite" method="post">
		<table>
			<tr>
				<td><select name="groupCtg">
						<option value="1">공동구매</option>
						<option value="2">무료나눔</option>
				</select></td>
				<td><input type="text" name="subject" />
				<input type="hidden" name="id" value="mingmang"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<div contenteditable="true" id="editable"></div> 
					<input name="content" type="hidden" id="content" />
				</td>
			</tr>
			<tr>
				<td>오픈카카오톡 URL</td>
				<td><input type="text" name="chatUrl" /></td>
			</tr>
			<tr>
				<td>최대참여자</td>
				<td><input type="text" name="maxUser"></td>
			</tr>
			<tr>
				<td>마감날짜</td>
				<td><!-- <input type="date" name="deadline" /> -->
				
				<input type="text" name="deadline" /></td>
			</tr>
		</table>
	</form>

	<button onclick="location.href='groupListPage'">취소</button>
	<button id="save">작성완료</button>

</body>
<script>
	$("#save").click(function() {
		console.log($("#editable").html());
		$("#content").val($("#editable").html());
		$("form").submit();
	});
</script>
</html>