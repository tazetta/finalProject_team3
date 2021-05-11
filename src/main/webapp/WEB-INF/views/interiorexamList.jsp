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
#totaldiv {
	position: absolute;
	left: 10%;
	top: 20%;
}

#시공사례쓰기 {
	position: absolute;
	right: 32%;
	top: 15%;
	height: 40px;
	border: none;
	background-color: #acd3fb;
	cursor: pointer;
	color: white;
	font-weight: bold;
	border-radius: 5px;
}

#시공사례쓰기:hover {
	background-color: #acd3fb;
	cursor: pointer;
	box-shadow: 0 2px 4px rgba(0, 79, 255, 0.6);
	border: 2px solid white;
	color: white;
}
table{
	text-align: center;
}
        .flexBox {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
}
        
</style>
</head>
<body>
	<div class="flexBox">
	<div>
	<jsp:include page="mainnavi.jsp"></jsp:include> 

	
	<!-- 업체세션있는 사람만 글쓰기 보이게 -->
	<c:if test="${sessionScope.cLoginId ne null}">
		<button id="시공사례쓰기" onclick="location.href='./examWriteForm'">시공사례쓰기</button>		
	</c:if>
		<div id="totaldiv" class="container" style="font-size: large; font-weight: bold; padding-left: 40px;">
			<div id="list" style="display: flex; flex-flow: wrap;  justify-content: center; border: 1px solid rgb(255, 255, 255);">

			</div> 
		</div>
</div>
</div>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
	const getDataLength = 6;
	let count = 0;
	let image = "";
	var thisPage = 1;
	listCall(thisPage); //시작하자마자 이 함수를 호출

	function listCall(thisPage) {
		//Restful service는 ajax를 통해 호출하여 사용하는 경우가 많지만
		//restful service가 곧 ajax라고 생각해서는 안된다.
		count++;
		var reqUrl = 'examListScroll/' +6+"/"+ thisPage;
		$.ajax({
			url : reqUrl,
			type : 'GET',
			data : {},
			dataType : 'JSON',
			success : function(data) {
				if(thisPage <= data.maxPage){
					console.log("스크롤이 되니?",thisPage);
					thisPage = data.currPage;
					listPrint(data.list);
					
					console.log('최대 페이지 '+data.maxPage);					
				}
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
		var src = "";
		for (var i = 0; i < list.length; i++) {
			src += "C:/upload/"+list[i].newFileList;
			content += "<div style='border-radius:20px; border: 5px solid white; margin: 20px; box-shadow:0 0 5px lightslategray;'>"
			content += "<img src="+src+" width='350' height='250' style=' border-radius:20px;'>"
			content += "<table class='table'>"
			content += "<tr>"
			content += "<th style='border-color: white;'><a href='examDetail?combrdIdx="+list[i].combrdIdx+"'>" + list[i].subject + "</a></th>"
			content += "</tr>"
			content += "<tr>"
			content += "<td><a href='interiorCompanyDetail?comId="+list[i].comId+"'>" + list[i].comId + "</a></td>"
			content += "</tr>"
			content += "</table>"
			content += "</div>"

			src = "";
		}
		$('#list').append(content);
	}


	$(window).scroll(function () {
		if ($(window).scrollTop() >= $(document).height()-1007) {
			console.log("window : "+$(window).scrollTop());
			console.log("document : " + $(document).height());
			thisPage++;
			listCall(thisPage);
		} 
	});


</script>
</html>