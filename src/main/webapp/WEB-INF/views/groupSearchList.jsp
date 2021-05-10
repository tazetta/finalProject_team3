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

<title>공동구매 검색리스트</title>
<style>
/*title*/
#groupTitle{
font-weight:600;
font-size:150%;
margin:20px;
margin-top:30px;
color:#337ab7;
/* 중앙정렬 */
display: flex; 
justify-content: center;
}

#groupTitle>a:hover{
text-decoration:none;
}


/*공동구매검색바*/
#groupSearch{
height:30px;
/*중앙정렬*/
display: flex; 
justify-content: center;

}
#search{
border:none;
background-color: lightgray;
border-radius:5px;
font-weight:600;
}
/*검색결과*/
#searchMsg{
/*중앙정렬*/
display: flex; 
justify-content: center;
margin-top:20px;

}
/*리스트*/
#listAll{
display: flex; 
justify-content: center;
margin-top: 30px;

}
#groupList table {
width: 70%;
}
#groupList table, #groupList td, #groupList th {
font-size:98%;
border-bottom: 1px solid lightgray;
border-collapse: collapse;
padding: 7px 10px;
text-align: center;
}
#groupList th{
background-color: #E0ECF8;
}


/*페이징*/
head td, #paging {
	text-align: center;
}
.container{
position: relative;
}
.pagination>li>a{
border:none;
}



/*글쓰기버튼*/
#writeBtn{
font-size:90%;
font-weight:600;
position: relative;
width:70px;
height:30px;
top:-60px;
left:520px;
border:none;
background-color: #424242;
color:white;
border-radius:5px;
}

/*검색결과없는 경우 링크*/
#goGroupLink{
/*중앙정렬*/
display: flex; 
justify-content: center;
margin-top:20px;
}

</style>
</head>
<body>
 <jsp:include page="mainnavi.jsp"></jsp:include> 
<span id="groupTitle"><a href="groupListPage">공동구매&무료나눔</a></span>
	<form action="groupSearch" id="groupSearch">

		<select id="searchOpt" name="opt" style="margin-right:10px;">
			<option value="all">전체</option>
			<option value="subject">제목</option>
			<option value="content">글내용</option>
			<option value="id">작성자</option>
		</select> 
		<input id="keyword" type="text" name="keyword" placeholder="검색어를 입력하세요" style="margin-right:10px; width:500px;" />
		<input id="search" type="button" value="검색" onclick="searchGroup()" />

	</form>
	<span id="searchMsg"></span>
	<div id="listAll">
	<table id="groupList">
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
			<td id="paging" colspan="8" style="border:none;">
				<!-- 플러그인 사용 -->
				<div class="container">
					<nav aria-label="pagenavigation" style="text-aglin: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
					<button onclick="location.href='groupWriteForm'" id="writeBtn">글쓰기</button>
				</div>

			</td>
		</tr>
	</table>
		</div>
</body>
<script>

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

var opt = "${searchOpt}";
var keyword = "${keyword}";

console.log(opt+"/"+keyword);

var showPage = 1;

//몇개/몇페이지 를 보여줄 것인지
listCall(showPage);  // 시작하자마자 이 함수를 호출

function listCall(reqPage) {
	var reqUrl = "./groupSearchList/"+10+"/"+reqPage+"/"+opt+"/"+keyword;  //요청url/보여줄갯수/현재페이지/옵션/키워드
	$.ajax({
		url : reqUrl,
		type : "get",
		data : {},
		dataType : "JSON",
		success : function(data) {
			console.log("success:"+data);
			console.log("range:"+data.range);
			showPage = data.currPage; //서비스에서 보낸 페이지를 현재 페이지에 넣기
			console.log(data.searchMsg);
			listPrint(data.list); //list내용을 뿌려주는 함수 실행
			searchMsg(data.searchMsg); //검색결과 msg 보여주는 함수 실행
			if(data.range !=0){
				/* 플러그인 사용한 페이징 처리*/
				$("#pagination").twbsPagination({
					startPage:data.currPage, //시작 페이지
					totalPages:data.range, //생성가능 최대 페이지
					visiblePages:5, //5개씩 보여주겠다(1~5)
					initiateStartPageClick : false, // 플러그인이 시작시 페이지 버튼 클릭 여부 (default : true)
					first : '<span aria-hidden="true"><<</span>', // 페이지네이션 버튼중 처음으로 돌아가는 버튼에 쓰여 있는 텍스트
					prev : "이전", // 이전 페이지 버튼에 쓰여있는 텍스트
					next : "다음", // 다음 페이지 버튼에 쓰여있는 텍스트
					last : '<span aria-hidden="true">>></span>', // 페이지네이션 버튼중 마지막으로 가는 버튼에 쓰여있는 텍스트
					anchorClass : "page-link", //버튼 안의 앵커에 대한 CSS class
					onPageClick:function(event,page){ //각 페이지를 클릭한 경우
						console.log("event: "+event);
						console.log("page: "+page);
						listCall(page);
					}
				});
			}else{ //검색결과가 없으면
				$("#listAll").css("display","none");
				var content ="";
				content +="<span id='goGroupLink'><a href='groupListPage'>공동구매&무료나눔 메인 리스트로 가기</a></span>"
				$("#searchMsg").after(content);
			}		
			
		},
		error : function(error) {
			console.log("error:"+error);
		}
	});
}

function searchMsg(searchMsg){
	$("#searchMsg").html(searchMsg);
}


function listPrint(list) {
var content = "";
var category="";
var progress="";
for (var i = 0; i < list.length; i++) {
console.log("진행상황:"+list[i].progIdx);
	if(list[i].progIdx == 1){ //진행중일 경우
	content += "<tr>"
	}else { //인원부족마감|마감인 경우
	content += "<tr style='background-color: #E6E6E6'>"
	}
	content += "<td>"+list[i].gpIdx+"</td>" //글번호
	
	if(list[i].gpCtgIdx == 1){
		category ="공동구매";
	}else{
		category="무료나눔";
	}
	content += "<td>"+category+"</td>" //글종류
	
	if(list[i].progIdx == 1){//현재상태
		content += "<td style='color:red'>진행중</td>" ;
	}else if(list[i].progIdx == 2){
		content += "<td >인원부족마감</td>";
	}else{
		content += "<td>마감</td>" ;
	}
	
	//JAVA에서 가끔 날짜가 milliseconds로 나올 경우..
	 var deadline = new Date(list[i].deadline); 
	content += "<td>"+deadline.toLocaleDateString("ko-KR")+"</td>" //마감날짜

	content += "<td><a href='groupDetail?gpIdx="+list[i].gpIdx+"&loginId=${sessionScope.loginId}' ' class='subject'>"+list[i].subject+"</a></td>" //제목
	content += "<td>"+list[i].id+"</td>"  //작성자
	content += "<td>"+list[i].gHit+"</td>" //남은자리(->조회수로 대체)
	
	 var reg_date = new Date(list[i].reg_date); 
	content += "<td>"+reg_date.toLocaleDateString("ko-KR")+"</td>"  //작성일
	content += "</tr>" 
	
}
$("#list").empty(); //#list안의 내용을 버려라
$("#list").append(content);

//말줄임
$('.subject').each(function(){
     var length = 20; //글자수
     $(this).each(function(){
        
       if($(this).text().length >= length){
         $(this).text($(this).text().substr(0,length)+'...');
       }
        
     });
   });
   
}


</script>
</html>