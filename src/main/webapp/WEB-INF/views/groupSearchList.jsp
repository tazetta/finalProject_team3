<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 반응형 디자인을 위한 CSS/JS 라이브러리 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야함) -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>

<title>Insert title here</title>
<style>
table {
	width: 70%;
	margin-top: 10px;
}

table, td,th{
	border: 1px solid;
	border-collapse: collapse;
	padding: 5px 10px;
}

head td, #paging {
	text-align: center;
}
</style>
</head>
<body>
<form action="groupSearch" >
		
			<select id="searchOpt" name="opt">
				<option value="all">전체</option>
				<option value="subject">제목</option>
				<option value="content">글내용</option>
				<option value="id">작성자</option>
			</select>
			<input id="keyword" type="text" name="keyword" placeholder="검색어를 입력하세요"/>
			<button >검색</button>
	
</form>
${msg }

	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>글종류</th>
				<th>현재상태</th>
				<th>마감날짜</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>

		</thead>
		<tbody id="list">
			<!-- 불러온 데이터를 뿌리는 영역 -->
			<c:forEach	items="${list }" var="list">
				<tr>
				<td>${list.gpIdx }</td>
				<td>${list.gpCtgIdx }</td>
				<td>${list.progIdx }</td>
				<td>${list.deadline }</td>
				<td>${list.subject }</td>
				<td>${list.id }</td>
				<td>${list.gHit }</td>
				<td>${list.reg_date }</td>
			</tr>
				
			</c:forEach>
		</tbody>
		<tr>
			<td id="paging" colspan="8">
				<!-- 플러그인 사용 -->
				<div class="container">
					<nav aria-label="pagenavigation" style="text-aglin:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			
			</td>
		</tr>
	</table>
</body>
<script></script>
</html>