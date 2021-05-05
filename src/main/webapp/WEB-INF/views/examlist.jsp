<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시공사례 상세보기</title>
<!-- 반응형 디자인을 위한 css라이브러리 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야함) -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
</head>
<style>
table {
	position: absolute;
	left: 20%;
	top: 30%;
}

th {
	background-color: rgb(144, 209, 240);
	color: white;
}

th, td {
	height: 30px;
	font-size: 15px;
}

table, td, th, tr {
	border-collapse: collapse;
	border-top: 1px solid gray;
	border-bottom: 0px solid gray;
	text-align: center;
}

.업체네비 {
	position: absolute;
	top: -100px;
	left: 0px;
	height: 250px;
	width: 230px;
	height: 175px;
	margin-top: 300px;
	margin-left: 4%;
	z-index: 3;
}

#시공사례 {
	position: absolute;
	left: 20%;
	font-size: 22px;
	color: blue;
	font-weight: 600;
}
.시공작성{
	position: absolute;
	right: 5%;
	top:22%;
	height: 40px;
	background-color: white;
	color:blue;
	border-color: lightgray;
}
.시공작성:hover{
	background-color: rgb(144, 209, 240);
	color:white;
}
</style>



<body>
	<iframe src="mainnavi" scrolling="no" frameborder="0"
		style="width: 100%;"></iframe>

	<iframe class="업체네비" src="companynavi" scrolling="no" frameborder="0"></iframe>
	<h3 id="시공사례">시공사례</h3>
			
	<button class="시공작성" onclick="location.href='examWriteForm'" style="float: right;">시공사례작성하기</button>
		
	<table id="시공사례테이블" style="width: 400px;">
	<thead>
		<tr>
			<th>제목</th>
			<th>업체명</th>
			<th>작성일</th>
		</tr>
	<thead>
		<tbody id="list">
			<!-- 불러온 데이터 뿌리는 영역-->
		</tbody>
		<tr>
			<td id="paging" colspan="6">
				<!-- 플러그인 사용 -->
				<div class="container">
					<nav aria-label="page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
	</table>

</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
	var showPage = 1;
	listCall(showPage); //시작하자마자 이 함수를 호출

	function listCall(reqpage) {
		var reqUrl = './examlist/' + reqpage;
		$.ajax({
			url : reqUrl,
			type : 'GET',
			data : {},
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				showPage = data.currPage;
				listPrint(data.list);
				//플러그인 사용
				$('#pagination').twbsPagination({
					startPage : data.currPage, //시작 페이지
					totalPages : data.range, //생성가능 최대 페이지
					visiblePages : 5,//5개씩 보여주겠다
					onPageClick : function(evt, page) {//각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall(page);
					}
				});
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
			content += "<tr>"
			content += "<td><a href='examDetail?combrdIdx="+list[i].combrdIdx+"'>" + list[i].subject + "</a></td>"
			content += "<td><a href='interiorCompanyDetail?comId="+list[i].comId+"'>" + list[i].comId + "</a></td>"
			//java에서 가끔 날짜가 milliseconds로 나올 경우..
			var date = new Date(list[i].reg_date);
			content += "<td>" + date.toLocaleDateString("ko-KR") + "</td>"
			content += "</tr>"
		}
		$('#list').empty();
		$('#list').append(content);
	}
</script>
</html>