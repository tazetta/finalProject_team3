
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
<style>
     a {
            text-decoration: none;
            font-weight: bold;
        }

        span:hover {
            color: black;
        }

        .flexBox {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        #btn:hover{
            color: rgb(143, 201, 248);
	        box-shadow: rgb(143, 201, 248) 0 0px 0px 40px inset;
        }
</style>
<body>
    <br/>
    <div class="container" style="text-align: center; padding-top: 10px;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248); " placeholder="검색어를 입력해주세요.">
        &nbsp;
        <button id="btn" style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
        <a href="" style="font-size:small; float: right; color: gray; padding-left: 5px;  font-weight: bold;">|<span
            style="padding-left: 5px; font-weight: bold; " >고객센터</span></a>
    <a href="" style="font-size:small; float: right; color: gray; padding-left: 5px; font-weight: bold;">|<span
            style="padding-left: 5px;  font-weight: bold;">회원가입</span></a>
    <a href="" style="font-size:small; float: right; color: gray;  font-weight: bold; "><span>로그인</span></a>
    <br/>
</div>
<br/>
            <div class="container" style="font-size: small;">
                <h style="font-size: medium;"><span style="font-weight: bold;">'거꾸리'</span>에 대한 통합검색 결과 6개</h>
            </div>
<br/>
       

        <div class="container">

            <h style="font-size: x-large; font-weight: bold; color: rgb(73, 72, 72);">자유게시판</h>

            <a href="" style="font-size: x-small; color: gray;"> <span>자유게시판 검색결과 전체보기</span></a>
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
        <br/>
            <div class="container">

                <h style="font-size: x-large;  font-weight: bold;  color: rgb(73, 72, 72);">공동구매</h>
                <a href="" style="font-size: x-small; color: gray;"><span>공동구매 검색결과 전체보기</span></a>
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
            <br/>
            <div class="container">
                <h style="font-size: x-large; font-weight: bold; color: rgb(73, 72, 72);">우리집 자랑</h>
                <img>
            </div>
     
             
                <div class="container">
                   
                    <br/>
                    <div class="container">
                        <div style="display: flex;  justify-content: center; border: 1px solid rgb(255, 255, 255); height: 100%;">
                            <div style="border: 5px solid white; margin-right: 90px; box-shadow:0 0 5px lightslategray;" >
                                <img src="C:\Users\user\Desktop\BootStrap\interior1.jpg" width="250" height="250">
                            </div>
                            <div style="border: 5px solid white; margin-right: 90px; box-shadow:0 0 5px lightslategray;" >
                                <img src="C:\Users\user\Desktop\BootStrap\interior2.jpg" width="250" height="250">
                            </div>
                            <div style="border: 5px solid white; margin-right: 90px; box-shadow:0 0 5px lightslategray;" >
                                <img src="C:\Users\user\Desktop\BootStrap\interior3.jpg" width="250" height="250">
                            </div>
                        </div>
                    </div>
                    <br/>
                   
                </div>

</html>