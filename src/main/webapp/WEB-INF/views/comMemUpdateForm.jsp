<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 정보</title>
</head>
   
    <style>
      
        .업체정보{
            border:1px solid gainsboro;
            border-collapse: collapse;
            width: 200px;
            height: 200px;
            position: absolute;
            top:200px;
            left:100px;
            margin-top: 30px;
            margin-left: 4%;
            text-align: center;
        }
      .업체정보수정{
            border:1px solid gray;
               width: 200px;
               height: 40px;
                color: gray;
                background: white;
                border-radius: .25em;
                transition:0.3s;     
                line-height: normal;
                font-size: 15px;
        }

        .업체정보수정:hover, .업체정보수정:active {
        background-color: gainsboro;
        }
          .업체네비{
          position:absolute;
           top:200px;
            left:100px;
        height: 250px;
          width: 230px;
            height: 175px;
            margin-top: 300px;
            margin-left: 4%;
        } 
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 

    <body>
        <iframe src="mainnavi" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
        <table class="업체정보">
            <td style="font-size: 20px; padding-top: 20px;">
                <strong>서울인테리어</strong>
            </td>
            <tr>
                <td style="color: gainsboro;">
                   ─────────
                </td>
            </tr>
            <tr>
               <td style="color: gray;">
                    리뷰2개 최근계약5개
                </td>
            </tr>
            <tr>
                <td style="color: gray;">
                    종합리모델링 기타
                </td>
            </tr>
            <tr>
                <td style="font-size: 25px; ">
                    <strong>리뷰:4.5</strong>
                </td>
            </tr>
        </table>
         
        <iframe  class="업체네비" src="companynavi" scrolling="no" frameborder="0"></iframe>
		
		<form action="comMemUpdate" method="post">
        <table style="width: 700px; margin-top: 3%; margin-left: 35%;">
        
        <tr>
        <td colspan="2">
        	<strong>나의 업체정보</strong>
        </td>
        </tr>
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>ID</strong></td>
                <td><input style="width: 250px;" type="text" name="comId" value="${company.comId}" readonly></td>  
            </tr>
            
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>PW</strong></td>
                <td><input style="width: 250px;" type="password" name="pw" id="pw" value=""></td>  
            </tr>
            
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>PW확인</strong></td>
                <td><input style="width: 250px;" type="password" id="pwchk" value=""></td>  
            </tr>
         	 <tr> 
                <td colspan="2">
                	<div id="pwChkMsg"></div>
                </td> 
            </tr>
        
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>사업자 번호</strong></td>
                <td><input style="width: 250px;" type="text" value="${company.license}" readonly></td>  
            </tr>
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>업체명</strong></td>
                <td><input style="width: 250px;" type="text" name="comName" value="${company.comName}"></td>  
            </tr>
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>PHONE</strong></td>
                <td><input style="width: 250px;" type="text" name="phone" value="${company.phone}"></td>  
            </tr>
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>주소</strong></td>
                <td><input style="width: 250px;" type="text" name="addr" value="${company.addr}"></td>  
            </tr>
 			<tr>
 				<td colspan="2" style="width: 100px; text-align: center; height: 50px;">
 					<input id="update" type="button" value="수정">
 				</td>
 			</tr>    
        </table>
        </form>

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
      
      $("#update").click(function(){
    	var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    	var pw = $("#pw").val();
    	console.log(pw);
    	if(false === reg.test(pw)) {
    	    alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
    	}else if(passChk==false){
    		alert("비밀번호를 다시 확인해주세요");
      	}else{
      		$("form").submit();      		
      	}
      });
      
      
        </script>
    </html>