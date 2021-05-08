
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A게시물</title>
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
	
}

#button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;
}

#button2 {
	border: 1px rgba(30, 22, 54, 0.6);
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(255, 210, 180);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 2px inset;
}

#button2:hover {
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
  
        <h1 style="padding-top: 50px; font-weight: bold;">질문 및 답변</h1>
        <br/>
       <span class="grade">${writerGrade}</span>&nbsp;&nbsp;${dto.id}&nbsp;&nbsp;날짜${dto.reg_date}&nbsp;&nbsp;조회수${dto.bhit}&nbsp;&nbsp;답변${dto.commIdx}
        <div>
           <c:if test="${ dto.id == sessionScope.loginId }">
            <button class="btn" id="button" onclick="location.href='/boardDel/${dto.boardIdx}'"style=" border-radius: 10px; max-width: 75; margin-right: 10px; margin-left: 20px; padding: 10px 20px; font-weight: bold; float: right;">수정</button>
            <button class="btn" id="button" onclick="location.href='/boardUpdateForm/${dto.boardIdx}'" style=" border-radius: 10px; max-width: 75; padding: 10px 20px; font-weight: bold; float: right;">삭제</button>
            </c:if>
        </div>
       
    </div>
    <br/>
    <br/>
    <div class="container">
        <table class="table">
           
            <tbody>
                <span style="font-size: x-large; font-weight: bold; color:rgb(131, 130, 130) ;"><span style="color: rgb(235, 179, 76);">Q.</span>질문</span>
               
                <tr>
                    <td>${dto.content}</td>
                </tr>
             </tbody>
                   
        </table>
        <div class="container">
            <button class="btn" id="button" onclick="location.href='helpMain'" style="border-radius: 10px; max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; float: right;">목록</button>
        </div>
        <br/>
        <br/> 
        <br/>
        <span style="font-size: x-large; font-weight: bold; color:rgb(131, 130, 130) ;"><span style="color: rgb(235, 179, 76);">A.</span>답변</span>
        <br/>
        <br/>
        <b>댓글<span id="listSize"></span>개</b>
            <tr>
                <td>
                    <b id="loginId">${sessionScope.loginId}</b> : <input type="text" name="comment" id="comment" size="75" placeholder="댓글을 입력해주세요."> 
                    <button class="button2" id="button2" style="border-radius: 10px;  max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold;">저장</button>
                </td>
            </tr>
        <c:if test="${listSize = '0' }">
        <div>현재 댓글이 없습니다.</div>
		</c:if>        
        <div class="container" id="commentListDiv">
        </div>  
        </body>
        <script>

    	var msg = "${msg}";
    	if (msg != "") {
    		alert(msg);
    	}
    	
    	boardCommentList(); //댓글리스트 호출
    	/* 댓글 등록 */
    	$("#button2").click(function(){
    		var comment = $("#comment").val();
    		var loginId = "${sessionScope.loginId }";
    		var gpIdx ="${dto.boardIdx}";
    		console.log("loginID:"+loginId+"/comment:"+comment);
    		if(comment!=''){
    			
    			var reqUrl =' ./qnadetail'; 
    			$.ajax({
    				url : reqUrl,
    				type : "get",
    				data : {"boardIdx":boardIdx,"comment":comment, "loginId":loginId},
    				dataType : "JSON",
    				success : function(data) {
    					console.log("success: ", data);
    					alert(data.msg);
    					$("#comment").val('');
    					boardCommentList();// 작성후 댓글 리스트 요청

    				},
    				error : function(error) {
    					console.log("error:", error);
    				}
    			});	
    		}
    	})
    	
    	/*댓글 목록*/
    	function boardCommentList() {
		var reqUrl = './boardCommentList/${dto.boardIdx}';
		$.ajax({
			url : reqUrl,
			type : "get",
			data : {},
			dataType : "JSON",
			success : function(data) {
				console.log("success: ", data);
				console.log("listSize:"+data.listSize);
				$("#listSize").html(data.listSize);
				commentListPrint(data.list); //댓글 리스트 뿌리기
				recCommList(); //내가 추천한 댓글 이미지 활성화로 고정
			},
			error : function(error) {
				console.log("error:", error);
			}
		});
	}
    	
        </script>
    </html>