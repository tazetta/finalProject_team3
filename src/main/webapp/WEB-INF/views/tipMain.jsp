
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀팁</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</head>
<style>
a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 2px inset;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 40px inset;
}
a {
	display: block;
	text-decoration: none;
	border-radius: 4px;
    
	
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
    <div class="container"  style="height:200px; background-color: rgb(184, 185, 190); text-align:center;">
        <h2 style="padding-top: 50px; font-weight: bold;">꿀팁 게시판</h2>
        <div class="container" style="text-align: center; padding-top: 50px;">
            <select name="idx" id="idx"style="border-radius: 5px; border: 2px solid gray; ">
                <option value="">제목</option>
                <option value="1">내용</option>
                <option value="2">작성자</option>
            </select>
            <input type="text" size="75" style="border-radius: 5px; border: 2px solid gray; " placeholder="검색어를 입력해주세요."> 
            <button id="btn" style="border-radius: 5px; background-color: rgb(255, 210, 180); border: 1px solid rgb(255, 210, 180); font-weight: bold; color: gray;">검색</button>
        </div>                          
    </div>
    <br/>
    <div class="container" style="font-size: large; font-weight: bold; padding-left: 40px;">
        <th>꿀팁 BEST3</th>
        <table class="table">
            <td>부동산체크</td>
            <td>부동산체크</td>
            <td>부동산체크</td>
        </table>
    </div>
    <div class="container">
        <div class="container" style="display: flex; justify-content: space-between;">
            <a href="#" class="button2" style="max-width: 90; margin: 10px ; padding: 10px 20px; font-weight: bold; ">글쓰기</a>
            <select name="idx" id="idx" style="border-radius: 5px; margin: 10px ; height: 35; border: 2px solid gray; float: right; background-color: rgb(226, 220, 220);">
                <option value="">제목</option>
                <option value="1">내용</option>
                <option value="2">작성자</option>
            </select>
        </div>
        <br/>
        <br/>
        <div class="container">
            <table class="table">
                <tr>
                    <th style="border-color: white;">새로운글</th>
                </tr>
                <td>중수 아이디 날짜 조회 댓글 추천</td>
                <tr>
                    <th style="border-color: white;">새로운글</th>
                </tr>
                <td>중수 아이디 날짜 조회 댓글 추천</td>
               

            </table>
        </div>
         

    </div>
    <br/><br/>
    <br/>
    <div class="container">
        <div class="row">
            <div class="col">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#" style="color: gray;">이전</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="color: rgb(44, 43, 43); font-weight: bold;">1</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="color: rgb(44, 43, 43); font-weight: bold;">2</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="color: rgb(44, 43, 43); font-weight: bold;">3</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="color: rgb(44, 43, 43); font-weight: bold;">4</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="color: rgb(44, 43, 43); font-weight: bold;">5</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="color: gray;">다음</a></li>
                </ul>
            </div>
               
        </div>
    </div>
    
        </body>
        </html>
                