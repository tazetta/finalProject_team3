<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style></style>
		<link rel="stylesheet" href="resources/css/memberCSS/adminLogin.css">
	</head>
	<body>
	<body>
    <div class="loginForm">
        <form action="adminLogin" method="POST">
           <div class="logo-area">
               <a href="${pageContext.request.contextPath}">
                    <img src="${pageContext.request.contextPath}/resources/css/memberCSS/logo.png">
               </a>
           </div>
            <div class="input-area">
               <input id="id"type="text" name="id" autocomplete="off" required/>
               <label for="id">ADMIN ID</label>
            </div>
            <div class="input-area">
                <input id="pw" type="password" name="pw" autocomplete="off" required/>
                <label for="pw">PASSWORD</label>
            </div>
            <div class="btn-area">
                 <button>LOGIN</button>
            </div>
        </form>
        <div class="admin">
            <a href="membership">로그인 페이지</a>
        </div>
    </div>
</body>
	<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}</script>
</html>