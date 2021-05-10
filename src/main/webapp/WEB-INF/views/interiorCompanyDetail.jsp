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
            border: 1px solid lightgray;
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
         
         
        #side{
        	margin-left: 4%;
        	margin-top: 300px;
        }
        #box{
        	position:absolute;
        	top: 40%;
        	margin-left: 300px;
        }
		.업체정보{
            border:1px solid gainsboro;
            border-collapse: collapse;
            width: 200px;
            height: 200px;
            position: absolute;
            top:250px;
            margin-top: 30px;
            margin-left: 4%;
            text-align: center;
        }
        
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
	<jsp:include page="mainnavi.jsp"></jsp:include> 
    
    <div id="total">
		<table class="업체정보">
			<tr>
				<td style="font-size: 20px; padding-top: 20px;"><strong>${dto.comId}</strong>
				</td>
			</tr>
			<tr>
				<td style="color: gainsboro;">─────────</td>
			</tr>
			<tr>
				<td style="color: gray;">종합리모델링 기타</td>
			</tr>
			<tr>
				<td style="font-size: 25px;"><strong>★ ${rate}</strong></td>
			</tr>
		</table>
	<div id="side">
	<c:if test="${sessionScope.loginId ne null}"><!-- 업체회원은 안보이게 -->
		<jsp:include page="companyDetailnavi.jsp" />
	</c:if>
	</div>
	<div id="box">
	<div id="exam">
	<h3 id="h3exam">시공사례</h3>
		<div>
			<a href="companyDetailExam?comId=${dto.comId}&rate=${rate}">전체보기</a>
		</div>
	</div>
	<div>
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
	</div>
	<div>
		<h3 id="h3review">시공리뷰</h3> 
			<div id="review">
				<a href="reviewList?comId=${dto.comId}&rate=${rate}">전체보기</a>
			</div>
	</div>
	<div>
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
	</div>
	</div>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>