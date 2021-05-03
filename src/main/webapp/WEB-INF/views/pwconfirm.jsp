<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 페이지</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#main {
	width: 400px;
	height: 300px;
	margin: 200px auto;
}

.subject {
	border: 1px solid;
	width: 300px;
	margin: auto;
}

h3 {
	margin: 5px;
}

div {
	text-align: center;
}

input[type="password"] {
	width: 110%;
	height: 30px;
	padding: 5px;
	margin: 10px;
}

input[type="button"] {
	width: 100px;
	height: 40px;
	margin: 20px 5px;
	font-size: 15px;
	background-color: #94a7be;
	color: white;
	border: none;
	border-radius: 5px;
}
</style>
</head>
<body>

	<div id="main">
		<div class="subject">
			<h3>회원 정보 수정</h3>
		</div>
		<form action="checkPw" method="POST">
			<table id="findFields">
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요." /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" id="update"/>
				
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

$(document).ready(function() {
	$("#update").click(function() {
		if($("#pw").val()==""){
			 alert("비밀번호를 입력해주세요.");
		     $("#pw").focus();
		}else {
			$.ajax({
				type:'get'
				,url:'checkPw'
				,data: {"pw":$("#pw").val()}
				,dataType:'text'
				,success:function(data){
					console.log(data);
					if(data=="yes"){
						alert('비밀번호가 일치합니다. 회원정보 수정페이지로 이동합니다.');
						document.form.action = "myLib_UpdateForm";
						document.form.submit();
					}else{
						alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요');
						$("#pw").focus();
					}
				}
			});
		}
	});
});

$(document).ready(function() {
	$("#withdraw").click(function() {
		if($("#pw").val()==""){
			 alert("비밀번호를 입력해주세요.");
		     $("#pw").focus();
		}else {
			$.ajax({
				type:'get'
				,url:'checkPw'
				,data: {"pw":$("#pw").val()}
				,dataType:'text'
				,success:function(data){
					console.log(data);
					var returnValue = confirm('탈퇴하시겠습니까?');
					if(data=="yes"){
						if(returnValue==true){
							document.form.action = "memWithdraw";
							document.form.submit();
						}
					}else{
						alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요');
						$("#pw").focus();
					}
				}
			});
		}
	});
});

</script>
</html>