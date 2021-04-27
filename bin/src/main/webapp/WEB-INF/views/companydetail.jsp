<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 정보</title>
</head>
   
    <style>
        #hidden4{
            border: 1px solid gray; 
            width: 80px;
               height: 25px;
                color:black;
                background: white;
                border-radius: .25em;
                transition:0.3s;     
                line-height: normal;
                font-size: 15px;
        }
      
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

        <table style="width: 700px; margin-top: 3%; margin-left: 35%;">
        </tr>
        <td></td>
        <td><strong>나의 업체정보</strong></td>
        </tr>
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>ID</strong></td>
                <td><input style="width: 250px;" type="text" id="subject" value="업체아이디란" readonly></td>  
            </tr>
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>사업자 번호</strong></td>
                <td><input style="width: 250px;" type="text" id="subject" value="사업자번호입니다." readonly></td>  
            </tr>
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>업체명</strong></td>
                <td><input style="width: 250px;" type="text" id="subject" value="서울인테리어" readonly></td>  
            </tr>
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>PHONE</strong></td>
                <td><input style="width: 250px;" type="text" id="subject" value="010-0000-0000" readonly></td>  
            </tr>
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>주소</strong></td>
                <td><input style="width: 250px;" type="text" id="subject" value="서울시" readonly></td>  
            </tr>
            <tr>
                <td style="width: 100px; text-align: center; height: 30px;"></td>
                <td id="write">
                    <button onclick="comwrite()" class="업체정보수정">업체정보 수정하기</button>
            </td>
            <td id="hidden1"style="display:none" >비밀번호 입력해주세요.</td>
            <tr>
            <td id="hidden2" style="width: 100px; text-align: center; height: 30px; display:none;" ><strong>비밀번호</strong></td>
            <td ><input id="hidden3" type="text" style=" width: 250px; display: none;"></td><td><input id="hidden4" type="submit" value="확인" style="margin-left: 2%; display:none;float: right; margin-right: 280px;"> </td>
        </tr>
     
        </table>

    </body>
    <script>
       function comwrite(){
       if(hidden1.style.display=="none"){
            hidden1.style.display="block";
            hidden2.style.display="block";
            hidden3.style.display="block";
            hidden4.style.display="block";
            write.style.display="none";
        }
    }
        </script>
    </html>