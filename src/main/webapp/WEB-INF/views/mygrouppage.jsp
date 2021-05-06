<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>공동구매 페이지</title>
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
	<iframe src="mainnavi.html" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
	<div class="flexBox" >
		<div style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
			<div class="sideBar" style="margin-right: 15px;">
				<iframe  src="mynavi.html" scrolling="no" frameborder="0"
				style="height: 650px; float: left; width:250px;" ></iframe>
			</div>
			<div class="sideBar">
				<form>
					 <table>
						<h2>내가 작성한 공동구매</h2>
					   <tr>
                     	<th style="width:70px">글 번호</th>
						<th style="width:70px">현재상태</th>
						<th style="width:70px">작성자</th>
						<th style="width:450px">제목</th>
						<th style="width:50px">작성일</th>
             		   </tr>
      				 	<tbody id="list">
             
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
                    <br/>
              	    <table>
						<h2>내가 신청한 공동구매</h2>
					   <tr>
                     	<th style="width:70px">글 번호</th>
						<th style="width:70px">현재상태</th>
						<th style="width:70px">작성자</th>
						<th style="width:450px">제목</th>
						<th style="width:50px">작성일</th>
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
                </form>
			</div>
			
		</div>
	</div>
</body>
<script>
var showPage = 1;
var pagePerNum = 5;
listCall(showPage,pagePerNum);
listCall2(showPage,pagePerNum);
function listCall(reqPage,reqPagePerNum){
	 
	 var reqUrl ='./mygroupwriteList/' + reqPagePerNum + "/" + reqPage;
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
					visiblePages:5,//5개씩 보여 주겠다.(1~5)
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
	 
	 var reqUrl ='./mygroupbuyList/' + reqPagePerNum + "/" + reqPage;
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
			 listPrint2(data.list);
				$("#pagination2").twbsPagination({
					startPage:data.currPage,//시작 페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:5,//5개씩 보여 주겠다.(1~5)
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

	 
	 function listPrint(list){
		 var content = "";
		 for(var i = 0; i<list.length; i++){
			content +="<tr>"
				content +="<td>"+list[i].gpIdx+"</td>"
				content +="<td>"+list[i].progIdx+"</td>"
				content +="<td>"+list[i].id+"</td>"
				content +="<td>"+list[i].subject+"</td>"
			var date = new Date(list[i].reg_date);
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"		
			content +="</tr>"
		}
		$("#list").empty();
		$("#list").append(content);
	}
	 function listPrint2(list){
		 var content = "";
		 for(var i = 0; i<list.length; i++){
			content +="<tr>"
				content +="<td>"+list[i].gpIdx+"</td>"
				content +="<td>"+list[i].progIdx+"</td>"
				content +="<td>"+list[i].id+"</td>"
				content +="<td>"+list[i].subject+"</td>"
				var date = new Date(list[i].reg_date);
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"		
			
			content +="</tr>"
		}
		$("#list2").empty();
		$("#list2").append(content);
	}
	 
	 var msg = "${msg}";
	 if(msg != ""){
		 alert(msg);
	 }

</script>
</html>
