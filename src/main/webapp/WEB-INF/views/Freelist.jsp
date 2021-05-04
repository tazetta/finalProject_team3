
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 리스트</title>
<!-- CSS boot -->
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
</head>
<body>
<form action="FreeSearch">
	<div class="container" style="text-align: center;">
		<select name="opt" id="searchOpt" style="border-radius: 5px;">
			<option value="all">전체</option>
			<option value="subject">제목</option>
			<option value="content">글내용</option>
			<option value="id">작성자</option>
		</select>
	<input type="text" id="keyword" name="keyword" size="75" style="border-radius: 5px; border: 1px solid;" placeholder="검색어를 입력해주세요.">
		<button id="btn" style="border-radius: 5px; background-color: white; border: 1px solid;" onclick="searchFree()">검색</button>
	</div>
	</form>
	<hr />
	<div class="container">
		<table class="table table-hover">
			<thead style="background-color: rgb(170, 187, 247); color: white;">
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>

			<tbody id="list">
				<c:forEach var="board" items="${boardList}" begin="0" end="9" step="1" varStatus="status">
					<tr>
						<td><a href="boarddetail/${board.boardIdx}">${board.subject}</a></td>
						<td>${board.id}</td>
						<td>${board.bhit}</td>
						<td>${board.reg_date}</td>
					</tr>
				</c:forEach>
			</tbody>
        </table>
        <hr />
        <div class="row">
    <div class="col">
       
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">이전</a></li>
            <li class="page-item"><a class="page-link" href="">1</a></li>
            <li class="page-item"><a class="page-link" href="">2</a></li>
            <li class="page-item"><a class="page-link" href="">3</a></li>
            <li class="page-item"><a class="page-link" href="">4</a></li>
            <li class="page-item"><a class="page-link" href="">5</a></li>
            <li class="page-item"><a class="page-link" href="">다음</a></li>
        </ul>
    </div>
</div>
   
        <button class="btn" id="comment"
			style="border-radius: 5px; background-color:rgb(170, 187, 247) ; font-weight: bold;  color: white;"
			onclick="location.href='boardWriteForm?boardCtgIdx=1'">글쓰기</button>
        </div>
        </body>
        
        <script type="text/javascript">
        var msg="${msg}";

        if(msg!=""){
        	 alert(msg);
        }
        
        function searchFree(){
        	var keyword = $("#keyword").val();
        	console.log("keyword:"+keyword);
        	if(keyword ==''){
        		alert("검색어를 입력해주세요");
        	}else{
        		$("form").submit();
        	}
        }
       
        </script>
        </html>
    
       