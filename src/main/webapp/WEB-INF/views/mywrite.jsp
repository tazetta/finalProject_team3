<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 반응형 디자인을 위한 css/js 라이브러리 -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야 함) -->
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<style>
    
    h2{
			border: 1px solid black;
			width: 160px;
			margin: 1px;
			text-align: center;
			font-size: 18px;
			background-color: cornflowerblue;
		}
body{
    display: flex;
    justify-content: center;
    align-items: center;
    
   
}
 .all-area{
 	text-align:center;
 }
.center-area{
	display:flex;
	text-align:center;
	
}
.table-area{
	display:inline-block;
}
.sidenavi{
	
		width:250px;
		
}
.sender , .reg_date{
	width:100px;
}
.delete{
	width:40px;
}
.content{
	width:300px;
}
.content:hover{
	width
}
.table-area{
	margin-top:50px;
	margin-left:50px;
		float: left;
}
.table-content{
	margin-left:50px;
}

#btn-none{
	visibility: hidden;
}
table{
		width:300px;
	table-layout: fixed;
}
   button{
      color: white;
    background-color: #166cea;
    border:none;
    border-radius: 2px;
    font-siez: 10px;
     padding: 2px 2px;
    }
    button:hover{
    background-color: white;
    color: #166cea;
    border: 1px solid #166cea;
    cursor: pointer;
    box-shadow: 0px 5px 5px rgb(235, 232, 232);
   	  transition: all .3s ease;
    }
    table tr{
    	margin:6px;
    }
    .table-contet tr:hover{
    	       background-color:rgb(235, 232, 232);
    }
	table td{
		width:100px;
		
	}
	    th{
      border:1px solid black;
      border-collapse: collapse;
      text-align: center;
	background-color: cornflowerblue;
            }
	.ctn:hover{
		text-decoration: none;
		color:black;
	}
	   .sideBar {
	float: left;
    }
	
</style>

</head>
<body>
	<div class="all-area">
	
	<div class="navi-area">
		  <jsp:include page="mainnavi.jsp"></jsp:include> 
	</div>
	
	<div class="center-area">
	
	<div class="sidenavi">
		  <jsp:include page="sidemenu.jsp"></jsp:include> 
	</div>
	
		<div class="table-area">
			<div class="table-top">
				
				 <table>
					<h2>우리집 자랑</h2>
			<div id="list1" style="display: flex; flex-flow: wrap;  justify-content: left; border: 1px solid rgb(250px, 250px, 250px);">

			</div> 
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
				<h2>나의 자유게시판 </h2>
				</div>
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
             </div>
             
		
			
		</div>
	</div>
</body>
<script>
var showPage = 1;
var pagePerNum = 3;
listCall1(showPage,pagePerNum);
listCall2(showPage,pagePerNum);
listCall3(showPage,pagePerNum);
listCall4(showPage,pagePerNum);

function listCall1(reqPage,reqPagePerNum){
	 
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
			 
				$("#pagination1").twbsPagination({
					startPage:data.currPage,//시작 페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:3,//5개씩 보여 주겠다.(1~5)
					onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall1(page,pagePerNum);
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
						listCall2(page,pagePerNum);
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
						listCall3(page,pagePerNum);
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
						listCall4(page,pagePerNum);
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
	$('#list1').empty();
	$('#list1').append(content);
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
