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
	<form action="examWrite" method="post">
		<table>
			<tr><!-- 업체 세션값 받아와서 설정할예정 -->
				<th>업체명</th>
				<td><input type="text" name="comId" value="${sessionScope.cLoginId}" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<div contenteditable="true" id="editable"></div> 
					<input name="content" type="hidden" id="content" />
				</td>
			</tr>
		</table>
	</form>
	<input type="button" value="파일업로드" onclick="fileUp()" />
	<button onclick="location.href='interiorexamList'">취소</button>
	<button id="save">작성완료</button>

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
		window.open("groupUploadForm","fileUpload","width=400, height=100");
		//요청url,타이틀,옵션
	}
	
	/* 파일 삭제 - 비동기 */
	//groupuploadForm에서 보내는 elem확인
	function del(elem){
		console.log(elem); //<a>
		var newFileName = elem.id.substring(elem.id.lastIndexOf("/")+1); //파일명만 뽑아내기
		console.log(newFileName);

		// 1. 실제 파일 삭제 요청
		 $.ajax({
			url:"groupFileDelete",
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