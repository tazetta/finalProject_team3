<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8" />
<title>내 인테리어 변천사</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
table, td, th {
	border-collapse: collapse;
	padding: 10px 15px;
	margin: 15px;
	line-height: 100%;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
}

td {
	height: 55px;
}

.flexBox {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.inputs {
	width: 130px;
	height: 35px;
	border: 2px solid lightslategrey;
	line-height: 100%;
	font-size: 16px;
}

select:hover {
	cursor: pointer;
}

.pagingBtn {
	text-decoration: none;
	color: black;
	font-weight: 600;
	background-color: lightgray;
	margin: 1px 2px;
	margin-top: 0px;
	padding: 3px;
	border: 1px white;
}

.sideBar {
	float: left;
}

th {
	border: 1px solid gray;
	border-collapse: collapse;
	text-align: center;
	background-color: cornflowerblue;
}

.ì´ë¯¸ì§ {
	margin-top: 2%;
	width: 200px;
	height: 150px;
	float: right;
}

h2 {
	border: 1px solid black;
	width: 110px;
	margin: 1px;
	text-align: center;
	font-size: 18px;
	background-color: cornflowerblue;
}

.eventImage {
	width: 400px;
	height: 250px;
	border: 1px solid lightgray;
	float: left;
	background: url('event1.png');
	position: relative;
	margin: 15px;
}

.arrow {
	border: solid black;
	border-width: 0 3px 3px 0;
	display: inline-block;
	padding: 6px;
	margin-bottom: 80px;
	cursor: pointer;
}

.right {
	transform: rotate(-45deg);
	-webkit-transform: rotate(-45deg);
	position: absolute;
	top: 50%;
	right: 2%;
}

.left {
	transform: rotate(135deg);
	-webkit-transform: rotate(135deg);
	position: absolute;
	top: 50%;
	left: 2%;
}
</style>
</head>
<body>
	<div>
		<iframe src="mainnavi.html" scrolling="no" frameborder="0" style="width: 100%;"></iframe>
	</div>
	<div class="flexBox">
		<div style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
			<div class="sideBar" style="margin-right: 15px;">
				<iframe src="mynavi.html" scrolling="no" frameborder="0" style="height: 650px; float: left; width: 160px;"></iframe>
			</div>
			<div class="eventImage">
				<i class="arrow left" onclick="imageSlider2()"></i> 
				<i class="arrow right" onclick="imageSlider()"></i>
			</div>
			<div class="eventImage">
				<i class="arrow left" onclick="imageSlider2()"></i> 
				<i class="arrow right" onclick="imageSlider()"></i>
			</div>
		</div>
	</div>
</body>
<script>
var eventImage = document.getElementById('eventImage');
var images = ['./event1.png','./event2.png','./event3.png','./event4.png'];
var now = 0;
var i = 1;

function imageSlider(){
    if(i==images.length){
        i = 0;
    }
    eventImage.style.background = 'url('+images[i]+')';
    console.log(i);
    i++;
}

function imageSlider2(){
    if(i<=0){
        i = 4;
    }
    i--;
    console.log(i);
    eventImage.style.background = 'url('+images[i]+')';
}
</script>
</html>
