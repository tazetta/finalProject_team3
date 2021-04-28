<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="resources/css/memberCSS/find.css"></head>
</head>
<body>
  <div class="all-area">
        <div class="title-area">
            <h3>비밀번호 찾기</h3>
        </div>
        <div class="tab-area">
            <button id="member-tab" type="button" onclick="memberTab()">일반 회원</button><button id="company-tab" type="button"onclick="companyTab()">업체 회원</button>
        </div>
        <div class="member-area">
                <form action="pwFind" method="post">
                    <input type="text" name="name" placeholder="이름 입력"/>
                    <input type="text" name="id" placeholder="아이디 입력 "/>
                    <input type="text" name="email" placeholder="이메일 입력 "/>
                    <div class="btn-area">
                        <button id="btn">비밀번호 찾기</button>
                    </div>
                </form>
        </div>
         <div class="company-area">
                <form action="comPwFind" method="post"> 
                    <input type="text" name="business_number" placeholder="사업자 번호 입력( - ) 없이"/>
                    <input type="text" name="id" placeholder="아이디 입력 "/>
                    <input type="text" name="phone" placeholder="휴대폰 번호 입력( - 없이) "/>

                    <div class="btn-area">

                        <button id="btn">비밀번호 찾기</button>
                    </div>
                </form> 
        </div>
    </div>
</body>
<script>
    function memberTab(){
        $(".company-area").css("display","none");
        $(".member-area").css("display","block");
        $("#company-tab").css('backgroundColor','rgb(192, 189, 189)');
        $("#member-tab").css("backgroundColor","aliceblue");
    }
    function companyTab(){
        $(".member-area").css("display","none");
        $(".company-area").css("display","block");
        $("#company-tab").css("backgroundColor","aliceblue");
        $("#member-tab").css("backgroundColor","rgb(192, 189, 189)")
    }

    var msg = "${msg}";
    if(msg != ""){
    	alert(msg);
    }
</script>
</html>