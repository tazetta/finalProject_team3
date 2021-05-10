<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
         table,th,td{
            border: 1px solid lightgray;
            border-collapse: collapse;
            padding: 5px 10px;
            text-align: center;
         }
         th{
              background-color: rgb(144, 209, 240);
              color: white;
         }
         td{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
         }
         
         #mainnavi {
			position: absolute;
			top:5%;
			left:20%;
        }
        #side{
        	margin-left: 4%;
        	margin-top: 300px;
        }
        #box{
        	position:absolute;
        	top: 40%;
        	margin-left: 300px;
        }
		.업체정보{
            border:1px solid gainsboro;
            border-collapse: collapse;
            width: 200px;
            height: 200px;
            position: absolute;
            top:250px;
            margin-top: 30px;
            margin-left: 4%;
            text-align: center;
        }
         #paging{
            text-align: center;
         }
         #examList{
         	text-align: center;
         	position: absolute;
         	top: 40%;
    		left: 20%;
    		width: 400px;
         }
         
</style>
</head>
<body>
<jsp:include page="mainnavi.jsp"></jsp:include>
	<table class="업체정보">
			<tr>
				<td style="font-size: 20px; padding-top: 20px;"><strong>${comId}</strong>
				</td>
			</tr>
			<tr>
				<td style="color: gainsboro;">─────────</td>
			</tr>
			<tr>
				<td style="color: gray;">종합리모델링 기타</td>
			</tr>
			<tr>
				<td style="font-size: 25px;"><strong>★ ${rate}</strong></td>
			</tr>
		</table>
	<div id="side">

	</div>
	<input type="hidden" id ="comId" value="${comId}" readonly/>
	<table id="examList">
		<thead>
			<tr>
				<th>제목</th>
				<th>업체명</th>
				<th>작성일</th>
			</tr>
		</thead>
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
	//몇개를 보여줄 것인지 / 몇페이지
	listCall(showPage); //시작하자마자 이 함수를 호출

	function listCall(reqPage) {
		console.log("리스트콜 호출");
		var comId = $('#comId').val();
		console.log(comId);
		var reqUrl = './comExamList/' + reqPage+"/"+comId;
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
					initiateStartPageClick : false, // 플러그인이 시작시 페이지 버튼 클릭 여부 (default : true)
					first : '<span aria-hidden="true"><<</span>', // 페이지네이션 버튼중 처음으로 돌아가는 버튼에 쓰여 있는 텍스트
					prev : "이전", // 이전 페이지 버튼에 쓰여있는 텍스트
					next : "다음", // 다음 페이지 버튼에 쓰여있는 텍스트
					last : '<span aria-hidden="true">>></span>', // 페이지네이션 버튼중 마지막으로 가는 버튼에 쓰여있는 텍스트
					anchorClass : "page-link", //버튼 안의 앵커에 대한 CSS class
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
			content += "<td><a href='examDetail?combrdIdx="+list[i].combrdIdx+"'>" + list[i].subject + "</td>"
			content += "<td>" + list[i].comId + "</td>"
			//java에서 가끔 날짜가 milliseconds로 나올 경우..
			var date = new Date(list[i].reg_date);
			content += "<td>" + date.toLocaleDateString("ko-KR") + "</td>"
			content += "</tr>"
		}
		$('#list').empty();//계속 더해지는것을 방지하기 위해 내용 비우기
		$('#list').append(content);
	}
</script>
</html>