
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<style>
li.help {
	float: left;
	padding: 0px 60px;
	background-color: white;
	font-size: 15px;
	font-weight: 700;
/* 	width: 5%; */
	text-align: center;
	height: 3px;
	list-style: none;
	
}

.help a:link {
	color: black;
	text-decoration: none;
	/*   padding-left:550px; */
}

.help a:visited {
	color: black;
}

.help a:hover {
	/*  color: rgb(240, 198, 60); */
	color: orange;
}

.helpbar {
	/*  width: 4000px;
            margin-left: 500px;
            background-color: white; */
	/*중앙정렬*/
	 /* margin: 0 auto; */
	justify-content: center;
	align-items: center;
	display: flex; 
	/* border: 1px solid red; */
	height: 30px;
	margin-top:5px;
	margin-bottom:10px;
}
</style>

<body>

	<div class="helpbar">
		<ul id="helpul">
			<li class="help"><a href="helpMain" target="_parent">질문 및 답변</a></li>
			<li class="help"><a href="tip" target="_parent">꿀팁 게시판</a></li>
		</ul>
	</div>
</body>
</html>