<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>회원정보 수정</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>


table, td {
	border-collapse: collapse;
	padding: 10px;
	width: 400px;
	font-family: Arial, Helvetica, sans-serif;
}




.flexBox {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.inputs {
	width: 130px;
	height: 35px;
	border: 2px solid lightslategrey;
	line-height: 100%;
	font-size: 16px;
}

.headDESC {
	font-size: 25px;
	font-weight: 600;
	color: tomato;
	margin-left: 10px;
	margin-bottom: 0px;
}

input[type="button"], input[type="submit"] {
	background-color: #acd3fb;
	cursor: pointer;
	color: white;
	font-weight: bold;
    left: 180px;
}





select:hover {
	cursor: pointer;
}

.pagingBtn {
	text-decoration: none;
	color: black;
	font-weight: 600;
	background-color: lightgray;
	margin: 1px 2px;
	margin-top: 0px;
	padding: 3px;
	border: 1px white;
}

.sideBar {
	float: left;
}

th{
      border:1px solid gray;
      border-collapse: collapse;
      text-align: center;
	background-color: dodgerblue;
            }


#password2ck{
    position: absolute;
    visibility: hidden;
    color: red;
}




</style>
</head>
<body>
	<iframe src="mainnavi.html" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
	<div class="flexBox" >
		<div style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
			<div class="sideBar" style="margin-right: 15px;">
				<iframe class="마이프로필네비" src="mynavi.html" scrolling="no" frameborder="0"
				style="height: 650px; float: left; width:250px;" ></iframe>
			</div>
			<div class="sideBar">
				<form>
					<table>
                        <div id="main">
                            <div class="update_name">
                                <h1>회원정보 수정</h1>
                            </div>
                            <div class="container">
                                <form action="userinfoupdate" method="post">
                                    <input type="hidden" name="userId" value="${sessionScope.id}"/>
                          
                                    <table class="filebox">
                                        <tr>
                                            <td>ID</td>
                                       <td><input type="text" name="userId" value="${info.id}"readonly></td>
                                        </tr>
                                        <tr>
                                            <td>PW</td>
                                        <td><input type="password" name="userPw" id="newPw" maxlength="10" placeholder="비밀번호 "></td>
                                        </tr>
                                        <tr>
                                            <td>PW재확인</td>
                                        <td>
                                            <input type="password" name="userPw" id="pwConfirm" maxlength="10" placeholder="비밀번호 확인."/>
                                            <br/>
                                            <span id="passChk"></span>
                                        </td>
                                        </tr>
                                        <tr>
                                        
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>NAME</td>
                                        <td><input type="text" name="userName" value="${info.name}"></td>
                                        </tr>
                                        <tr>
                                            <td>PHONE</td>
                                        <td><input type="text" name="phone" value="${info.phone}"></td>
                                        </tr>
                                        <tr>
                                            <td>EMAIL</td>
                                        <td><input type="email" name="email" value="${info.email}"></td>
                                        </tr>
                                        <tr>
                                        <td>
                                           <input type="button" id="btn" value="회원정보 저장"/>
                                           <input type="button" value="취소"/>
                                           </td>
                                         </tr>
                                    </table>
                                  
                                </form>
                            </div>
                            
                    
                        </div>
					</table>
				</form>
			</div>
			
		</div>
	</div>
</body>
<script>
    var msg="${msg}";
if(msg!=""){
	alert(msg);
}


var $newPw = $("#newPw");
var $pwConfirm = $("#pwConfirm");
var pwChk = false;

//pw에 한글 입력안되게(영어 숫자 특수문자만)
$(document).ready(function(){
	  $("input[name=newPw]").keyup(function(event){ 
	   if (!(event.keyCode >=37 && event.keyCode<=40)) {
	    var inputVal = $(this).val();
	    $(this).val(inputVal.replace(/[^a-z0-9~!@#$%^&*()_.,+<>?:{}]/gi,''));
	   }
	  });
	});

	//pw가 5자 이상인가?
$('#newPw').focusout(function(){
    if($(this).val()!==$('#pwConfirm').val()){
        $('#passChk').html('비밀번호가 일치하지 않습니다.');
        $('#passChk').css('color','red');
        pwChk = false;
    }else{
        $('#passChk').html('비밀번호가 일치합니다.');
        $('#passChk').css('color','green');
        pwChk = true;
    }
}); 
//pw와 pw확인이 값이 일치하는가?
$('#pwConfirm').keyup(function(){
    if($(this).val()!==$('#newPw').val()){
        $('#passChk').html('비밀번호가 일치하지 않습니다.');
        $('#passChk').css('color','red');
        pwChk = false;
    }else{
        $('#passChk').html('비밀번호가 일치합니다.');
        $('#passChk').css('color','green');
        pwChk = true;
    }
});

$('#btn').click(function(){
	if($newPw.val()==""||$pwConfirm==""){//비밀번호 또는 비밀번호확인이 공백일때
		console.log($newPw.val());
		alert("비밀번호를 입력해주세요.")
		$newPw.focus();
	}else if($newPw.val().length<5){
		alert("비밀번호는 5자 이상 입력해주세요!!");
		$newPw.focus();
	}else if(pwChk==false){
		alert("비밀번호가 일치하지 않습니다.");
		$newPw.focus();
	}else{
		console.log("비밀번호가 수정되었습니다.");
		$('form').submit();
	}
});



</script>
</html>
