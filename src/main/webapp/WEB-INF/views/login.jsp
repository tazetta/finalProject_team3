<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="resources/css/memberCSS/login.css">
    <style>
    </style>
</head>
<body>
    <div class="loginForm">
        <form action="login" method="POST">
           <div class="logo-area">
               <a href="../main">
                   <img src="resources/css/memberCSS/logo.png">
               </a>
           </div>
            <div class="input-area">
               <input id="id"type="text" name="id" autocomplete="off" required/>
               <label for="id">USER ID</label>
            </div>
            <div class="input-area">
                <input id="pw" type="password" name="pw" autocomplete="off" required/>
                <label for="pw">PASSWORD</label>
            </div>
            <div class="btn-area">
                 <button>LOGIN</button>
            </div>
           <div  class="module-area">
               <input type="radio" name="mode" value="member" checked="checked"/>일반회원
               <input type="radio" name="mode" value="company"/>업체회원
           </div>
        </form>
        <div class="link-area">
            <a href="registForm">일반 회원가입</a>   &nbsp; / &nbsp;
            <a href="cRegistForm">업체 회원가입</a> &nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="findId">아이디 찾기</a>  &nbsp; / &nbsp;
            <a href="findPw">비밀번호 찾기</a>
        </div>
        <div class="admin">
            <a href="adminLogPage">관리자 로그인</a>
        </div>
    </div>
</body>
<script>


	var msg = "${msg}";
	console.log(msg);
	if(msg != ""){
		alert(msg);
	}
</script>
</html>