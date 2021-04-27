
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부트스트랩 사용 -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>우리 집 자랑 글쓰기</title>
<style>
    th{
        text-align: center;
        
        
    }
    table{
        margin-top: 200px;
      
    }
    .table-bordered{
        border-width: 2px;
        width: 80%;
       
    }
    ul{
        list-style: none;
    }
</style>
</head>

<body>
    <div class="container" style="text-align: center;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248);" placeholder="검색어를 입력해주세요.">
        &nbsp;
        <button id="btn" style="border-radius: 5px; background-color: white; border: 2px solid rgb(203, 228, 248);">검색</button>
        <span><a href="" style="font-size:small; float: right; color: gray;">|고객센터</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray;" >|회원가입</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray;">로그인</a></span>
    </div>
<form method="post" action="">
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr> 
                    <th class="list" style="vertical-align: top;">필수항목</th>
                
                    <td>
                        <ul>
                            <li>
                                <select name="idx" id="idx"style="border-radius: 5px; margin: 5px; ">
                                <option>주거형태</option>
                                <option value="">원룸&오피스텔</option>
                                <option value="1">아파트</option>
                                <option value="2">단독주택</option>
                                <option value="3">기타</option>
                                </select>
                            </li>
                            <br/>
                         
                                <li>
                                    평수<input type="text" style="border-radius: 5px; border-color:  rgb(162, 163, 163); width: 50px;">평
    
                                </li>
                                <br/>
                           
                            <li>

                                예산<input type="text" style="border-radius: 5px;border-color:  rgb(162, 163, 163);  width: 50px;">만원
                            </li>

                        </ul>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>제목</th>
                    <td><input type="text" style="width: 100%;" placeholder="제목을 입력해주세요."></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea style="width: 100%;"cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea></td>
                </tr>
                <tr>
                    <th>아이템</th>
                    <td><textarea style="width: 100%;" cols="30" rows="5" placeholder="ex)1.이케아 가구"></textarea></td>
                </tr>
            </tbody>
        </table>
       
            <div id="content">
                <button class="btn" id="contentbtn" >사진첨부</button>
            </div>
            <div id="button" style="float: right;" >
                <button class="btn" id="contentbtn" style="background-color: rgb(75, 145, 236); font-weight: bold; color: white;">등록</button>
                &nbsp; &nbsp;
                <button class="btn" id="contentbtn"  style="margin-right: 250px; background-color: rgb(75, 145, 236); font-weight: bold; color: white; ">취소</button>
            </div>
      
        </div>
       

    </form>
    </body>
    </html>