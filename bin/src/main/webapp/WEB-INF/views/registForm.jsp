<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
	 <title>회원가입 - 땃쥐</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="resources/css/memberCSS/registForm.css">
    <style>
    </style>
</head>
<body>
    <div class="form-area">
        <div class="title">
            <h3>회원가입</h3>
        </div>
        <div class="input-area">
            <input  id="id" type="text" name="id" placeholder="영문 5자 이상" style="ime-mode:disabled"/>
            <label for="id">아이디</label>
            <div class="idChk">
                <button>중복확인</button>
            </div>
        </div>
        <div class="input-area">
            <input  id="pw" type="password" name="pw" placeholder="숫자 영문 특주문자 포함 8자리이상"/>
            <label for="pw">비밀번호</label>
        </div>
        <div class="input-area">
            <input  id="pwchk" type="password" name="pwchk" placeholder="비밀번호를 동일하게 입력하세요"/>
            <label for="pwchk">비밀번호 확인</label>
            <div id="pwChkMsg"></div>
        </div>
        <div class="input-area">
            <input  id="name" type="text" name="name" placeholder="이름 입력"  oninput="this.value = this.value.replace(/[^a-z.]/g, '')"/>
            <label for="name">이름</label>
        </div>
        <div class="input-area">
            <input  id="gender" type="radio" name="gender" value="남" />남
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input  id="gender" type="radio" name="gender" value="여" />여
            <label for="gender">성별</label>
        </div>
        <div class="input-area">
            <input id="phone" type="text"  maxlength="11"  name="phone"  
            placeholder="( - ) 없이 번호입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '')">
            <label for="phone">전화번호</label>
        </div>
        <div class="input-area">
            <input  id="email" type="email" name="email" placeholder="이메일 입력"/>
            <label for="email">이메일</label>
        </div>
        <div class="join">
            <button id="joinBtn">회원가입</button>
        </div>
    </div>
    </body>
    <script>
       
        // var idChk = false;
        // $('.idChk').click(function(){
        //     var idLeng = $('#id').val().length;
        //     console.log(idLeng);
        //     if(idLeng >= 5){
        //         idChk = true;
        //         console.log(idChk);
        //     }else{
        //         idChk = false;
        //         console.log(idChk);
        //         alert('5자이상 입력하세요.');
        //     }
        // });
       
        
        $("#pw").keyup(function(){
          var pcm = $("#pwchk").val();
          if(pcm.length > 0){
            passwordChek();
          }
        });

        var passChk = false;
        function passwordChek(){
            var password = $('#pw').val();
            console.log(password);
            var passCheck = $('#pwchk').val();
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

        $('#pwchk').keyup(function(){
            var password = $('#pw').val();
            console.log(password);
            var passCheck = $('#pwchk').val();
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
        var enId = false;
        function  engId(idValue){
            var check_num = /[0-9]/;
            var check_eng = /[a-zA-Z]/;
            var check_spc = /[~!@#$%^&*()_+|<>?:{}]/;
            var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
            if( check_eng.test(idValue) && !check_kor.test(idValue) && !check_num.test(idValue) && !check_spc.test(idValue)){
                enId = true;
            }else{
                enId = false;
                alert('영문으로만 가능합니다.');
            }
        }


        var chkingId;
        var overChk = true;
        $('.idChk').click(function(){
            var idLeng = $("#id").val().length;
            engId($("#id").val());
            if(idLeng < 5){
                alert('5자 이상 입력하세요.');
            }else{
                $.ajax({
                    type:'get'
                    ,url:'overlay'
                    ,data:{"id":$("#id").val()}
                    ,dataType:'json'
                    ,success:function(data){
                        console.log(data);
                        chkingId = $("#id").val();
                        console.log(chkingId);
                        if(data.success){
                            alert('사용 가능한 아이디 입니다.');
                        }else{
                            alert('이미 사용중인 아이디 입니다.');
                        }
                    }
                })
            }
        })

        var chkingPw = false;
        function chkPW(){
        var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
        var pw = $("#pw").val();
        console.log(pw);
        if(false === reg.test(pw)) {
        // alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
        chkingPw = false;
        }else {
        console.log("통과");
        chkingPw = true;
          }
        }
        emailChk = false;
        $('#email').focusout(()=>{
        if($('#email').val().indexOf('@')<0 ||$('#email').val().indexOf('.')<0 ){
            // alert('이메일형식을 확인해주세요');
            // $('#email').focus();
            emailChk = false;
        }else{
            emailChk = true;
        }
    });
        $('#joinBtn').click(function(){
            chkPW();
            var $id =$("#id");
            var $pw =$("#pw");
            var $name =$("#name");
            var $gender = $('input[type="radio"]:checked') ;
            var $phone =$('#phone');
            var $email = $('#email');

            if(overChk){
                if($id.val() ==''){
                    alert('아이디를 입력해 주세요.');
                    $id.focus();
                // }else if(chkingId != $id){
                //     alert('중복 확인을 해주세요.')
                }else if(passChk != true){
                    alert('비밀번호를 확인해 주세요');
                    $pw.focus();
                }else if(chkingPw == false){
                    alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
                    $pw.focus();
                }else if(passChk == false){
                    alert('비밀번호를 확인해 주세요.')
                    $pw.focus();
                }else if($name.val()==''){
                    alert('이름을 입력해 주세요.');
                    $name.focus();
                }else if($gender.val() == null){
                    alert('성별을 입력해 주세요.');
                    $gender.focus();
                }else if($phone.val()==''){
                    alert('휴대전화 번호를 입력해 주세요.')
                }else if($email.val() == ''){
                    alert('이메일을 입력해 주세요.');
                    $email.focus();
                }else if(emailChk != true){
                    alert('올바른 이메일 형식이 아닙니다.');
                    $("#email").focus();
                }else{

                    console.log('서버전송');

                    var params ={};
                    params.id = $id.val();
                    params.pw = $pw.val();
                    params.name =$name.val();
                    params.phone =$phone.val();
                    params.gender = $gender.val();
                    params.email = $email.val();
					console.log(params.phone);
                    $.ajax({
                        type:'post'
                        ,url:'join'
                        ,data:params
                        ,dataType:'json'
                        ,success:function(data){
                            console.log(data);
                            if(data.success == true){
                                alert('회원 가입이 완료되었습니다.');
                                location.href="login";
                            }else{
                                alert('잠시 후 다시 시도해 주세요.');
                            }

                            },error:function(e){
                        }
                    })
                }
            }
            });
    
    	var msg = "${msg}";
    	if(msg != ""){
    		alert(msg);
    	}
    </script>
</html>