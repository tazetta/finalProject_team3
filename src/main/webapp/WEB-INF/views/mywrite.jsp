<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>마이 페이지</title>
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

    th{
      border:1px solid gray;
      border-collapse: collapse;
      text-align: center;
	background-color: cornflowerblue;
            }

    
    h2{
			border: 1px solid black;
			width: 160px;
			margin: 1px;
			text-align: center;
			font-size: 16px;
			background-color: cornflowerblue;
		}



</style>
</head>
<body>
	<jsp:include page="mainnavi.jsp" />
	<div class="flexBox" >
		<div style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
			<div class="sideBar" style="margin-right: 15px;">
				<iframe  src="mynavi.html" scrolling="no" frameborder="0"
				style="height: 650px; float: left; width:250px;" ></iframe>
			</div>
			<div class="sideBar">
			<form>
			<h2>우리집 자랑</h2>
			<div id="list" style="display: flex; flex-flow: wrap;  justify-content: left; border: 1px solid rgb(150px, 150px, 150px);">

			</div> 
			
			<td id="paging" colspan="6">
				<!-- 플러그인 사용 -->
				<div class="container">
					<nav aria-label="page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
				<!--// 플러그인 사용 -->
				</td>
			
                 
					 <table>
						<h2>나의 자유게시판</h2>
					   <tr>
                   	<th style="width:70px">글 번호</th>
						<th style="width:300px">제목</th>
						<th style="width:120px">작성자</th>
						<th style="width:60px">조회수</th>
						<th style="width:100px">작성일</th>
             		   </tr>
      				 	<tbody id="list2">
             
						</tbody>
						<tr>
			<td id="paging" colspan="6">
				<!-- 플러그인 사용 -->
				<div class="container">
					<nav aria-label="page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
				<!--// 플러그인 사용 -->
				</td>
				</table>
                   <table>
						<h2>나의 꿀팁</h2>
					   <tr>
                   	<th style="width:70px">글 번호</th>
						<th style="width:300px">제목</th>
						<th style="width:120px">작성자</th>
						<th style="width:60px">조회수</th>
						<th style="width:100px">작성일</th>
             		   </tr>
      				 	<tbody id="list3">
             			</tbody>
						<tr>
			<td id="paging" colspan="6">
				<!-- 플러그인 사용 -->
				<div class="container">
					<nav aria-label="page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
				<!--// 플러그인 사용 -->
				</td>
				</table>
				<table>
					<h2>나의 질문 및 답변</h2>
					   <tr>
                   	<th style="width:70px">글 번호</th>
						<th style="width:300px">제목</th>
						<th style="width:120px">작성자</th>
						<th style="width:60px">조회수</th>
						<th style="width:100px">작성일</th>
             		   </tr>
      				 	<tbody id="list4">
             
						</tbody>
						<tr>
			<td id="paging" colspan="6">
				<!-- 플러그인 사용 -->
				<div class="container">
					<nav aria-label="page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
				<!--// 플러그인 사용 -->
				</td>
				</table>
                </form>
		
			
		</div>
	</div>
</body>
<script>
var showPage = 1;
var pagePerNum = 3;
listCall(showPage,pagePerNum);
listCall2(showPage,pagePerNum);
listCall3(showPage,pagePerNum);
listCall4(showPage,pagePerNum);

function listCall(reqPage,reqPagePerNum){
	 
	 var reqUrl ='./mywritehomeList/' + reqPagePerNum + "/" + reqPage;
	 $.ajax({
		 url:reqUrl
		 ,type:'GET'
		 ,data:{}
		 ,dataType:'JSON'
		 ,success:function(data){
			 console.log(data);
			 showPage = data.currPage;
			 console.log(showPage);
			 console.log(data.list);
			 listPrint(data.list);
			 
				$("#pagination").twbsPagination({
					startPage:data.currPage,//시작 페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:3,//5개씩 보여 주겠다.(1~5)
					onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall(page,pagePerNum);
					}
				});
		 },
		 error:function(error){
				console.log(error);
		 }
	 });
}


function listCall2(reqPage,reqPagePerNum){
	 
	 var reqUrl ='./mywriteboardList/' + reqPagePerNum + "/" + reqPage;
	 $.ajax({
		 url:reqUrl
		 ,type:'GET'
		 ,data:{}
		 ,dataType:'JSON'
		 ,success:function(data){
			 console.log(data);
			 showPage = data.currPage;
			 console.log(showPage);
			 console.log(data.list);
			 listPrint2(data.list);
			 
				$("#pagination2").twbsPagination({
					startPage:data.currPage,//시작 페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:3,//5개씩 보여 주겠다.(1~5)
					onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall(page,pagePerNum);
					}
				});
		 },
		 error:function(error){
				console.log(error);
		 }
	 });
}
function listCall3(reqPage,reqPagePerNum){
	 
	 var reqUrl ='./mywritetipList/' + reqPagePerNum + "/" + reqPage;
	 $.ajax({
		 url:reqUrl
		 ,type:'GET'
		 ,data:{}
		 ,dataType:'JSON'
		 ,success:function(data){
			 console.log(data);
			 showPage = data.currPage;
			 console.log(showPage);
			 console.log(data.list);
			 //listPrint(data.list);
			 listPrint3(data.list);
				$("#pagination3").twbsPagination({
					startPage:data.currPage,//시작 페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:3,//5개씩 보여 주겠다.(1~5)
					onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall2(page,pagePerNum);
					}
				});
		 },
		 error:function(error){
				console.log(error);
		 }
	 });
}
function listCall4(reqPage,reqPagePerNum){
	 
	 var reqUrl ='./mywriteqnaList/' + reqPagePerNum + "/" + reqPage;
	 $.ajax({
		 url:reqUrl
		 ,type:'GET'
		 ,data:{}
		 ,dataType:'JSON'
		 ,success:function(data){
			 console.log(data);
			 showPage = data.currPage;
			 console.log(showPage);
			 console.log(data.list);
			 //listPrint(data.list);
			 listPrint4(data.list);
				$("#pagination4").twbsPagination({
					startPage:data.currPage,//시작 페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:3,//5개씩 보여 주겠다.(1~5)
					onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall3(page,pagePerNum);
					}
				});
		 },
		 error:function(error){
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
		content += "<img src='resources/images/interior4.jpg' width='200' height='200' style=' border-radius:20px;'>"
		content += "</div>"
}
	$('#list').empty();
	$('#list').append(content);
}
	 function listPrint2(list){
		 var content = "";
		 for(var i = 0; i<list.length; i++){
			content +="<tr>"
				content +="<td>"+list[i].boardidx+"</td>"
				content +="<td>"+list[i].subject+"</td>"
				content +="<td>"+list[i].id+"</td>"
				content +="<td>"+list[i].bhit+"</td>"
				var date = new Date(list[i].reg_date);
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"		
			
			content +="</tr>"
		}
		$("#list2").empty();
		$("#list2").append(content);
	}
	 function listPrint3(list){
		 var content = "";
		 for(var i = 0; i<list.length; i++){
			content +="<tr>"
				content +="<td>"+list[i].boardidx+"</td>"
				content +="<td>"+list[i].subject+"</td>"
				content +="<td>"+list[i].id+"</td>"
				content +="<td>"+list[i].bhit+"</td>"
				var date = new Date(list[i].reg_date);
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"		
			
			content +="</tr>"
		}
		$("#list3").empty();
		$("#list3").append(content);
	}
	 function listPrint4(list){
		 var content = "";
		 for(var i = 0; i<list.length; i++){
			content +="<tr>"
				content +="<td>"+list[i].boardidx+"</td>"
				content +="<td>"+list[i].subject+"</td>"
				content +="<td>"+list[i].id+"</td>"
				content +="<td>"+list[i].bhit+"</td>"
				var date = new Date(list[i].reg_date);
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"		
			
			content +="</tr>"
		}
		$("#list4").empty();
		$("#list4").append(content);
	}
	 
	 var msg = "${msg}";
	 if(msg != ""){
		 alert(msg);
	 }

</script>
</html>
