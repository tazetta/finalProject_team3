
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 게시물</title>
<style>

	#button{
        background-color: rgb(172, 172, 172);
            color: rgb(8, 8, 8);
            font-weight: bold;
            padding: 7px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 7%;
            border-radius: 5px;
           

    }
    #content{
         margin-top: 50px;
         margin-left: 300;

    }

    #contentbtn{
        background-color: rgb(172, 172, 172);
        color: rgb(8, 8, 8);
        font-weight: bold;
        padding: 7px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 7%;
        border-radius: 5px;

    }
    #comment{
        background-color: rgb(241, 160, 122);
        color: rgb(8, 8, 8);
            font-weight: bold;
            padding: 7px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 7%;
            border-radius: 5px;
    }
</style>
</head>
<body>
    <div class="container" style="text-align: center;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248);" placeholder="검색어를 입력해주세요.">
        &nbsp;
        <button id="btn" style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248);">검색</button>
        <span><a href="" style="font-size:small; float: right; color: gray;">|고객센터</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray;" >|회원가입</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray;">로그인</a></span>
    </div>
    <br/>
    <br/>
            <div class="container" style="text-align: center; padding-top: 100px; background-color: rgb(163, 182, 248);">

                제목<!--${dto.subject}-->
                <div style="margin-top: 50px; margin-left: 300;">
                    <button id="button" style="margin-left: 300;" >수정</button>
                    <button id="button" style="margin-left: 50;" >삭제</button>  
                </div>
                <!--style="
                    background-color: rgb(172, 172, 172);
                    color: rgb(8, 8, 8);
                    font-weight: bold;
                    padding: 7px;
                    margin: 8px 0;
                    border: none;
                    cursor: pointer;
                    width: 7%;
                    border-radius: 5px;"-->
                    
               
            
            </div>
            <div class="container" style="text-align: center; padding-top: 100px; ">

               
                내용<!--${dto.content}-->
                       <!--${dto.uer_name}-->
                       <!--${dto.bHit}-->
                        
                        <div id="content">
                            <button id="contentbtn" style="margin-left: 300;">신고</button>
                            <button id="contentbtn" style="margin-left: 50;" >목록</button>  
                        </div>
        
                
               
            </div>
        
   
            <div class="container" style="text-align: center; ">
                <b>user</b> : <input type="text" size="75" placeholder="댓글을 입력해주세요."> 
                <button id="comment">댓글 작성</button>
            </div>
            
            
    
</body>
</html>