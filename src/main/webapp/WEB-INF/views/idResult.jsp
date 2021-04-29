<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style></style>
		<link rel="stylesheet" href="resources/css/memberCSS/idResult.css"/>
	</head>
<body>
    <div class="all-area">
        <div class="title">
            <h3>아이디 찾기 결과</h3>
        </div>
         <!--c:if 따라서 결과 내용1-->
         <c:set var="userId" value="${findId}"/>
         <c:if test="${userId != null}">
		         <span class="result-msg">
				             회원님의 정보로 가입된 아이디가 있습니다.    
		         </span>
	           <div class="result-area">
		           <div>
		               <span class="id">${userId}</span>
		               <span class="reg_date">${reg_date}</span>
		               <span>가입</span>
		           </div>
		       </div>
	     </c:if>
        <!--c:if 따라서 결과 내용2-->
   		<c:set var="userId" value="${userId}"/>
   		<c:if test="${userId == null}">
        <div class="result-area">
           <div class="result-msg2">
               	회원님의 정보로 가입된 정보가 없습니다. <a href="membership">회원가입</a> 하러가기
           </div>
        </div>
   		</c:if>

        <!--버튼 div-->
        <div class="btn-area">
            <div>
                <button class="btn1" onclick="location.href='findPw'">비밀번호 찾기</button>
            </div>
            <div>
                <button class="btn2" onclick="location.href='membership'">로그인 </button>
            </div>
        </div>
    </div>
</body>
</html>