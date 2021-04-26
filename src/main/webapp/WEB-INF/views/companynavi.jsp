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
        <li><a href="./companydetail" target="_parent">업체 정보</a></li>
        <li><a href="./estimatelist" target="_parent">받은 견적서</a></li>
        <li><a href="./examlist"  target="_parent">시공 사례</a></li>
        <li><a href="#">시공 리뷰</a></li>
            
            </ul>
</body>
</html>