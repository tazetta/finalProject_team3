<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<style>
.container{
	position: relative;
	width: 1000px;
}
   .logo-area{
   height: 50px;
   }
   	li{
        line-height: 4;
        border-top: 2px solid dodgerblue;
        border-bottom: 2px solid dodgerblue;
        float: left;
        padding: 0px 20px;
        background-color: white;
        font-size: 25px;
        font-weight: 700;
        text-align: center;
        width:auto;
        height: 100px;
        list-style: none;
         }
        a:link{
            color: black;
            text-decoration: none;
        }
        a:visited{
            color: pink;
        }
        li:hover{
            color: white;
            background-color: deepskyblue;
        }
        div.bar{
            background-color: white;
            min-width: 700px;
        }
            #btn:hover{
            color: rgb(143, 201, 248);
	        box-shadow: rgb(143, 201, 248) 0 0px 0px 40px inset;
        }
</style>
<div class="logo-area">
               <a href="main">
                    <img src="resources/css/memberCSS/logo.png" style="height: 50px; width: 100px;">
               </a>
           </div>
<div class="container" style="text-align: center;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248);"
            placeholder="검색어를 입력해주세요.">
        <button id="btn"
            style="border-radius: 5px;background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
            
            
            <c:set var="loginId" value="${sessionScope.loginId}" />
             <c:set var="comloginId" value="${sessionScope.cLoginId}" />
            <c:if  test="${empty loginId and empty comloginId}">
        <a href="FAQ" style="font-size:small; float: right; color: gray; padding-left: 5px;">|<span
                style="padding-left: 5px;">고객센터</span></a>
        <a href="registForm" style="font-size:small; float: right; color: gray; padding-left: 5px;">|<span
                style="padding-left: 5px;">회원가입</span></a>
        <a href="membership" style="font-size:small; float: right; color: gray; "><span>로그인</span></a>
        </c:if>
          <c:if  test="${!empty loginId}">
        <a href="FAQ" style="font-size:small; float: right; color: gray; padding-left: 5px;">|<span
                style="padding-left: 5px;">고객센터</span></a>
        <a href="mywrite" style="font-size:small; float: right; color: gray; padding-left: 5px;">|<span
                style="padding-left: 5px;">마이페이지</span></a>
        <a href="membership" style="font-size:small; float: right; color: gray; "><span>로그아웃</span></a>
        </c:if>
         <c:if  test="${!empty comloginId}">
        <a href="FAQ" style="font-size:small; float: right; color: gray; padding-left: 5px;">|<span
                style="padding-left: 5px;">고객센터</span></a>
        <a href="companydetail" style="font-size:small; float: right; color: gray; padding-left: 5px;">|<span
                style="padding-left: 5px;">업체페이지</span></a>
        <a href="membership" style="font-size:small; float: right; color: gray; "><span>로그아웃</span></a>
        </c:if>
    </div>
<div class="bar">
    <ul>
        <li><a href="Freelist" target="_parent">자유게시판</a></li>   
        <li><a href="homemain" target="_parent">우리집 자랑</a></li>
        <li><a href="groupListPage" target="_parent">공동 구매</a></li>
        <li><a href="helpMain" target="_parent">도와줘요 자취만렙</a></li> 
        <li><a href="interiorexamList" target="_parent">전문가 인테리어</a></li>
    </ul>

</div>
</html>