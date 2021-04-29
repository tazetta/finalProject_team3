
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<meta charset="UTF-8">

<style>
   
    li{
        line-height: 4;
        float: left;
        padding: 0px 20px;
        background-color: white;
        font-size: 25px;
        font-weight: 700;
        width: 7%;
        text-align: center;
        height: 100px;
        list-style: none;
         }
       
        a:link{
            color: black;
            text-decoration: none;
        }
        a:visited{
            color: white;
        }
        li:hover{
            color: white;
            background-color: deepskyblue;
        }
        div.bar{
           width: 4000px;
            height: 30px;
            background-color: white;
            min-width: 700px;
        }

        li#Q,
        li#T{
        padding: 0px 20px;
        background-color: white;
        font-size: 15px;
        font-weight: 700;
        width: 5%;
        text-align: center;
        height: 1px;
        list-style: none;
         }
        
       
        li#Q,li#T:link{
            color: black;
            text-decoration: none;
        }
        a:visited{
            color: white;
        }
        #T:hover{
            color: rgb(240, 198, 60);
            
        }
        #Q:hover{
            color: rgb(240, 198, 60);
            
        }
        div.bar2{
           width: 4000px;
            margin-left: 500px;
            background-color: white;
            
        }
</style>

<div class="bar">
    <a href="*" target="_parent">
        <li style=" border-top: 2px solid dodgerblue;
        border-bottom: 2px solid dodgerblue;">자유게시판</li>
    </a>
    <a href="*" target="_parent">
        <li style=" border-top: 2px solid dodgerblue;
        border-bottom: 2px solid dodgerblue;">우리집 자랑</li>
    </a>
    <a href="*" target="_parent">
        <li style=" border-top: 2px solid dodgerblue;
        border-bottom: 2px solid dodgerblue;">공동 구매</li>
    </a>
    <a href="*" target="_parent">
        <li style=" border-top: 2px solid dodgerblue;
        border-bottom: 2px solid dodgerblue;">도와줘요 자취만렙</li>
    </a>
    <a href="*" target="_parent">
        <li style=" border-top: 2px solid dodgerblue;
        border-bottom: 2px solid dodgerblue;">전문가 인테리어</li>
    </a>

</div>
<div class="container">

    <div class="bar2" style="display: inline-block;" >
        <a href="*" target="" >
            <li id="Q">질문 및 답변</li>
        </a>
        <a href="*" target="">
            <li id="T" >꿀팁 게시판</li>
        </a>
    </div>
</div>
</html>