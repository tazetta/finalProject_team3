<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>내 작성글</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
table, td, th {
	border-collapse: collapse;
	padding: 10px 15px;
	margin: 15px;
	line-height: 100%;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
}


td {
	height: 55px;
}

.flexBox {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.inputs {
	width: 130px;
	height: 35px;
	border: 2px solid lightslategrey;
	line-height: 100%;
	font-size: 16px;
}



select:hover {
	cursor: pointer;
}

.pagingBtn {
	text-decoration: none;
	color: black;
	font-weight: 600;
	background-color: lightgray;
	margin: 1px 2px;
	margin-top: 0px;
	padding: 3px;
	border: 1px white;
}

.sideBar {
	float: left;
}

th{
      border:1px solid gray;
      border-collapse: collapse;
      text-align: center;
	background-color: cornflowerblue;
            }

			.이미지{
            margin-top:2%;
            width: 200px;
            height: 150px;
            float: right;
        }
		h2{
			border: 1px solid black;
			width: 110px;
			margin: 1px;
			text-align: center;
			font-size: 18px;
			background-color: cornflowerblue;
		}



</style>
</head>
<body>
	<iframe src="mainnavi.html" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
	<div class="flexBox" >
		<div style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
			<div class="sideBar" style="margin-right: 15px;">
				<iframe  src="mynavi.html" scrolling="no" frameborder="0"
				style="height: 650px; float: left; width:250px;" ></iframe>
			</div>
			<div class="sideBar">
				<form>
					<table>
					<h2>우리집 자랑 </h2>
					<tr>
						<td id="user" rowspan="2">
							<div>
							   <a href="./scrapDetail?contentId=${scrap.contentid}" target=window.open()><img src="${scrap.firstimage}" width="200px" height="200px">
							   </a>
							</div>
						 </td>
					</tr>
						</table>
					<table>
						<h2>자유게시판</h2>
					<tr class="table"> 
						<th style="width:70px">글 번호</th>
						<th>제목</th>
						<th style="width:120px">작성자</th>
						<th style="width:60px">조회수</th>
						<th style="width:100px">작성일</th>
					</tr>
						<c:forEach items="${list}" var="board">
						<tr>
							<td>${board.boardIdx}</td>
							<td><a class="mouse_over" href="boardDetail?boardIdx=${bbs.boardIdx}&page=${currPage}">${board.subject}</a></td>
							<td>${board.id}</td>
							<td>${board.bHit}</td>
							<td>${board.reg_date}</td>
						</tr>
                        <tr>
							<td>1000</td>
							<td>제목 작성 합니다.</td>
							<td>아이디 입니다</td>
							<td>1000</td>
							<td>21-04-27</td>
						</tr>
                        <tr>
							<td>1000</td>
							<td>제목 작성 합니다.</td>
							<td>아이디 입니다</td>
							<td>1000</td>
							<td>21-04-27</td>
						</tr>
					</c:forEach>
					</table>
                    <table>
						<h2>꿀팁</h2>
					<tr class="table"> 
						<th style="width:70px">글 번호</th>
						<th>제목</th>
						<th style="width:120px">작성자</th>
						<th style="width:60px">조회수</th>
						<th style="width:100px">작성일</th>
					</tr>
						<c:forEach items="${list}" var="board">
						<tr>
							<td>${board.boardIdx}</td>
							<td><a class="mouse_over" href="boardDetail?boardIdx=${bbs.boardIdx}&page=${currPage}">${board.subject}</a></td>
							<td>${board.id}</td>
							<td>${board.bHit}</td>
							<td>${board.reg_date}</td>
						</tr>
                        <tr>
							<td>1000</td>
							<td>제목 작성 합니다.</td>
							<td>아이디 입니다</td>
							<td>1000</td>
							<td>21-04-27</td>
						</tr>
					</c:forEach>
                    </table>
                    <table>
						<h2>질문 및 답변</h2>
					<tr class="table"> 
						<th style="width:70px">글 번호</th>
						<th>제목</th>
						<th style="width:120px">작성자</th>
						<th style="width:60px">조회수</th>
						<th style="width:100px">작성일</th>
					</tr>
						<c:forEach items="${list}" var="board">
						<tr>
							<td>${board.boardIdx}</td>
							<td><a class="mouse_over" href="boardDetail?boardIdx=${bbs.boardIdx}&page=${currPage}">${board.subject}</a></td>
							<td>${board.id}</td>
							<td>${board.bHit}</td>
							<td>${board.reg_date}</td>
						</tr>
                        <tr>
							<td>1000</td>
							<td>제목 작성 합니다.</td>
							<td>아이디 입니다</td>
							<td>1000</td>
							<td>21-04-27</td>
						</tr>
					</c:forEach>
                    </table>
            	</form>
			</div>
			
		</div>
	</div>
</body>
<script>

</script>
</html>
