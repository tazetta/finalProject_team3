<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<form action="groupUpload" method="post" enctype="multipart/form-data">
		<input type="file" name="file" onchange="fileView(this)" />
	</form>
</body>
<script>
	var path = "${path}"; //서비스에서 mav에 넣었던 path가져오기
	console.log(path);
	if(path !=""){
		var elem = opener.document.getElementById("editable");
		// opener : 나를 열어준 페이지. => groupwriteForm
		var content ="";
		content +="<br/>";
		content +="<a href='#' id='${path}' onclick='del(this)'>"; //del은 groupwriteForm에서 처리할거임 
		content += "<img src='${path}' width='250px'/><b>삭제</b></a><br/>"; //img 태그에 path 담기
		elem.innerHTML += content; //여러개의 사진을 본문에 보이도록
		self.close(); //현재 창 닫기
	}

	function fileView(elem) {
		console.log(elem);
		$("form").submit();
	}
</script>
</html>