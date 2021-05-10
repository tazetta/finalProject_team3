<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	.maintable {
	padding: 5px 10px;
	text-align: center;
	border: 1px solid lightgray;
	border-collapse: collapse;
	width: 90%;
}

textarea {
	width: 99%;
	height: 400px;
	border: 1px solid gray;
	text-align: left;
	overflow: auto;
	padding: 5px;
}

input[type='text'] {
	width: 100%;
}



#box {
	position: absolute;
	top: 30%;
	left: 20%;
	width: 50%;
}
.btn{
	position: absolute;
	bottom : 10px;
	left: 80%;
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
#table{
	margin-left: 100px;
}
input{
	width: 100%;
}	


</style>
</head>
<body>
<hr/>
<jsp:include page="mainnavi.jsp"></jsp:include> 
    <div id="box">
    <div style="background-color: #acd3fb; width: 100%; height: 100px; text-align: center;">
    	<br>
    	<h3>시공리뷰 작성하기</h3>
    </div>
    <br/>
    <div id="table">
<form action="reviewWrite" method="post">
	<table class="maintable">
		<tr>
			<th>업체</th>
			<td class="maintable"><input type="text" name="comId" value="${comId}" readonly/></td><!-- 로그인 세션 받아올예정 -->
		</tr>
		<tr>
			<th>별점</th>
			<td class="maintable">
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
			<td class="maintable"><input type="text" name="id" value="${sessionScope.loginId}" readonly/></td><!-- 로그인 세션 받아올예정 -->
		</tr>
		<tr>
			<th>제목</th>
			<td class="maintable"><input type="text" name="subject" id="subject"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="maintable">
				<textarea name="content" id="content"></textarea>
			</td>
		</tr>
	</table>
	<input type="button" id="save" value="리뷰작성"/>	
</form>
	</div>
	</div>
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