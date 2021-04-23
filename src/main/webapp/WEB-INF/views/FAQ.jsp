<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <title>고객센터</title>
    </head>
    <style>
        div{
            float: left;
        }
        a{
            border:none;
                margin-right: 3%;
                float: right; 
                color:#fff;
                background: #004fff;
                border-radius: 20px;
                box-shadow: 0 4px 16px rgba(0,79,255,0.3);
                transition:0.3s;            
        }
        .답변{
        color: black;
        }
        a:link, a:visited {
        background-color: deepskyblue;
        color: white;
        padding: 14px 25px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        }

        a:hover, a:active {
        background-color: dodgerblue;
        }
    </style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


    <body>
        <div style="height: 30px;width: 100%; background-color: red; margin-bottom: 1%;">네비바 들어가용~</div>
       
        
        <hr style="margin-bottom: 2%;"/>

        <div style="margin-left: 2%;font-size: 50px;"><strong style="color: coral;">고객센터</strong> <strong style="color: gray; font-size: 60px;"> | </strong><strong style="color: coral;">FAQ</strong></div>
        <a href="https://www.naver.com/">고객의소리</a>

        <div style=" margin-top: 10%; font-size: 25px;">
        <ul><strong onclick="view1()" style="font-size: 40px;color: coral; cursor: pointer;">Q</strong>.비밀번호 어떻게 바꾸나여?</ul>
        <ul class="답변" id="hidden1"  style="display:none"><strong style="font-size: 40px; color: coral;">A</strong>.로그인후 오른쪽 상단 마이페이지에서 바꾸실수있습니다.</ul>
        <hr/>
        <ul><strong  onclick="view2()" style="font-size: 40px;color: coral;cursor: pointer;">Q</strong>.회원 탈퇴는 어떻게하나요?</ul>
        <ul class="답변" id="hidden2" style="display:none"><strong style="font-size: 40px; color: coral;">A</strong>.마이페이지에서 탈퇴신청하면 됩니다.</ul>
        <hr/>
        <ul><strong  onclick="view3()" style="font-size: 40px;color: coral;cursor: pointer;">Q</strong>.회원정보를 수정하고 싶은데 어떻게하나여?</ul>
        <ul class="답변" id="hidden3" style="display:none"><strong style="font-size: 40px; color: coral;">A</strong>.로그인후 오른쪽 상단 마이페이지에서 바꾸실수있습니다.</ul>
        <hr/>
        <ul><strong onclick="view4()" style="font-size: 40px;color: coral;cursor: pointer;">Q</strong>.쪽지는 어떻게 보내나요?</ul>
        <ul class="답변" id="hidden4" style="display:none"><strong style="font-size: 40px; color: coral;">A</strong>.쪽지는 기능을 추가중입니다.</ul>
        <hr/>
        <ul><strong onclick="view5()" style="font-size: 40px;color: coral;cursor: pointer;">Q</strong>.회원탈퇴 후 재가입이 가능한가여?</ul>
        <ul class="답변" id="hidden5" style="display:none"><strong style="font-size: 40px; color: coral;">A</strong>.전에 쓰던 아이디로는 가입이 불가능합니다.</ul>
        <hr/>
    </div>
    </body>
    <script>
    function view1(){
        if(hidden1.style.display=="none"){
            hidden1.style.display="block";
           
        }else{
            hidden1.style.display="none";
           
        }
    }
    function view2(){
        if(hidden2.style.display=="none"){
            hidden2.style.display="block";
           
        }else{
            hidden2.style.display="none";
           
        }
    }
    function view3(){
        if(hidden3.style.display=="none"){
            hidden3.style.display="block";
           
        }else{
            hidden3.style.display="none";
           
        }
    }
    function view4(){
        if(hidden4.style.display=="none"){
            hidden4.style.display="block";
           
        }else{
            hidden4.style.display="none";
           
        }
    }
    function view5(){
        if(hidden5.style.display=="none"){
            hidden5.style.display="block";
           
        }else{
            hidden5.style.display="none";
           
        }
    }
    
        </script>
    </html>