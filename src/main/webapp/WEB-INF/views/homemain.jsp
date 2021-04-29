
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 집 자랑</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</head>
<style>
 #comment{
    border-radius: 5px; 
    background-color:rgb(99, 126, 224) ; 
    font-weight: bold; 
    font-size: small; 
    color: white;
 }
 a {

	text-decoration: none;
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
    <div class="container" style="text-align: center;">
        <select name="idx" id="idx" style="border-radius: 5px; border: 2px solid gray; ">
            <option value="">정렬</option>
            <option value="1">최신순</option>
            <option value="2">추천순</option>
        </select>
        <select name="idx" id="idx" style="border-radius: 5px; border: 2px solid gray;">
            <option value="">주거형태</option>
            <option value="1">원룸&오피스텔</option>
            <option value="2">아파트</option>
            <option value="3">단독주택</option>
            <option value="4">기타</option>
        </select>
      
        <select name="idx" id="idx" style="border-radius: 5px; border: 2px solid gray;">
            <option value="">예산</option>
            <option value="1">1백만원미만</option>
            <option value="2">1백만원대</option>
            <option value="3">2백만원대</option>
            <option value="4">3백만원대</option>
            <option value="5">4백만원대</option>
            <option value="6">5백만원대</option>
            <option value="7">1천만원대</option>
            <option value="8">그 이상</option>
        </select>
        <label>평수</label>
        <input type="range" id="range" min="10" max="100" step="1" value="0" oninput="document.getElementById('value').innerHTML=this.value;">
        <span id="value"></span>평
        
   
       <div style="float: right;">
           <button class="btn" id="comment">글쓰기</button>
        </div>

    </div>
    <br/>
   
    <div id="mainBox">
		<!-- 상단 타이틀 -->
		
			<div class="mainContent1">
			
				<div class="bestItem">
					<c:forEach items="${list}" var="best">
					<a href="" class="alink">
					<table>
						<tr>
							<td rowspan="3" class="bestImage" >
								<img id="itemImage1" src=""  alt="${oriFileName}"width="300px" height="398px" style="border-radius: 5px;" />
							</td>
							<td class="subject">
								${subject}
							</td>
						</tr>
						<tr>
							<td class="id">
								${id}
							</td>
						</tr>
						<tr>
							<td class="scrapidx">${scrapidx} </td>
						</tr>
					</table>
					</a>
					</c:forEach>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>
