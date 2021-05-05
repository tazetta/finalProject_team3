
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 및 답변 게시판</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
</head>
<style>
a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 2px inset;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 40px inset;
}

a {
	display: block;
	text-decoration: none;
	border-radius: 4px;
}

.row {
	width: 400px;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 40px inset;
}

a.page-link {
	color: gray;
}

a.page-link:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(173, 170, 169) 0 0px 0px 40px inset;
}
</style>
</head>


<body>

	<div class="container" style="text-align: center; padding-top: 10px;">
		<input type="text" size="75" id="keyword" name="keyword" 
			style="border-radius: 5px; border: 2px solid rgb(203, 228, 248);"
			placeholder="검색어를 입력해주세요."> &nbsp;
		<button id="btn"
			style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
		<span><a href=""
			style="font-size: small; float: right; color: gray; font-weight: bold;">|고객센터</a></span>
		<span><a href=""
			style="font-size: small; float: right; color: gray; font-weight: bold;">|회원가입</a></span>
		<span><a href=""
			style="font-size: small; float: right; color: gray; font-weight: bold;">로그인</a></span>
	</div>
	<br />
	<div class="container"
		style="height: 200px; background-color: rgb(184, 185, 190); text-align: center;">
		<h2 style="padding-top: 50px; font-weight: bold;">질문 및 답변</h2>
		<div class="container" style="text-align: center; padding-top: 50px;">
			<select name="idx" id="idx"
				style="border-radius: 5px; border: 2px solid gray;">
				<option value="">제목</option>
				<option value="1">내용</option>
				<option value="2">작성자</option>
			</select> <input type="text" size="75"
				style="border-radius: 5px; border: 2px solid gray;" id="keyword" name="keyword" 
				placeholder="검색어를 입력해주세요.">
			<button id="btn"
				style="border-radius: 5px; background-color: rgb(255, 210, 180); border: 1px solid rgb(255, 210, 180); font-weight: bold; color: gray;">검색</button>
		</div>
	</div>


	<!--
 <div class="container">
     <button class="btn "style="border-radius: 5px; background-color: rgb(255, 210, 180); border: 1px solid rgb(255, 210, 180); font-weight:bold; hover: black;" >질문하기</button>
     <button class="btn"style="border-radius: 5px; background-color: rgb(255, 210, 180); border: 1px solid rgb(255, 210, 180); font-weight:bold;" >답변을 기다리는 질문</button>
 </div>-->
	<br />
	<div class="container">
		<div class="row">
			<a href="QWrite" class="button"
				style="max-width: 110; margin: 10px; padding: 10px 20px; font-weight: bold;">질문하기</a>
			<a href="#" class="button2"
				style="max-width: 200; margin: 10px; padding: 10px 20px; font-weight: bold;">답변을
				기다리는 질문</a>
			<div class="container">
				<select name="idx" id="idx"
					style="float: right; border-radius: 5px; border: 2px solid gray;">
					<option value="">최신순</option>
					<option value="1">답변순</option>

				</select>
			</div>
		</div>

	</div>





	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList}" begin="0" end="9"
					step="1" varStatus="status">
					<tr>
						<td><a href="boarddetail/${board.boardIdx}">${board.subject}</a></td>
						<td>${board.id}</td>
						<td>${board.bhit}</td>
						<td>${board.reg_date}</td>
					</tr>

				</c:forEach>
			</tbody>

		</table>
	</div>
	<div class="row">
		<div class="col">

			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">이전</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
		</div>
	</div>



</body>
<script>
$('button').click(function() {
	if ($('#keyword').val() == '') {
		alert("검색어를 입력해주세요.");
		$('#keyword').focus();
	} else {
		$("from").submit();
	}
});
</script>
</html>
