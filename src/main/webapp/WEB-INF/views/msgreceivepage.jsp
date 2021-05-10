<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>받은 쪽지함</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 반응형 디자인을 위한 css/js 라이브러리 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>   
 <!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야 함) -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
body {
	display: flex;
	justify-content: center;
	
}
.sender{
	width:200px;
}
reg_date{
	width:100px;
}
.delete{
	width:40px;
}
.content{
	width:300px;
}
.center-area{
	display:flex;
	text-align:center;
}
.sidenavi-area{
	width:190px;
}
table{
	text-align:left;
	margin-left:50px;
	width:300px;
	table-layout: fixed;
}
table th{
	width:200px;
		
	
}
.table-content tr:hover {
	       background-color:rgb(235, 232, 232);
}
.name{
	font-size:20px;
}
.list-area{
margin-top:50px;
}
   button{
      color: white;
    background-color: #166cea;
    border:none;
    border-radius: 2px;
    font-weight: bold;
     padding: 2px 2px;
    }
    button:hover{
       background-color: white;
    color: #166cea;
    border: 1px solid #166cea;
    cursor: pointer;
    box-shadow: 0px 5px 5px rgb(235, 232, 232);
    }
</style>

<body>
	<div class="all-area">
		<div class="mainnavi-area">
			<jsp:include page="mainnavi.jsp"></jsp:include>
		</div>
		<div class="center-area">
		<div class="sidenavi-area">
			<jsp:include page="sidemenu.jsp"></jsp:include>
		</div>

		<div class="list-area">
			<div class="title-area">
				<span class="name">받은 편지함</span>
				<button id="writeButton" onclick="msgFormPopUp()">쪽지쓰기</button>
			</div>
			<div class="table-area">
				<table>
						<thead>
							<tr>
								<th class="sender">작성자</th>
								<th class="content">내용</th>
								<th class="reg_date">날짜</th>
								<th class="delete"></th>
							</tr>
						</thead>
					<tbody id="list" class="table-content">

					</tbody>
					<tr>
						<td id="paging" colspan="6">
							<!-- 플러그인 사용 -->
							<div class="container">
								<nav aria-label="page navigation" style="text-align: center; width:700px;">
									<ul class="pagination" id="pagination"></ul>
								</nav>
							</div> <!--// 플러그인 사용 -->
						</td>
					</tr>
				</table>
			</div>
			</div>
		</div>
</body>
<script>


function msgFormPopUp(){
	var url = "msgFormPopUp";
	
	window.open(url,"쪽지보내기폼","width=500, height=450");
	
}
function msgDetailPopUp(idx){
	var url ="msgDetailPopUp/"+idx;
	
	window.open(url,"쪽지 상세보기","width=500, height=450");
}

var showPage = 1;
 var pagePerNum = 10;
 listCall(showPage,pagePerNum);
 
 function listCall(reqPage,reqPagePerNum){
	 
	 var reqUrl ='./msgReceiveList/' + reqPagePerNum + "/" + reqPage;
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
	 
 /* function listPrint(list){
	 var content = "";
	 for(var i = 0; i<list.length; i++){
		content +="<tr>"
		content +="<td>"+list[i].sender+"</td>"
		content +="<td><a href='#' id="+list[i].msgIdx+" onclick='msgDetailPopUp("+list[i].msgIdx+")'>"+list[i].content+"</td>"
		var date = new Date(list[i].reg_date);
		content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"		
		content +="<td><button class=\"delBtn\"  onclick=\"deleteMsg("+list[i].msgIdx+")\""+">삭제</button></td>"
		//content +="<td><button onclick=\"location.href='msgDelete/"+list[i].msgIdx+"'\">삭제</button></td>"
		content +="</tr>"
	}
	$("#list").empty();
	$("#list").append(content);
} */
function listPrint(list){
		var content = "";
	 	for(var i = 0; i<list.length; i++){
		console.log(list[i].content.length);
		var contentMsg = list[i].content;
		var str = "";
		console.log(contentMsg)
		if(contentMsg.length > 10){	
			
				console.log(contentMsg.substring(0,10));
		 str=contentMsg.substring(0,10);
		 str +='...';
		}else{
			str=contentMsg;
		}
		console.log(list[i].content.length);
		content +="<tr>"
		content +="<td>"+list[i].sender+"</td>"
		content +="<td><a href='#' id="+list[i].msgIdx+" onclick='msgDetailPopUp("+list[i].msgIdx+")'>"+str+"</td>"
		var date = new Date(list[i].reg_date);
		content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"		
		content +="<td><button class=\"delBtn\"  onclick=\"deleteMsg("+list[i].msgIdx+")\""+">삭제</button></td>"
		//content +="<td><button onclick=\"location.href='msgDelete/"+list[i].msgIdx+"'\">삭제</button></td>"
		content +="</tr>"
	}
	$("#list").empty();
	$("#list").append(content);
}
	 
	 var msg = "${msg}";
	 if(msg != ""){
		 alert(msg);
	 }
	 function deleteMsg(msgIdx){
		 if(confirm("정말 삭제하시겠습니까?")){
			
			 
			var params = {};
			
			params.msgIdx = msgIdx;
			$.ajax({
				   type:'get'
                       ,url:'msgDelete/'+msgIdx
                       ,data:{}
                       ,dataType:'json'
                       ,success:function(data){
                           console.log(data);	
               				alert(data.msg);
               				location.reload(true);
                           },error:function(e){
                       }
			})
			
		 }
	 }
</script>
</html>
