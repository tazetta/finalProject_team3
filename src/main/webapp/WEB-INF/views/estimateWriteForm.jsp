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
    	<h3>견적서 보내기</h3>
    </div>
    <br/>
    <div id="table">
<form action="estimateWrite" method="post">
	<table class="maintable">
		<tr>
			<th>업체</th>
			<td  class="maintable"><input type="text" name="comId" value="${comId}" readonly/></td><!-- 업체명 받아올예정 -->
		</tr>
		<tr>
			<th>작성자</th>
			<td  class="maintable"><input type="text" name="id" value="${sessionScope.loginId}" readonly/></td><!-- 로그인 세션 받아올예정 -->
		</tr>
		<tr>
			<th>주소</th>
			<td  class="maintable"><input type="text" name="address" id="address"/></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td  class="maintable"><input type="text" name="phone" id="phone"/></td>
		</tr>
		<tr>
			<th>평수</th>
			<td  class="maintable"><input type="number" name="roomsize" id="roomsize"/> 평</td>
		</tr>
		<tr>
			<th>예산</th>
			<td  class="maintable"><input type="number" name="budget" id="budget"/> 만원</td>
		</tr>
		<tr>
			<th>세부사항</th>
			<td class="maintable">
				<textarea name="content" id="content"></textarea>
			</td>
		</tr>
	</table>
	<br>
	<input type="button" id="save" value="견적서보내기"/>	
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
	if($("#address").val()==""||$("#roomsize").val()==""||$("#budget").val()==""){
		alert("평수,예산,주소를 모두 작성해주세요");
	}else{
		$("form").submit();
	}
});
</script>
</html>