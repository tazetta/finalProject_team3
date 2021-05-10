<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<meta charset="UTF-8">
<head>

<style>
.navi {
	list-style-type: none;
	width: 150px;
	list-style: none;
	margin: 0;
	padding: 0;
	background-color: white;
	border: 1px solid black;
	border-top-color: white;
	border-bottom-color: white;
	border-collapse: collapse;
	float: left;
}

li a {
	list-style: none;
	background-color: white;
	text-decoration: none;
	font-weight: bold;
	color: #000000;
	display: block;
	text-align: center;
	padding: 15px;
}

li a:hover {
	background-color: #33f;
	color: white;
}

.navi li ul {


	list-style: none;
	display: none;
	transition: all 0.5s;
	margin:0px;
	padding:0px;
	text-align: center;
	position: relative;
}

.navi li:hover ul {
	
	
	display: block;
	
}

.navi li a {
	list-style: none;
	transition: all 0.5s;
}

.navi ul li a {
background-color: silver;

}

</style>
</head>
<body>

	<div>
		<ul class="navi">
			
			<li><a href="mywrite" target="_parent">내 작성글</a>
				<ul>
					<li><a href="mywritehome" target="_parent">우리집 자랑</a></li>
					<li><a href="mywriteboard" target="_parent">자유게시판</a></li>
					<li><a href="mywritetip" target="_parent">꿀팁</a></li>
					<li><a href="mywriteqna" target="_parent">질문 및 답변</a></li>
				</ul></li>
			<li><a href="myscrappage" target="_parent">스크랩북</a>
				<ul>
					<li><a href="#">우리집 자랑</a></li>
					<li><a href="myscrappage">꿀팁</a></li>
				</ul></li>
			<li><a href="msgpage" target="_parent">쪽지</a>
				<ul>
					<li><a href="msgreceivepage" target="_parent">받은 쪽지함</a></li>
					<li><a href="msgsendpage" target="_parent">보낸 쪽지함</a></li>
				</ul></li>
			<li><a href="myestimate" target="_parent">내 견적서</a></li>
			<li><a href="mygrouppage" target="_parent">공동구매 내역</a>
				<ul>
					<li><a href="mygroupbuy" target="_parent">신청한 공동구매</a></li>
					<li><a href="mygroupwrite" target="_parent">작성한 공동구매</a></li>
				</ul></li>
			<li><a href="myInteriorHistory" target="_parent">인테리어 변천사</a></li>
			<li><a href="pwconfirm" target="_parent">회원 정보</a></li>
		</ul>
	</div>
</body>

</html>