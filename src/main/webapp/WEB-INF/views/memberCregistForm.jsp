<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style></style>
		<link rel="stylesheet" href="resources/css/memberCSS/cRegistForm.css/">
		 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
            <input  id="company_name" type="text" name="name" placeholder="업체명 입력"/>
            <label for="company_name">업체명</label>
        </div>
        <div class="input-area">
            <input  id="business_number" type="text" name="business_number" placeholder="사업자 번호"/>
            <label for="gender">사업자 번호</label>
            <div class="cIdChk">
                <button>중복확인</button>
            </div>
            <div class="bn_lookUp">
                <button>조회</button>
            </div>
        </div>
        <div class="input-area">
            <input id="phone" type="text"  maxlength="11"  name="phone"  
            placeholder="( - ) 없이 번호입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '')">
            <label for="phone">전화번호</label>
        </div>
        <div class="input-area">
            <input  id="sample6_postcode" type="email" name="email" placeholder="주소를 조회해주세요."/>
            <input  id="sample6_address" type="email" name="email" placeholder="주소 입력"/>
            <input  id="sample6_detailAddress" type="email" name="email" placeholder="상세주소 입력"/>
            <input  id="sample6_extraAddress" type="email" name="email" placeholder="참고사항 입력"/>
            <label for="email">주소</label>
            <div class="addr_lookUp">
                <button onclick="sample6_execDaumPostcode()">조회</button>
            </div>
        </div>
        <div class="join">
            <button id="joinBtn">회원가입</button>
        </div>
    </div>
    </body>
    <script>
        
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
             if(!check_kor.test(idValue) && !check_spc.test(idValue)){
            	enId = true;
            }else{
                enId = false;
            }
        }


        var chkingId;
        var overChk = true;
        $('.idChk').click(function(){
            var idLeng = $("#id").val().length;
            engId($("#id").val());
            if(idLeng < 5 || enId == false){
                alert('영문 또는 숫자로 5자 이상 입력하세요.');
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
                 }else if(chkingId != $id.val()){
                     alert('중복 확인을 해주세요.')
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
                                location.href="membership";
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
        new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    </script>
</html>