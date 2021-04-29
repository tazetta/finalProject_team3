<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 반응형 디자인을 위한 CSS/JS 라이브러리 -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야함) -->
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>

<title>공동구매 메인 리스트</title>
<style>
table {
	width: 70%;
	margin-top: 10px;
}

table, td, th {
	border: 1px solid;
	border-collapse: collapse;
	padding: 5px 10px;
}

head td, #paging {
	text-align: center;
}
</style>
</head>
<body>

<form action="groupSearch">
	<select id="searchOpt" name="opt">
		<option value="all">전체</option>
		<option value="subject">제목</option>
		<option value="content">글내용</option>
		<option value="id">작성자</option>
	</select>
	<input id="keyword" type="text" name="keyword" placeholder="검색어를 입력하세요" />
	<input id="search" type="button" value="검색" onclick="searchGroup()" />
	</form>


	<h3>공동구매 리스트 페이지</h3>
	<select name="opt" id="opt" onchange="optSelect(this)">
		<option value="0">전체보기</option>
		<option value="1">공동구매</option>
		<option value="2">무료나눔</option>
	</select>
	<button onclick="location.href='groupWriteForm'">글쓰기</button>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>글종류</th>
				<th>현재상태</th>
				<th>마감날짜</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>

		</thead>
		<tbody id="list">
			<!-- 불러온 데이터를 뿌리는 영역 -->

		</tbody>
		<tr>
			<td id="paging" colspan="8">
				<!-- 플러그인 사용 -->
				<div class="container">
					<nav aria-label="pagenavigation" style="text-aglin: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>

			</td>
		</tr>
	</table>
</body>
<script>
var msg="${msg}";

if(msg!=""){
	 alert(msg);
}

//검색어 입력 확인
function searchGroup(){
	var keyword = $("#keyword").val();
	console.log("keyword:"+keyword);
	if(keyword ==''){
		alert("검색어를 입력해주세요");
	}else{
		$("form").submit();
	}
}
 
//카테고리 옵션
var opt=0;

var showPage = 1;


listCall(showPage);  // 시작하자마자 이 함수를 호출

function optSelect(e) {
	console.log("opt.val:"+$("#opt").val());
	opt = $("#opt").val();
	listCall(showPage); //옵션이 변경될때마다 호출
}

   function listCall(reqPage) {
		var reqUrl = "./groupList/"+10+"/"+reqPage+"/"+opt;  //요청url/보여줄갯수/현재페이지/옵션
		$.ajax({
			url : reqUrl,
			type : "get",
			data : {},
			dataType : "JSON",
			success : function(data) {
				console.log("success:"+data);
				console.log("range:"+data.range);
				showPage = data.currPage; //서비스에서 보낸 페이지를 현재 페이지에 넣기
				listPrint(data.list); //list내용을 뿌려주는 함수 실행
						
				/* 플러그인 사용한 페이징 처리*/
				$("#pagination").twbsPagination({
					startPage:data.currPage, //시작 페이지
					totalPages:data.range, //생성가능 최대 페이지
					visiblePages:5, //5개씩 보여주겠다(1~5)
					onPageClick:function(event,page){ //각 페이지를 클릭한 경우
						console.log("event: "+event);
						console.log("page: "+page);
						listCall(page);
					}
				});
			},
			error : function(error) {
				console.log("error:"+error);
			}
		});
	}


   
 
function listPrint(list) {
	var content = "";
	var category="";
	var progress="";
	for (var i = 0 ; i < list.length ; i++) {

		content += "<tr>"
		content += "<td>"+list[i].gpIdx+"</td>" //글번호
		
		if(list[i].gpCtgIdx == 1){
			category ="공동구매";
		}else{
			category="무료나눔";
		}
		content += "<td>"+category+"</td>" //글종류
		
		if(list[i].progIdx == 1){
			progress="진행중";
		}else if(list[i].progIdx == 2){
			progress="인원부족마감";
		}else{
			progress="마감";
		}
		content += "<td>"+progress+"</td>" //현재상태
		
		//JAVA에서 가끔 날짜가 milliseconds로 나올 경우..
		 var deadline = new Date(list[i].deadline); 
		content += "<td>"+deadline.toLocaleDateString("ko-KR")+"</td>" //마감날짜
	
		content += "<td><a href='groupDetail?gpIdx="+list[i].gpIdx+"&loginId=${sessionScope.loginId}'>"+list[i].subject+"</a></td>" //제목
		content += "<td>"+list[i].id+"</td>"  //작성자
		content += "<td>"+list[i].gHit+"</td>" //남은자리(->조회수로 대체)
		
		 var reg_date = new Date(list[i].reg_date); 
		content += "<td>"+reg_date.toLocaleDateString("ko-KR")+"</td>"  //작성일
		content += "</tr>" 
		
	}
	$("#list").empty(); //#list안의 내용을 버려라
	$("#list").append(content);
}




</script>
</html>