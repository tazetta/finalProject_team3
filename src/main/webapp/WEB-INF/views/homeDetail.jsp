
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<head>
<meta charset="UTF-8">
<title>우리집 자랑 게시물</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</head>
<style>

a {
	text-decoration: none;
    border-radius: 10px;
}
a.button {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(230, 226, 224);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 2px inset;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(255, 210, 180);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 40px inset;
}

</style>
</head>
	
	
<body>
 
    
    <div class="container" style="text-align: center; padding-top: 10px;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248); " placeholder="검색어를 입력해주세요.">
        &nbsp;
        <button id="btn" style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
        <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;">|고객센터</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;" >|회원가입</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;">로그인</a></span>
    </div>
   <br/>

    <div class="container"  style="height:180px; background-color:rgb(170, 187, 247); text-align:center;">
  
        <h1 style="padding-top: 50px; font-weight: bold; ">제목</h1>
    
        <div>
            <a href="#" class="button" style="max-width: 75; margin-right: 10px; margin-left: 20px; padding: 10px 20px; font-weight: bold; float: right;">수정</a>
           
            <a href="#" class="button" style="max-width: 75; padding: 10px 20px; font-weight: bold; float: right;">삭제</a>
        </div>
    </div>
    <div class="container" style="float: right; width: 600px;">
        <span>등급</span>&nbsp;<span>유저아이디</span> <span>2021-04-19</span><span>조회수 5</span> 
    </div>
    <br/>
    <br/>
       
    <div class="container">
        <table class="table">
            <div class="container" >
                <table class="table" style="width: 300px;" >
                    <thead>
                        <th style="border:none;">주거형태</th>
                        <th style="border:none;">평수</th>
                        <th style="border:none;">예산</th>
                    </thead>
                    <thead>
                        <td style="border:none;">받기</td>
                        <td style="border:none;">받기</td>
                        <td style="border:none;">받기</td>
                    </thead>
                </table>
                <table>
                    내용물을쓰세요
                </table>
                <br/>
                <table class="table">
                    <thead>
                        <th style="border:none;">아이템:</th>
                        <th style="border:none;"></th>
                    </thead>
                </table>
            </div>
        </table>
                    
        <div class="container">
            <a href="#" class="button" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; float: right;">목록</a>
            <a href="#" class="button" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; float: right;">신고</a>
        </div>
        <br/>
        <br/> 
        <br/>
        <br/>
        <div class="container">
            
            
           <div>
               <table class="table">
                <td>
               <span style="font-size: medium; font-weight: bold; ">댓글</span>
               <div class="wrap" style="float: right; margin-right: 100px;">
                
                <a href="#" class="button3" style="font-weight: bold; padding: 8px 10px;"><i class="bi bi-hand-thumbs-up">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="gray" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
                    <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                  </svg></i></a>
                
                <a href="#" class="button4"  style="font-weight: bold;padding: 8px 10px; "><i class="bi bi-bookmark"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="gray" class="bi bi-bookmark" viewBox="0 0 16 16">
                    <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                  </svg></i></a>
            </div>
            </td>
                </table>
            </div>
            <b>user</b> : <input type="text" size="75" placeholder="댓글을 입력해주세요."> 
            <a href="#" class="button2" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold;">저장</a>
        </div>  
   </body>
</html>
          
   