<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <style>
        body{
            display: flex;
            justify-content: center;
            height: 100vh;
            align-items: center;
        }
        .title{
            margin-left: 100px;
        }
        .msg{
            margin-left: 100px;
        }
        .input-area{
            width: 600px;
            
        }
        .msg{
            margin-bottom: 50px;
        }
        .input-area label{
            display: block;
            margin-left: 100px;
            margin-bottom: 15px;
        }
        .input-area input{
            width: 400px;
            height: 35px;
            margin-left: 100px;
            margin-bottom: 30px;
            border: 2px solid #166eca;
            border-radius: 3px;
            
        }
        .comfirmPw label{
            display: block;
        }
        #pwChkMsg{
            display: inline;   
            margin-left: 13px;
            position: absolute;
        }
        .btn-area{
            text-align: center;
            margin-top: 40px;
        }
        .btn-area button{
            text-align: center;
            background-color: #166eca;
            color: white;
            border: none;
            width: 200px;
            padding: 12px;
            opacity: 0.9;
        }
        .btn:hover{
            cursor: pointer;
            opacity: 1;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 3px 10px 0 rgba(0,0,0,0.19);
        } 
        #id{
            border: none;
            display: inline;
            text-align: right;
        }
        .msg p{
            display: inline;
        }
    </style>
</head>
<body>
    <div class ="all-area">
        <div class="title">
            <h3>비밀번호 재설정</h3>
        </div>
        <form action="resetCPw" method="POST" onsubmit="return rePw()">
        <div class="msg">
            <input id="id" type="text" name="id" value="${id}" readonly/><p>님 아이디의 비밀번호를 재설정 합니다.</p>
        </div>
        <div class="input-area">
            <div class="resetPw">
                <label for="rPw">재설정할 비밀번호 입력</label>
                <input id="rPw" type="password" name="rPw" placeholder="숫자, 문자, 특수문자 포함 8자리 이상 15자 이하 입력해주세요."/> 
            </div>
            <div class="comfirmPw">
                <label for="cPw">재설정할 비밀번호 확인</label>
                <input id="cPw" type="password" name="rPwChk" placeholder="비밀번호와 동일하게 입력해주세요."/> 
                <div id="pwChkMsg"></div>
            </div>
        </div>
        <div class="btn-area">
            <button class="btn">비밀번호 재설정</button>
        </div>
        ></form>
    </div>
</body>
<script>
    inputSize()
    function inputSize(){
        $("#id").attr('size', $("#id").val().length);
    };

    $("#rPw").keyup(function(){
          var pcm = $("#cPw").val();
          if(pcm.length > 0){
            passwordChek();
          }
        });

        var passChk = false;
        function passwordChek(){
            var password = $('#rPw').val();
            console.log(password);
            var passCheck = $('#cPw').val();
            console.log(passCheck);
           if(password === passCheck){
               $('#pwChkMsg').html('비밀번호가 일치합니다.');
               $('#pwChkMsg').css("color","yellowgreen");
                passChk = true;
            }else{
            $('#pwChkMsg').html('비밀번호가 일치하지 않습니다.');
            $('#pwChkMsg').css("color","red");
                passChk = false;
           }
        }

        $('#cPw').keyup(function(){
            var password = $('#rPw').val();
            console.log(password);
            var passCheck = $('#cPw').val();
            console.log(passCheck);
           if(password === passCheck){
               $('#pwChkMsg').html('비밀번호가 일치합니다.');
                $('#pwChkMsg').css("color","yellowgreen");
                passChk = true;
            }else{
            $('#pwChkMsg').html('비밀번호가 일치하지 않습니다.');
            $('#pwChkMsg').css("color","red");
                passChk = false;
           }
        });
        var chkingPw = false;
        function chkPW(){
                var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
                var pw = $("#rPw").val();
                console.log(pw);
            if(false === reg.test(pw)) {
                // alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
                chkingPw = false;
            }else {
                console.log("통과");
                chkingPw = true;
          }
        }

        function rePw(){
            chkPW();
            if(!passChk){
                alert('비밀번호를 확인하세요.')
                return false;
            }else if(!chkingPw){
                alert('비밀번호는 숫자, 문자, 특수문자 포함 8자리 이상 15자이하 이야 합니다.');
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
</html>