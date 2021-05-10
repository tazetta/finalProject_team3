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
	width: 90%;
}

#editable {
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
</style>
</head>
<body>
	<div id="mainnavi" style="min-height: 210px;">
	            <jsp:include page="mainnavi.jsp"></jsp:include> 
    </div>
    <div id="box">
    <div style="background-color: #acd3fb; width: 100%; height: 100px; text-align: center;">
    	<br>
    	<h3>시공사례 수정하기</h3>
    </div>
    <br/>
    <div id="table">
	<form action="/main/examUpdate" method="post">
		<input type="hidden" name="combrdIdx" value="${dto.combrdIdx}" readonly/>
		<table>
			<tr>
				<th>업체명</th>
				<td><input type="text" name="comId" value="${dto.comId}" readonly/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="${dto.subject}"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<div contenteditable="true" id="editable">${dto.content}</div>
					<input name="content" type="hidden" id="content"/>
				</td>
			</tr>
		</table>
	</form>
	<input type="button" value="파일업로드" onclick="fileUp()" />
	</div>
	<div class="btn">
	<button onclick="location.href='../examDetail?combrdIdx=${dto.combrdIdx}'">취소</button>
	<button id="save">수정완료</button>	
	</div>
	</div>
</body>
<script>
$("#save").click(function() {
	console.log($("#editable").html());
	$("#editable>a").find("b").remove(); //a태그안 b태그 삭제
	$("#editable>a").removeAttr("onclick"); //del(this) 무효화
	$("#content").val($("#editable").html());
	$("form").submit();
});

/* 파일업로드 새창*/
function fileUp(){
	window.open("/main/groupUploadForm","fileUpload","width=400, height=100");
	//요청url,타이틀,옵션
}

/* 파일 삭제 - 비동기 */
//groupuploadForm에서 보내는 elem확인
function del(elem){
	console.log(elem); //<a>
	var newFileName = elem.id.substring(elem.id.lastIndexOf("/")+1); //파일명만 뽑아내기
	console.log("newFileName:"+newFileName);

	// 1. 실제 파일 삭제 요청
	 $.ajax({
		url:"/main/groupFileDelete",
		type:"get",
		data:{"fileName":newFileName},
		dataType:"json",
		success:function(d){
			console.log("success:"+d.success);
	// 2. 파일 삭제 요청이 완료되면 화면에 나타난 사진 삭제
			if(d.success ==1){ //실제 파일 삭제 성공시
				$(elem).find('img').remove(); //이미지 삭제
				/* $(elem).next().remove(); */ //<br> 삭제
				$(elem).remove(); // <a>삭제
			}
		},error:function(e){
			console.log(e);
		}
	}); 	
}

</script>
</html>