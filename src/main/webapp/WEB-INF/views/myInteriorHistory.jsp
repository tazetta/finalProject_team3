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
	flex-wrap: wrap;
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
	margin: 15px;
	height: 400px;
	float: left;
}

.headDESC {
	font-size: 25px;
	font-weight: 600;
	color: tomato;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 0px;
}

.myPhotos {
	box-shadow: 0 0 5px #ccc;
	border: 5px solid #fff;
	background: #fff;
	margin: 9px;
	float: left;
}

.something {
	margin: 15px;
	float: left;
}
</style>
</head>
<body>
	<%-- <div class="sideBar" style="margin-right: 15px;">
		<jsp:include page="mynavi.jsp"/>
	</div> --%>
	<div class="flexBox" >
			<jsp:include page="mainnavi.jsp"/>
		<div class="testDiv" style="max-width: 900px;">
			<!-- <div id="eventImage">
				<i class="arrow left" onclick="imageSlider2()"></i> <i
					class="arrow right" onclick="imageSlider()"></i>
			</div> -->
			<div>
				<div class="wraping" style="height: 300px">
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
				<div class="wraping" style="height: 300px">
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
				<div class="something">
					<div class="headDESC" style="border-bottom: 2px solid lightgray;">내
						사진들</div>
					<div class="box">
						<div class="myPhotos">
							<img src="resources/images/interior1.jpg" width="400px"
								height="250px">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
const getDataLength = 4;
let count = 0;
let image = "";
$(document).ready(() => {
	loop();
});

const loop = () => {
	Array.from({ length: getDataLength }, (_, i) => i + count).forEach(
		num => {
			getTodos(num);
		}
	);
};

const getTodos = num => {
	if (!num) return;
	
	count++;
	/* $.get(`https://jsonplaceholder.typicode.com/todos/${num}`, data => {
		addTodoCard({ data, target: '.something' });
	}); */
	$.ajax({
		url : 'myPhotos/'+num,
		type : "get",
		data : {},
		dataType : "JSON",
		success : function(data) {
			image = data.images[count];
			if (count > data.images.length) {
				console.log('데이터 끝');
			} else {	
				addTodoCard({ data, target: '.something' });
			}
		},
		error : function(error) {
			console.log(error); 
		} 
	});
	
};

const addTodoCard = ({ data, target }) => {
	let src = 'rsources/images/'+image;
	const card = `
		<div class='myPhotos'>
			<img src='resources/images/interior1.jpg' alt='image' width='400px' height='250px'>
			<div class='container'>
				<p>이미지</p>
			</div>
		</div>`
	$(target).append(card);
};


$(window).scroll(function () {
	if ($(window).scrollTop() == $(document).height()-1007) {
		loop();
	} 
});
</script>
</html>
