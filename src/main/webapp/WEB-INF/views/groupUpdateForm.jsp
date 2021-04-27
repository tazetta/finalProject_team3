<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>수정 상세보기</title>
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
	<h3>수정하기</h3>
	<form action="/main/groupUpdate" method="post">
		<table>
			<tr>
				<td><select name="gpCtgIdx">
					
					<%-- <c:if test="${dto.gpCtgIdx =='1'}"></c:if> --%>
						<option value="1">공동구매</option>
						
						<option value="2">무료나눔</option>
				</select></td>
				<td><input type="text" name="subject" value="${dto.subject }"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input name="gpIdx" type="hidden" value="${dto.gpIdx}" />
					<div contenteditable="true" id="editable"> ${dto.content }</div> 
					<input name="content" type="hidden" id="content" />
				</td>
			</tr>
			<tr>
				<td>오픈카카오톡 URL</td>
				<td><input type="text" name="chatURL" value="${dto.chatURL }" /></td>
			</tr>
			<tr>
				<td>최대참여자</td>
				<td><input type="text" name="maxUser" value="${dto.maxUser }"></td>
			</tr>
			<tr>
				<td>모집상태</td>
				<td><select name="progIdx" >
						<option value="1">진행중</option>
						<option value="2">인원부족마감</option>
						<option value="3">마감</option>
				</select></td>
			</tr>
			<tr>
				<td>마감날짜</td>
				<td><input type="Date" name="deadline" value="${dto.deadline }" /></td>
			</tr>
		</table>
	</form>
	<input type="button" value="파일업로드" onclick="fileUp()" />
	<button onclick="location.href='/main/groupDetail?gpIdx=${dto.gpIdx}'">취소</button>
	<button id="save">수정완료</button>
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