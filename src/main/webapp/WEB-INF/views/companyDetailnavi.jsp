<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<style>
 .navi{
    border: 1px solid blue;
    border-top-color: white;
    border-bottom-color: white;
    border-collapse: collapse;
	list-style-type: noen;
    width: 200px;
    height: 175px;
    margin: 0;
    padding: 0;
    background-color: white;
    font-size: 20px;
}
.navi li a{
	text-decoration: none;
    color: #000000;
    font-weight: bold;
    display: block;
    text-align: center;
    padding: 8px;
}
li a:hover{
	background-color:#33f;
	color: white;
}
.navi li ul{
	opacity:0;
}
.navi li a{
	transition: all 0.2s;
}
</style>

<body>
    <ul class="navi">
        <li><a href="./estimateWriteForm?comId=${dto.comId}" target="_parent">견적서보내기</a></li>
        <li><a href="./reviewWriteForm?comId=${dto.comId}"  target="_parent">리뷰쓰기</a></li>
        <li><a href="#" target="_parent" onclick="window.open('./companyReportForm?comId=${dto.comId}','신고','width=500px,height=500px,location=no,status=no,scrollbars=yes');">신고하기</a></li>      
    </ul>
</body>
</html>