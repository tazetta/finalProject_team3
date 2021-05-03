<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

   <style>
        body{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
   
}
.title{
    color: #166cea;
   justify-content: flex-start;
   margin-left: 50px;
   margin-bottom: 50px;
}
.input-area{
    width: 550px;
    position: relative;
    padding: 10px;
    font-size: 13px;
    text-align: center;
}
.input-area input{
    height: 20px;
    padding: 3px;
    border: 2px solid #166eca ;
    border-radius: 6px;
}
.input-area label{
    position: absolute;
    left: 5px;
    width: 170px;
    padding-top: 3px;
    text-align: center;
   
}
.cIdChk , .bn_lookUp , .addr_lookUp{
    position: absolute;
    left: 380px;
    top: 6px;
}
.licenseChk{
    position: absolute;
    left: 380px;
    top: 6px;
}
.licenseChk button , .cIdChk button , .bn_lookUp button , .addr_lookUp button{
    background-color: #166cea;
    color: white;
    border: none;
    padding: 8px 8px;
    opacity: 0.9;
}
.licenseChk button:hover , .cIdChk button:hover , .bn_lookUp button:hover , .addr_lookUp button:hover{
    cursor: pointer;
    opacity: 1;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 3px 10px 0 rgba(0,0,0,0.19);
}
.input-area input::placeholder{
    font-size : 3px;
}
.join{
    text-align: center;
    
}
.join button{
    background-color: #166cea;
    color: white;
    border: none;
    padding: 8px 8px;
    text-align: center;
    width: 60%;
    margin-top: 20px;
    font-size: 15px;
    opacity: 0.9;
}
.join button:hover{
    cursor: pointer;
    opacity: 1;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 3px 10px 0 rgba(0,0,0,0.19);
}
#gender{
    width: 12px;
}
#pwChkMsg{
    display: inline;
    position: absolute;
    margin-left: 10px;
    margin-top: 5px;
}
#cNameChk{
    display: inline;
    position: absolute;
    margin-left: 10px;
    margin-top: 5px;
}
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;             
    margin: 0;         
}
#sample6_postcode{
    margin-bottom: 100px;
}
#sample6_address{
    position: absolute;
    left: 195px;
    top: 50px;
    margin-bottom: 50px;
    width: 300px;
}
#sample6_detailAddress{
    position: absolute;
    left: 195px;
    top: 90px;
    margin-bottom: 50px;
    width: 205px;
}
#sample6_extraAddress{
    position: absolute;
    left: 415px;
    top: 90px;
    margin-bottom: 50px;
    width: 80px;
}
    </style>
</head>
<body>
    <div class="form-area">
        <div class="title">
            <h3>회원가입</h3>
        </div>
        <div class="input-area">
            <input  id="id" type="text" name="id" placeholder="영문 5자 이상" style="ime-mode:disabled" maxlength="15"/>
            <label for="id">아이디</label>
            <div class="cIdChk">
                <button>중복확인</button>
            </div>
        </div>
        <div class="input-area">
            <input  id="pw" type="password" name="pw" placeholder="숫자 영문 특주문자 포함 8자리이상" maxlength="15"/>
            <label for="pw">비밀번호</label>
        </div>
        <div class="input-area">
            <input  id="pwchk" type="password" name="pwchk" placeholder="비밀번호를 동일하게 입력하세요" maxlength="15"/>
            <label for="pwchk">비밀번호 확인</label>
            <div id="pwChkMsg"></div>
        </div>
        <div class="input-area">
            <input  id="company_name" type="text" name="name" placeholder="업체명 입력" maxlength="15"/>
            <label for="company_name">업체명</label>
            <div id="cNameChk"></div>
        </div>
        <div class="input-area">
            <input  id="business_number" type="text" name="business_number" placeholder="사업자 번호 ( - ) 없이" 
            maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, '')"/>
            <label for="business_number">사업자 번호</label>
            <div class="licenseChk">
                <button onclick="licen_numberChk()">중복확인</button>
            </div>
        </div>
        <div class="input-area">
            <input id="phone" type="text"  maxlength="11"  name="phone"  
            placeholder="전화번호 입력 ( - ) 없이" oninput="this.value = this.value.replace(/[^0-9.]/g, '')">
            <label for="phone">전화번호</label>
        </div>
        <div class="input-area">
            <input  id="sample6_postcode" type="email" name="email" placeholder="주소를 조회해주세요." readonly/>
            <input  id="sample6_address" type="email" name="email" placeholder="주소 입력" readonly/>
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
        $('.cIdChk').click(function(){
            var idLeng = $("#id").val().length;
            engId($("#id").val());
            if(idLeng < 5 || enId == false){
                alert('영문 또는 숫자로 5자 이상 15자 이하로 입력하세요.');
            }else{
                $.ajax({
                    type:'get'
                    ,url:'cOverlay'
                    ,data:{"id":$("#id").val()}
                    ,dataType:'json'
                    ,success:function(data){
                        console.log(data);
                        chkingId = $("#id").val();
                        console.log(chkingId);
                        overChk = true;
                        if(data.success){
                            alert('사용 가능한 아이디 입니다.');
                        }else{
                            alert('이미 사용중인 아이디 입니다.');
                        }
                    }
                })
            }
        })
        var licenseChk = false;
        var licenseNum;
		function licen_numberChk(){
	    	var licen_number = $("#business_number");	
	    	console.log(licen_number.val().length);
				 if(licen_number.val().length < 10){
					alert('숫자 10자리 입력해주세요.');
				}else{
					$.ajax({
						type:'get'
						,url:'licenChk'
						,data:{"license":$("#business_number").val()}
						,dataType:'json'
						,success:function(data){
							console.log(data);
							if(data.success){
								alert('사용 가능한 사업자번호 입니다.');
								licenseChk = true;
								licenseNum = $("#business_number").val();
							}else{
								alert('이미 사용중인 사업자번호 입니다.')
								licenseChk = false;
							}
						}
					})
				}
			
	    	}
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

    var cNameChk = false;
    $("#company_name").focusout(function(){
    	console.log('업체명 검사시작');
        var $cName = $("#company_name");
        var params ={};
        params.cName = $cName.val();
        if($cName.val() != ''){
            $.ajax({
                         type:'get'
                        ,url:'company_nameOverChk'
                        ,data:params
                        ,dataType:'json'
                        ,success:function(data){
                            console.log(data);
                            if(data.success){
                                $("#cNameChk").html('사용 가능한 업체명입니다.');
                                $("#cNameChk").css("color","yellowgreen");
                                cNameChk = true;
                            }else{
                                $("#cNameChk").html('이미 있는 업체명입니다.');
                                $("#cNameChk").css("color","red");
                                cNameChk = false;
                            }
                            },error:function(e){
                            }
                        })
                    }
     })
        $('#joinBtn').click(function(){
            chkPW();
            var $id =$("#id");
            var $pw =$("#pw");
            var $name =$("#name");
            var $phone =$('#phone');
            var $company_name = $("#company_name");
            var $business_number = $("#business_number");
            var $addr = $("#sample6_postcode");
            var $addr2 = $("#sample6_address");
            var $addr3 = $("#sample6_detailAddress");
            var $addr4 = $("#sample6_extraAddress");
            console.log($id.val());
            console.log($addr.val());
            console.log($addr2.val());
            console.log($addr3.val());
            console.log($addr4.val());
            if(overChk){
                if($id.val() ==''){
                    alert('아이디를 입력해 주세요.');
                    $id.focus();
                 }else if(chkingId != $id.val()){
                     alert('아이디 중복 확인을 해주세요.')
                }else if(passChk != true){
                    alert('비밀번호를 확인해 주세요');
                    $pw.focus();
                }else if(chkingPw == false){
                    alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
                    $pw.focus();
                }else if(passChk == false){
                    alert('비밀번호를 확인해 주세요.')
                    $pw.focus();
                }else if($company_name.val()==''){
                    alert('업체명 입력해 주세요.');
                    $company_name.focus();
                }else if(!cNameChk){
                    alert('사용할수 없는 업체명입니다.');
                    $company_name.focus();
                }else if($business_number.val()==''){
                    alert('사업자번호를  입력해 주세요.');
                    $business_number.focus();
                }else if(licenseNum != $business_number.val()){
                	alert('사업자번호 중복확인을 해주세요.')	
                	$business_number.focus();
                }else if($phone.val() == ''){
                	alert('전화번호를  입력하세요.');
             		$phone.focus();
                }else if($addr.val() == ''){
                    alert('주소를 조회해 주세요.');
                }else if($addr3.val() == ''){    
                    alert('상세주소를 입력해주세요.');
                }else{
                    console.log('서버전송');

                    var params ={};
                    params.id = $id.val();
                    params.pw = $pw.val();
                    params.company_name =$company_name.val();
                    params.phone =$phone.val();
                    params.business_number = $business_number.val();
                    params.addr = $addr.val() +$addr2.val() + $addr3.val() + $addr4.val();
		
                    $.ajax({
                        type:'post'
                        ,url:'cJoin'
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
    
    	// var msg = "${msg}";
    	// if(msg != ""){
    	// 	alert(msg);
    	// }
      //     new daum.Postcode({
    //     oncomplete: function(data) {
    //         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
    //         // 예제를 참고하여 다양한 활용법을 확인해 보세요.
    //     }
    // }).open();

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