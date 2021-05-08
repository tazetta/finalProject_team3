
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀팁 작성하기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
#button {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(230, 226, 224);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 2px inset;
	border:none;
	border-radius: 10px;
}

#button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;
}

#button2 {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(255, 210, 180);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 2px inset;
	border:none;
	border-radius: 10px;
}

#button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 40px inset;
}
span:hover {
        color: black;
    }

    #btn:hover {
        color: rgb(143, 201, 248);
        box-shadow: rgb(143, 201, 248) 0 0px 0px 40px inset;
    }
input.button{
	border : 1px rgba(30, 22, 54, 0.6);
 	border-radius: 10px;
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(230, 226, 224);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 2px inset;
	
}
input.button:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;

}

</style>
</head>
	
	
<body>
 
    
    <div class="container" style="text-align: center; padding-top: 10px;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248); "
            placeholder="검색어를 입력해주세요.">
        &nbsp;
        <button id="btn"
            style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
        <a href="" style="font-size:small; float: right; color: gray; padding-left: 5px;  font-weight: bold;">|<span
                style="padding-left: 5px; font-weight: bold; ">고객센터</span></a>
        <a href="" style="font-size:small; float: right; color: gray; padding-left: 5px; font-weight: bold;">|<span
                style="padding-left: 5px;  font-weight: bold;">회원가입</span></a>
        <a href="" style="font-size:small; float: right; color: gray;  font-weight: bold; "><span>로그인</span></a>
        <br />
    </div>
    <br />
	<form action="boardWrite" method="POST">
    <div class="container"  style="height:200px; background-color: rgb(184, 185, 190); text-align:center;">
  
        <h1 style="padding-top: 50px; font-weight: bold;">꿀팁 게시판</h1>
        <br/>
        <h>글 작성하기</h>
    </div>
    <br/>
    <div class="container">
        <table class="table">
            <tr>
                <td><input type="text" class="form-control" placeholder="제목을 입력해주세요"id="subject" name="subject" maxlength="40"></td>
            </tr>
            <tr>
                <td><textarea id="content" name="content" type="text" class="form-control" placeholder="내용을 10000자 이내로 입력해주세요" name="contentDetail" maxlength="1024" style="height: 400px;"></textarea></td>
            </tr>
        </table>
        <div class="container">
            <!--  a href="#" class="button" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; ">첨부파일</a>-->
            <input id="button" class="button" style="max-width: 100; margin: 10px ;  padding: 10px 10px; font-weight: bold;" type="button" value="파일업로드" onclick="fileUp()" />
            <div class="row" style="float: right;">
                <button id="button2" value="내맘쏙에저장"name="button2"class="button2" style="max-width: 75; margin: 10px ; padding: 10px 10px; font-weight: bold; text-align:center;">저장</button>
            </div>
           
            <button id="button"  class="button"  style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; float: right;" onclick="location.href='tipMain'" >취소</button>
        </div>

    </div> 
   </form>         
    </body>
    <script>
    var msg = "${msg}";
    if(msg != ""){
    	alert(msg);
    }
    
    $("#button2").click(function(){
    	if($("#subject").val()==""||$("#content").val()==""){
    		alert("제목, 내용을 입력해주세요.");
    		return false;
    	}else{
    		alert("저장되었쥐");
    		$("form").submit();
    	}
    	
    });
   
    
    </script>
</html>