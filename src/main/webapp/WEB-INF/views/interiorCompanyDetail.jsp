<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 상세보기</title>
<style>
			

 		table {
            width: 100%;
            margin-left: 50px;
            margin-top: 10px;
            max-width: 600px;
         }
         table,td{
            border: 1px solid gray;
            border-collapse: collapse;
            padding: 5px 10px;
         }
         th{
              background-color: rgb(144, 209, 240);
              color: white;
         }
         td{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
         }
         #examList{
         	position: absolute;
         	left:10%;
         	top:10%;
         }
         #reviewList{
         position: absolute;
         	left:10%;
         	top:35%;
         }
         #exam{
         	position: absolute;
         	top: 7%;
         	left:18%;
         }
         #h3exam{
         	position: absolute;
         	top: 5%;
         	left:13%;
         }
         #review{
         	position: absolute;
         	top: 32%;
         	left:18%;
         }
         #h3review{
         	position: absolute;
         	top: 30%;
         	left:13%;
         }
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
	<h3>${dto.comId}</h3>
	<jsp:include page="companyDetailnavi.jsp" />
	<h3 id="h3exam">시공사례</h3> 
	<div id="exam">
		<a href="companyDetailExam?comId=${dto.comId}">전체보기</a>
	</div>
	<table id="examList">
		<thead>
			<tr>
				<th>제목</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		<c:forEach items="${examList}" var="examList">
				<tr>
					<td><a href="examDetail?combrdIdx=${examList.combrdIdx}">${examList.subject}</a></td>
					<td>${examList.bHit}</td>
					<td>${examList.reg_date}</td>
				</tr>
		</c:forEach>
	</table>
	<h3 id="h3review">시공리뷰</h3> 
	<div id="review">
		<a href="reviewList?comId=${dto.comId}">전체보기</a>
	</div>
	<table id="reviewList">
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>별점</th>
				<th>작성일</th>
			</tr>
		</thead>
		<c:forEach items="${reviewList}" var="reviewList">
				<tr>
					<td><a href="reviewDetail?revIdx=${reviewList.revIdx}">${reviewList.subject}</a></td>
					<td>${reviewList.id }</td>
					<td>★${reviewList.rate}</td>
					<td>${reviewList.reg_date}</td>
				</tr>
		</c:forEach>
	</table>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>