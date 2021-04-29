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

li a:hover, .navi li ul:hover {
	background-color: #33f;
	color: white;
}

.navi li ul {
	/* << li íìì ul = ìë¸ë©ë´ */
	text-indent: -3em;
	list-style: none;
	display: none;
	background-color: white;
	color: white;
	transition: all 0.5s;
}

.navi li:hover ul {
	display: block;
}

.navi li a {
	list-style: none;
	transition: all 0.5s;
}
</style>
</head>
<body>

	<DIV>
		<ul class="navi">
			<li><a href="myinfo">회원 정보</a></li>
			<li><a href="mywrite">내 작성글</a>
				<ul>
					<li><a href="#">우리집 자랑</a></li>
					<li><a href="#">자유게시판</a></li>
					<li><a href="#">꿀팁</a></li>
					<li><a href="#">질문 및 답변</a></li>
				</ul></li>
			<li><a href="#">스크랩북</a>
				<ul>
					<li><a href="#">우리집 자랑</a></li>
					<li><a href="#">꿀팁</a></li>
				</ul></li>
			<li><a href="#">쪽지</a>
				<ul>
					<li><a href="#">받은 쪽지함</a></li>
					<li><a href="#">보낸 쪽지함</a></li>
				</ul></li>
			<li><a href="#">내 견적서</a></li>
			<li><a href="#">공동구매 내역</a>
				<ul>
					<li><a href="#">신청한 공동구매</a></li>
					<li><a href="#">작성한 공동구매</a></li>
				</ul></li>
			<li><a href="#">인테리어 변천사</a></li>
		</ul>
	</DIV>
</body>

</html>