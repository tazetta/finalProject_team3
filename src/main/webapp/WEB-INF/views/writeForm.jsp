
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부트스트랩 사용 -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>자유게시판 글쓰기</title>
<style>

</style>
</head>

<body>
    <div class="container" style="text-align: center;">
        <input type="text" size="75" style="border-radius: 5px; border: 1px solid;" placeholder="검색어를 입력해주세요.">
        &nbsp;
        <button id="btn" style="border-radius: 5px; background-color: white; border: 1px solid;">검색</button>
        <span><a href="" style="font-size:small; float: right; color: gray;">|고객센터</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray;" >|회원가입</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray;">로그인</a></span>
    </div>
    <br/>

<form method="post" action="">

<div class="container" style="height:300px; background-color: rgb(163, 182, 248); text-align:center;">

  <h2 style="padding-top: 100px;">자유게시판</h2>
  <th>글 작성하기</th>          
  
</div>
    <div class="container">

        <table class="table">
      
        
      
            <tr>
      
                <td><input type="text" class="form-control" placeholder="제목을 100자 내로 입력해주세요" name="content"  maxlength="40"></td>
      
            </tr>
      
            <tr>
      
                <td><textarea type="text" class="form-control" placeholder="내용을 입력하세요" name="contentDetail" 
                    maxlength="1000" style="height: 400px;"></textarea></td>
      
            </tr>
      
       
            
        </table>
        <button id="button" style="height: 20;
        background-color: rgb(182, 172, 159);
        color: white;
        font-weight: bold;
        padding: 3px 15px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 15%;
        border-radius: 10px;">사진추가</button>
    </div>
       
      

     
        <div style="text-align: right; padding-right: 230px;">
        <button id="button" style="height: 20;
        background-color: rgb(218, 208, 194);
        color: rgb(19, 18, 18);
        font-weight: bold;
        padding: 3px 10px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 7%;
        border-radius: 10px;">취소</button>
        &nbsp;&nbsp;
        <button id="button" style="height: 20;
        background-color: rgb(252, 214, 158);
        color: rgb(19, 18, 18);
        font-weight: bold;
        padding: 3px 15px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 7%;
        border-radius: 10px;">저장</button>

        </div>



</form>

</body>

</html>

