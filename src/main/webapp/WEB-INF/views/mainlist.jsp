
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 통합검색 결과</title>
<!-- CSS boot -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container" style="text-align: center;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248);" placeholder="검색어를 입력해주세요.">
        &nbsp;
        <button id="btn" style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
        <span><a href="" style="font-size:small; float: right; color: gray;">|고객센터</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray;" >|회원가입</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray;">로그인</a></span>
    </div>
            <div class="container" style="font-size: small;">
                <th>'거꾸리'에 대한 통합검색 결과 6개</th>
            </div>

       

        <div class="container">

            <h>자유게시판</h>

            <span><a href="" style="font-size: x-small; color: gray;">자유게시판 검색결과 전체보기</a></span>
            <table class="table table-hover" style="min-width:700px ;">
                <thead style="background-color: rgb(163, 182, 248); color: white;">
                    <tr>
                        <th style="width: 50%;">제목</th> 
                        <th style="width: 10%;">작성자</th>   
                        <th style="width: 10%;">조회수</th> 
                        <th style="width: 10%;">작성일</th> 
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
                        <td></td>
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
        </div>
            <div class="container">

                <h>공동구매</h>
                <span><a href="" style="font-size: x-small; color: gray;">공동구매 검색결과 전체보기</a></span>
                <table class="table table-hover" style="min-width:600px ;">
                    <thead style="background-color: rgb(163, 182, 248); color: white;">
                        <tr>
                            <th style="width: 10%;">글번호</th> 
                            <th style="width: 10%;">글종류</th>   
                            <th style="width: 10%;">현재상태</th> 
                            <th style="width: 10%;">신청기간</th>
                            <th style="width: 10%;">남은자리</th>
                            <th style="width: 30%;">제목</th>
                            <th style="width: 10%;">작성자</th> 
                            <th style="width: 10%;">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>001</td>
                            <td>공동구매</td>
                            <td>진행중</td>
                            <td>10.22</td>
                            <td>4</td>
                            <td>거꾸리사실분</td>
                            <td>mdf123</td>
                            <td>4-12</td>
                        </tr>
                        
                    </tbody>
                    <tbody>
                        <tr>
                            <td>001</td>
                            <td>공동구매</td>
                            <td>진행중</td>
                            <td>10.22</td>
                            <td>4</td>
                            <td>거꾸리사실분</td>
                            <td>mdf123</td>
                            <td>4-12</td>
                        </tr>
                        
                    </tbody>
                    <tbody>
                        <tr>
                            <td>001</td>
                            <td>공동구매</td>
                            <td>진행중</td>
                            <td>10.22</td>
                            <td>4</td>
                            <td>거꾸리사실분</td>
                            <td>mdf123</td>
                            <td>4-12</td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
            <div class="container">
                <h>우리집 자랑</h>
                <img>
            </div>
            <div class="container">
             
            </div>

           
                
            </div>
  
</body>

</html>