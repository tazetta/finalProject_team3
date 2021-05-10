<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<link rel="stylesheet" href="resources/css/sidemenuCSS/sidevar.css">
<style>
</style>
</head>
<body>
<div class="snavi">

    <nav class="sidebar">
        <div class="text">My Menu</div>
        <ul>
            <li>
                <a href="#" class="write-btn">내 작성글
                    <span class="fas fa-caret-down write"></span>
                </a>
                <ul class="write-show">
                    <li><a href="mywritehome">우리집 자랑</a></li>
                    <li><a href="mywriteboard">자유게시판</a></li>
                    <li><a href="mywritetip">꿀팁</a></li>
                    <li><a href="mywriteqna">질문 및 답변</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="scrap-btn">스크랩북
                    <span class="fas fa-caret-down scrap"></span>
                </a>
                <ul class="scrap-show">
                  	<li><a href="myscrappage">내 스크랩북</a></li>
                    <li><a href="myscrappage">우리집 자랑</a></li>
                    <li><a href="myscrappage">꿀팁</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="msg-btn">쪽지
                    <span class="fas fa-caret-down msg"></span>
                </a>
                <ul class="msg-show">
                    <li><a href="msgAllPage">전체 쪽지함</a></li>
                    <li><a href="msgreceivepage">받은 쪽지함</a></li>
                    <li><a href="msgsenderpage">보낸 쪽지함</a></li>
                </ul>
            </li>
            <li><a href="myestimate">내 견적서</a></li>
            <li>
                <a href="#" class="bying-btn">공동구매 내역
                    <span class="fas fa-caret-down bying"></span>
                </a>
                <ul class="bying-show">
                	<li><a href="mygrouppage">공동구매 전체</a></li>
                    <li><a href="mygroupbuy">신청한 공동구매</a></li>
                    <li><a href="mygroupwrite">작성한 공동구매</a></li>
                </ul>
            </li>
            <li><a href="myInteriorHistory">내 인테리어 변천사</a></li>
            <li><a href="pwconfirm">회원정보</a></li>
        </ul>
    </nav>
    </div>
</body>

<script>
    $('.write-btn').click(function(){
        $('nav ul .write-show').toggleClass("show");
    });
    $('.scrap-btn').click(function(){
        $('nav ul .scrap-show').toggleClass("show");
    });
    $('.msg-btn').click(function(){
        $('nav ul .msg-show').toggleClass("show");
    });
    $('.bying-btn').click(function(){
        $('nav ul .bying-show').toggleClass("show");
    });
</script>
</html>