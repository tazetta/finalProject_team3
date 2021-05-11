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
			slideWidth : 900,
			slideHeight : 400
		});
	});
	//]]>
</script>
<style>

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
	margin-bottom: 10px;
	margin-top: 15px;
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
	<div class="sideBar"
		style="margin-right: 15px; position: fixed; left: 300px; top: 15vh;">
		<jsp:include page="sidemenu.jsp" />
	</div>
	<div class="flexBox">
		<jsp:include page="mainnavi.jsp" />
		<div class="testDiv" style="max-width: 900px;">
			<!-- <div id="eventImage">
				<i class="arrow left" onclick="imageSlider2()"></i> <i
					class="arrow right" onclick="imageSlider()"></i>
			</div> -->
			<div>
				<div class="sliderBox">
					<div class="wraping" style="height: 300px">
						<div class="bxslider">
						<c:if test="${slide.size() > 0}">
							<c:forEach items="${slide}" var="slide">
								<div>
									<img src="resources/images/${slide.newFileName}" width="880px"
										height=300px>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${slide.size() == 0}">
							<div>
								<img alt="" src="resources/css/memberCSS/logo.png" width="800px" height="300px">
							</div>
						</c:if>
						</div>
					</div>
				</div>
				<div class="something">
					<div class="headDESC" style="border-bottom: 2px solid lightgray;">내 사진들</div>
					<div class="box"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
const getDataLength = 4;
let count = 0;
let image = "";
var thisPage = 1;
var id = "${sessionScope.loginId}";

	getTodos(thisPage, id);

function getTodos (reqPage, id){	
	count++;
	/* $.get(`https://jsonplaceholder.typicode.com/todos/${num}`, data => {
		addTodoCard({ data, target: '.something' });
	}); */
	var reqUrl = 'myPhotos'+'/'+3+'/'+reqPage+'/'+id;
	$.ajax({
		url:reqUrl
		,data:{}
		,type:'GET'
		,dataType:'JSON'
		,success:(data)=>{
			/* if(reqPage > data.maxPage){listCall(data.maxPage, id);} */
			console.log(reqUrl);
			console.log(data);
			thisPage = data.currPage;
			appendPhotos(data.list);
			
			console.log('최대 페이지 '+data.maxPage);
		}
		,error:(data)=>{
			console.log(data);
		}
	});
	
};


function appendPhotos(list){
	var card = "";
	var src = "";
	if(list.length > 0){
	for(var i = 0; i<list.length;i++){
		src += "C:/upload/"+list[i].newFileName;
		card += "<div class='myPhotos'><img src='" + src + "' alt='image' width='400px' height='250px'><div class='container'><p>"+src+"</p></div></div>"
		src = "";
	}
	} else {
		card += "<div class='myPhotos'>현재 등록된 사진이 없습니다.</div>"
	}
	$(".box").append(card);
};


$(window).scroll(function () {
	if ($(window).scrollTop() == $(document).height()-1007) {
		thisPage++;
		getTodos(thisPage, id);
	} 
});
</script>
</html>
