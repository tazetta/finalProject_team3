<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8" />
<title>내 인테리어 변천사</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript">
	//<![CDATA[ 
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true,
			slideWidth : 400,
			slideHeight : 250
		});
	});
	//]]>
</script>
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

.wraping {
	height: 400px;
	float: left;
}
</style>
</head>
<body>
	<div>
		<iframe src="mainnavi.html" scrolling="no" frameborder="0"
			style="width: 100%;"></iframe>
	</div>
	<div class="flexBox">
		<div
			style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
			<div class="sideBar" style="margin-right: 15px;">
				<iframe src="mynavi.html" scrolling="no" frameborder="0"
					style="height: 650px; float: left; width: 160px;"></iframe>
			</div>
			<!-- <div id="eventImage">
				<i class="arrow left" onclick="imageSlider2()"></i> <i
					class="arrow right" onclick="imageSlider()"></i>
			</div> -->
			<div class="wraping">
				<div class="bxslider">
					<div>
						<img src="resources/images/interior1.jpg" width="400px"
							height="250px">
					</div>
					<div>
						<img src="resources/images/interior2.jpg" width="400px"
							height="250px">
					</div>
					<div>
						<img src="resources/images/interior3.jpg" width="400px"
							height="250px">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
</script>
</html>
