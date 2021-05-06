<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
        
</style>
</head>
<body>
	<h3>시공사례 리스트 페이지</h3>
	<!-- 업체세션있는 사람만 글쓰기 보이게 -->
	<c:if test="${sessionScope.cLoginId ne null}">
		<button onclick="location.href='./examWriteForm'">시공사례쓰기</button>
	</c:if>
		<div class="container" style="font-size: large; font-weight: bold; padding-left: 40px;">
			<div id="list" style="display: flex; flex-flow: wrap;  justify-content: center; border: 1px solid rgb(255, 255, 255);">

			</div> 
		</div>
		
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
	var count = 1;
	listCall(count); //시작하자마자 이 함수를 호출

	function listCall(count) {
		console.log("스크롤이 되니?",count);
		//Restful service는 ajax를 통해 호출하여 사용하는 경우가 많지만
		//restful service가 곧 ajax라고 생각해서는 안된다.
		var reqUrl = './examListScroll/' + count;
		$.ajax({
			url : reqUrl,
			type : 'GET',
			data : {},
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				listPrint(data.list);
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

	function listPrint(list) {
		console.log("listprint실행");
		console.log(list.length);
		var content = "";
		for (var i = 0; i < list.length; i++) {
			
			content += "<div style='border-radius:20px; border: 5px solid white; margin: 20px; box-shadow:0 0 5px lightslategray;'>"
			content += "<img src='resources/images/interior1.jpg' width='250' height='250' style=' border-radius:20px;'>"
			content += "<table class='table'>"
			content += "<tr>"
			content += "<th style='border-color: white;'><a href='examDetail?combrdIdx="+list[i].combrdIdx+"'>" + list[i].subject + "</a></th>"
			content += "</tr>"
			content += "<tr>"
			content += "<td><a href='interiorCompanyDetail?comId="+list[i].comId+"'>" + list[i].comId + "</a></td>"
			content += "</tr>"
			content += "</table>"
			content += "</div>"
			if(i%3==0){
				console.log("줄좀바꿔줘..");
				content += "<br/>"
			}
		}
		$('#list').empty();
		$('#list').append(content);
	}

	$(window).scroll(function () {
		console.log("스크롤이 되는거니?");
		console.log($(window).scrollTop());
		console.log($(document).height());
		console.log($(window).height());
		//if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
		console.log("아몰랑");
		count++;
		listCall(count);
		//}
	});

/* const getDataLength = 9;
let count = 0;

$(document).ready(() => {
	console.log("루프시작");
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
	var reqUrl = './examListScroll/' + count;
	$.ajax({
		url : reqUrl,
		type : 'GET',
		data : {},
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			addTodoCard(data.list);
		},
		error : function(error) {
			console.log(error);
		}
	});
	
};

const addTodoCard = ({ list, target }) => { 
			var content = "";
            for (var i = 0; i < list.length; i++) {
            	content += "<tr>"
            	content += "<td><a href='#'>" + list[i].subject + "</td>"
            	content += "<td>" + list[i].comId + "</td>"
            	//java에서 가끔 날짜가 milliseconds로 나올 경우..
            	var date = new Date(reviewList[i].reg_date);
            	content += "<td>" + date.toLocaleDateString("ko-KR") + "</td>"
            	content += "</tr>"

	$(target).append(card);
};

$(window).scroll(function () {
	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		loop();
	}
}); */
</script>
</html>