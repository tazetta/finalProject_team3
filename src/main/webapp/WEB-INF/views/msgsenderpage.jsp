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
    <style>

        .title-area{
            
            text-align: center;
            margin-bottom: 20px;
        }
       
        .title-area h3{
        }
        .title-area button{
          margin-left: 200px;
          position: absolute;
          background-color: #166cea;
            color: white;
          border: none;
           padding: 8px 8px;
           cursor: pointer;
           opacity: 0.9;
        }
        .delBtn{
            background-color: #166cea;
            color: white;
          border: none;
           padding: 8px 8px;
           cursor: pointer;
           opacity: 0.9;
           
        }
        #title{
            display: inline;
        }
        .table-area{
        	text-align: center;
        }
        .table-area th{
            
            padding: 10px 0px;
             text-align: center;
        }
        .table-area tr td{
            padding: 1px ;
       		 text-align: center;
            
        }
        .table-area th{
            background-color: #166cea;
            color: white;
            opacity: 0.9;
        }
        #writeButton:hover , .delBtn:hover{
            cursor: pointer;
            opacity: 1;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 3px 10px 0 rgba(0,0,0,0.19);
        }
        a{
            color: black;
            text-decoration: none;
        } 
        a:hover{
            color: #166cea;
            border-bottom:1px #166cea solid;
        }
       
    </style>
<body>
	 <div class="all-area">

        <div class="title-area">
            <h3 id="title">보낸 편지함</h3>
            <button id="writeButton">쪽지쓰기</button>
    </div>
    <div class="table-area">
        <table>
        <div class="th-area">
        <thead>
                <tr>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>날짜</th>
                    <th></th>
                </tr>
        </thead>
        </div>
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
	 
	 var reqUrl ='./msgSenderList/' + reqPagePerNum + "/" + reqPage;
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
	 
 function listPrint(list){
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
