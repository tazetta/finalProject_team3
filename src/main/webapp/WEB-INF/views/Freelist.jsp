
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 리스트</title>
<!-- CSS boot -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container" style="text-align: center;">
        <select name="idx" id="idx"style="border-radius: 5px; ">
            <option value="">제목</option>
            <option value="1">글내용</option>
            <option value="2">작성자</option>
        </select>
        
                <input type="text" size="75" style="border-radius: 5px; border: 1px solid;" placeholder="검색어를 입력해주세요."> 
                <button id="btn" style="border-radius: 5px; background-color: white; border: 1px solid;">검색</button>
                              

    </div>
    <hr/>
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
            <tbody>
                <tr>
                    <td>거꾸리하면</td>
                    <td>123</td>
                    <td>185</td>
                    <td>10.22</td>
                </tr>
                <tr>
                    <td>거꾸리하면</td>
                    <td>123</td>
                    <td>185</td>
                    <td>10.22</td>
                </tr>
                <tr>
                    <td>거꾸리하면</td>
                    <td>123</td>
                    <td>185</td>
                    <td>10.22</td>
                </tr>
            </tbody>
        </table>
        <hr/>
        <button class="btn" id="comment" style="border-radius: 5px; background-color:rgb(170, 187, 247) ; font-weight: bold;  color: white;" onclick="location.href='boardWriteForm?boardCtgIdx=1'"  >글쓰기</button>
        </div>
        </body>
        </html>
    
       