<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<!-- CSS boot -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<style>
</style>
</head>
<body>
    <div class="container" style="text-align: center;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248);" placeholder="검색어를 입력해주세요."> 
        <button id="btn" style="border-radius: 5px;background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
        <a href="" style="font-size:small; float: right; color: gray;">|고객센터</a>
        <a href="" style="font-size:small; float: right; color: gray;">|회원가입</a>
        <a href="" style="font-size:small; float: right; color: gray;">로그인</a>
    </div>
    
    <jsp:include page="mainnavi.jsp"></jsp:include>
    <div class="container">
        <th>오늘의 땃쥐 룸</th>
        <hr/>
    </div>
    <div class="container">
        <th>자유게시판</th>
        <table class="table table-hover">
            <thead style="background-color: rgb(170, 187, 247); color: white;">
                <tr>
                    <th>제목</th>
                    <th>작성자</th>   
                    <th>조회수</th> 
                    
                </tr>
            </thead>
                <tr>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                </tr>
                <tr>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                </tr>
                <tr>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                </tr>
            </table>
    </div>

    <div class="container">
        <th>꿀팁</th>
        <table class="table table-hover">
            <thead style="background-color: rgb(170, 187, 247); color: white;">
                <tr>
                    <th>제목</th>
                    <th>작성자</th>   
                    <th>조회수</th> 
                    
                </tr>
            </thead>
                <tr>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                </tr>
                <tr>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                </tr>
                <tr>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                    <td>ㅇ</td>
                </tr>
        </table>
    </div>


</body>
</html>
