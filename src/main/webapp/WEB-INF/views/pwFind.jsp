<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style></style>
		    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
			<link rel="stylesheet" href="resources/css/memberCSS/find.css">
			
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
                <form action="pwFind" method="post" onsubmit="return findSubmit()">
                    <input id="name" type="text" name="name" placeholder="이름 입력"/>
                    <input id="id" type="text" name="id" placeholder="아이디 입력 "/>
                    <input id="email"type="text" name="email" placeholder="이메일 입력 "/>
                    <div class="btn-area">
                        <button id ="btn1" >비밀번호 찾기</button>
                    </div>
                </form>
        </div>
         <div class="company-area">
                <form action="cPwFind" method="post" onsubmit="return cFindSubmit()"> 
                    <input id="business_number" type="text" name="business_number" placeholder="사업자 번호 입력( - ) 없이"/>
                    <input id="cId" type="text" name="cId" placeholder="아이디 입력 "/>
                    <input id="phone" type="text" name="phone" placeholder="휴대폰 번호 입력( - 없이) "/>
                    <div class="btn-area">
                        <button id="btn2">비밀번호 찾기</button>
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
        $("#member-tab").css("backgroundColor","#166eca");
        $("#company-tab").css("color","black");
        $("#member-tab").css("color","white");
    }
    function companyTab(){
        $(".member-area").css("display","none");
        $(".company-area").css("display","block");
        $("#company-tab").css("backgroundColor","#166eca");
        $("#member-tab").css("backgroundColor","rgb(192, 189, 189)")
        $("#company-tab").css("color","white");
        $("#member-tab").css("color","black");
    }
   
    function findSubmit(){
        
        var name = $("#name").val();
        var email = $("#email").val();
        var id = $("#id").val();
        console.log(name);
        console.log(email);
        console.log(id);
        if(name == ""){
            alert('이름을 입력해주세요.');
            return false;
        }else if(id == ""){
            alert('아이디를 입력해 주세요.')
            return false;
        }else if(email === ""){
            alert('이메일을 입력해 주세요.');
            return false;
        }else{
            return true;
        }
    };

    function  cFindSubmit(){
        var phone = $("#phone").val();
        var business_number = $("#business_number").val();
        var cId = $("#cId").val();
        if(business_number == ""){
            alert('사업자 번호를 입력하세요.( - )없이');
            return false;
        }else if(cId == ""){
            alert("아이디를 입력하세요.");
            return false;
        }else if(phone == ""){
            alert('휴대폰 번호를 입력하세요.( - )없이')
            return false;
        }else{
            return true;
        }
    }
    
    var msg = "${msg}";
    if(msg != ""){
    	alert(msg);
    }
</script>
</html>