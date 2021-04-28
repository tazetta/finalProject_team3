<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%String comId = (String)request.getSession().getAttribute("comId"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 반응형 디자인을 위한 css라이브러리 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야함) -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
	 table {
            width: 100%;
            margin-left: 50px;
            margin-top: 10px;
            max-width: 600px;
         }
         table,td{
            border: 1px solid;
            border-collapse: collapse;
            padding: 5px 10px;
         }
         td{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
         }
         #paging{
            text-align: center;
         }
</style>
</head>
<body>
	<h3>시공사례 리스트 페이지</h3>
	<!-- 업체세션있는 사람만 글쓰기 보이게 -->
	<%-- <c:if test="${comId ne null}">--%>
		<button onclick="location.href='./examWriteForm'">시공사례쓰기</button>
	<%--</c:if> --%>
	<table>
		<thead>
			<tr>
				<td>제목</td>
				<td>업체명</td>
				<td>작성일</td>
			</tr>
		</thead>
		<!-- <tbody id="list">
			불러온 데이터 뿌리는 영역
		</tbody> -->
		<!-- <tr>
			<td id="paging" colspan="6">
				플러그인 사용
				<div class="container">
					<nav aria-label="page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr> -->
	</table>
</body>
<script>
/* var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
	var showPage = 1;
	//몇개를 보여줄 것인지 / 몇페이지
	listCall(showPage); //시작하자마자 이 함수를 호출

	//Javascript
	var count = 0;
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	    //추가되는 임시 콘텐츠
	    //window height + window scrollY 값이 document height보다 클 경우,
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	//실행할 로직 (콘텐츠 추가)
	        count++;
	        var addContent = '<div class="block"><p>'+ count +'번째로 추가된 콘텐츠</p></div>';
	        //article에 추가되는 콘텐츠를 append
	        $('article').append(addContent);
	    }
	};
	
	function listCall(reqPage) {
		//Restful service는 ajax를 통해 호출하여 사용하는 경우가 많지만
		//restful service가 곧 ajax라고 생각해서는 안된다.
		var reqUrl = './examList/' + reqPage;
		$.ajax({
			url : reqUrl,
			type : 'GET',
			data : {},
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				showPage = data.currPage;
				listPrint(data.reviewList);
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
	
	function listPrint(interiorexamList) {
		console.log("listprint실행");
		console.log(interiorexamList.length);
		var content = "";
		for (var i = 0; i < interiorexamList.length; i++) {
			content += "<tr>"
			content += "<td><a href='reviewDetail?revIdx="+interiorexamList[i].revIdx+"'>" + interiorexamList[i].subject + "</td>"
			content += "<td>" + interiorexamList[i].comId + "</td>"
			//java에서 가끔 날짜가 milliseconds로 나올 경우..
			var date = new Date(reviewList[i].reg_date);
			content += "<td>" + date.toLocaleDateString("ko-KR") + "</td>"
			content += "</tr>"
		}
		$('#list').empty();//계속 더해지는것을 방지하기 위해 내용 비우기
		$('#list').append(content);
	} */
</script>
</html>