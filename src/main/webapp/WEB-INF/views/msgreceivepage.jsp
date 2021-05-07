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
</head>
<body>
    <div>
                                  <iframe  width="1500" height="280" align="middle" src="mainnavi" scrolling="no" frameborder="0" style="padding-left:100px;"></iframe>
    
        <table>
        <thead>
                <tr>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>날짜</th>
                </tr>
        </thead>
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
		</tr>
			
        </table>
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
