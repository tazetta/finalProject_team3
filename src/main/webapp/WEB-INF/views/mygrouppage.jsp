<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>공동구매 페이지</title>
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

    
    h2{
			border: 1px solid black;
			width: 140px;
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
						<h2>신청한 공동구매</h2>
					<tr class="table"> 
						<th style="width:70px">글 번호</th>
						<th style="width:30px">현재 상태</th>
						<th style="width:120px">제목</th>
						<th style="width:60px">작성자</th>
						<th style="width:100px">작성일</th>
					</tr>
						<c:forEach items="${list}" var="board">
						<tr>
							<td>${board.boardIdx}</td>
                            <td>${board.situation}</td>
							<td><a class="mouse_over" href="boardDetail?boardIdx=${bbs.boardIdx}&page=${currPage}">${board.subject}</a></td>
							<td>${board.id}</td>
							<td>${board.reg_date}</td>
						</tr>
                        <tr>
							<td>1000</td>
							<td>진행중</td>
                            <td>잡화 판매 합니다.</td>
							<td>USER3</td>
							<td>21-04-27</td>
						</tr>
                        <tr>
							<td>2000</td>
							<td>진행중</td>
                            <td>거꾸리 공동구매</td>
							<td>USER2</td>
							<td>21-04-25</td>
						</tr>
                     </c:forEach>
					</table>
                    <br/>
                    <table>
					
                        <h2>작성한 공동구매</h2>
                        <a href="" value="전체보기">전체보기</a>
                    <tr class="table"> 
						<th style="width:70px">글 번호</th>
						<th style="width:30px">현재 상태</th>
						<th style="width:120px">제목</th>
						<th style="width:60px">작성자</th>
						<th style="width:100px">작성일</th>
					</tr>
						<c:forEach items="${list}" var="board">
						<tr>
							<td>${board.boardIdx}</td>
                            <td>${board.situation}</td>
							<td><a class="mouse_over" href="boardDetail?boardIdx=${bbs.boardIdx}&page=${currPage}">${board.subject}</a></td>
							<td>${board.id}</td>
							<td>${board.reg_date}</td>
						</tr>
                        <tr>
							<td>7000</td>
							<td>진행중</td>
                            <td>스타벅스 기프티콘</td>
							<td>USER</td>
							<td>21-04-27</td>
						</tr>
                        <tr>
							<td>4000</td>
							<td>진행중</td>
                            <td>의류 판매 합니다</td>
							<td>USER</td>
							<td>21-04-28</td>
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
