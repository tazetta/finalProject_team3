
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 리스트</title>
<!-- CSS boot -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
</head>
<style>
a {
	display: block;
	text-decoration: none;
	border-radius: 4px;
}
    a.page-link {
	color: gray;
	font-weight:bold;
}

a.page-link:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(173, 170, 169) 0 0px 0px 40px inset;
}
</style>
<body>
  


	            <jsp:include page="mainnavi.jsp"></jsp:include> 
		<!--  <div class="container" style="text-align: center; padding-top: 10px;">
			<select name="opt" id="searchOpt" style="border-radius: 5px;">
				<option value="all" selected>전체</option>
				<option value="subject">제목</option>
				<option value="content">글내용</option>
				<option value="id">작성자</option>
			</select> <input type="text" id="keyword" name="keyword" size="75"
				style="border-radius: 5px; border: 2px solid rgb(203, 228, 248);"
				placeholder="검색어를 입력해주세요.">
			<button id="btn" type="button"
				style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
			<span><a href=""
				style="font-size: small; float: right; color: gray; font-weight: bold;">|고객센터</a></span>
			<span><a href=""
				style="font-size: small; float: right; color: gray; font-weight: bold;">|회원가입</a></span>
			<span><a href=""
				style="font-size: small; float: right; color: gray; font-weight: bold;">로그인</a></span>
		</div>-->
	
	<hr />
	
	<div class="container">
		<table class="table table-hover">
			<thead style="background-color: rgb(170, 187, 247); color: white;">
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>

			<tbody id="list">
				<!--
				<c:forEach var="board" items="${boardList}" begin="0" end="9"
					step="1" varStatus="status">
					<tr>
						<td><a href="boarddetail/${board.boardIdx}">${board.subject}</a></td>
						<td>${board.id}</td>
						<td>${board.bhit}</td>
						<td>${board.reg_date}</td>
					</tr>
				</c:forEach>
				-->
			</tbody>
		</table>
		<hr />
		<button class="btn" id="btn2"
			style="border-radius: 5px; float:right; background-color: rgb(170, 187, 247); font-weight: bold; color: white;"
			onclick="location.href='boardWriteForm?boardCtgIdx=1'">글쓰기</button>
	</div>
		
				<div id="pagination-div"  style="padding-left:43%; margin-top:25px;"></div>


		
</body>

<script>
	var msg = "";
	if(${sessionScope.msg ne null}){
		msg = "${sessionScope.msg}";
	} else {
		msg = "${msg}";
	}
	if(msg != ""){
		alert(msg);
		msg = "";
	}

	// 페이지 로딩이 끝난 후 동작.
	/*
	$('button').click(function() {
		if ($('#keyword').val() == '') {
			alert("검색어를 입력해주세요.");
			$('#keyword').focus();
		} else {
			$("from").submit();
		}
	});
	*/
	$(document).ready(function() {
						// 목록을 조회하는 함수.
						function getList(pageNum, opt, keyword) {
							/*
							 * pageNum, opt, keyword
							 * 값이 없으면 초기값 사용.
							 * 값이 있으면 입력받은 값 사용.
							 */
							var pageNum = !pageNum ? 1 : pageNum;
							var opt = !opt ? 'all' : opt;
							var keyword = !keyword ? '' : keyword;
							var oData = {
								pageNum : pageNum,
								opt : opt,
								keyword : keyword
							};
							console.log(oData);

							$.ajax({
								url : '/main/api/freelist',
								type : 'GET',
								data : oData,
								dataType : 'JSON',
								success : function(data) {
									appendList(data.list);
									createPagination(data.total_page,pageNum);
								},
								error : function(error) {
									console.log('에러 났음...');
								}
							});
						}

						// 목록을 UI에 추가하는 함수.
						function appendList(aList) {
							// jquery의 반복문을 사용.
							var sHtml = '';
							$.each(aList,function(index, oInfo) {
												/*
												행 html 소스
												<tr>
													<td><a href="boarddetail/${board.boardIdx}">${board.subject}</a></td>
													<td>${board.id}</td>
													<td>${board.bhit}</td>
													<td>${board.reg_date}</td>
												</tr>
												 */
												sHtml += '<tr>';
												sHtml += '	<td><a href="boarddetail?boardIdx=' + oInfo.boardIdx +'">'
														+ oInfo.subject
														+ '</a></td>';
												sHtml += '	<td>' + oInfo.id
														+ '</td>';
												sHtml += '	<td>' + oInfo.bhit
														+ '</td>';
												sHtml += '	<td>'
														+ new Date(
																oInfo.reg_date)
																.toLocaleDateString("ko-KR")
														+ '</td>';
												sHtml += '</tr>';
											});

							$("#list").empty();
							$("#list").append(sHtml);
						}

						// 페이징 요소 생성
						var opt = '';
						var keyword = '';

						function createPagination(iTotalPage, iStartPage) {
							console.log('iTotalPage : ' + iTotalPage);
							$('#pagination-div').twbsPagination('destroy');
							$('#pagination-div').twbsPagination({
								totalPages : iTotalPage, // 총 페이지 번호 수 TODO:
								visiblePages : 5, // 하단에서 한번에 보여지는 페이지 번호 수
								startPage : iStartPage, // 시작시 표시되는 현재 페이지
								initiateStartPageClick : false, // 플러그인이 시작시 페이지 버튼 클릭 여부 (default : true)
								first : '<span aria-hidden="true"><<</span>', // 페이지네이션 버튼중 처음으로 돌아가는 버튼에 쓰여 있는 텍스트
								prev : "이전", // 이전 페이지 버튼에 쓰여있는 텍스트
								next : "다음", // 다음 페이지 버튼에 쓰여있는 텍스트
								last : '<span aria-hidden="true">>></span>', // 페이지네이션 버튼중 마지막으로 가는 버튼에 쓰여있는 텍스트
								// nextClass : "page-item next",	// 이전 페이지 CSS class
								// prevClass : "page-item prev",	// 다음 페이지 CSS class
								lastClass : "", // 마지막 페이지 CSS calss
								firstClass : "", // 첫 페이지 CSS class
								pageClass : "page-item", // 페이지 버튼의 CSS class
								activeClass : "active", // 클릭된 페이지 버튼의 CSS class
								disabledClass : "disabled", // 클릭 안된 페이지 버튼의 CSS class
								anchorClass : "page-link", //버튼 안의 앵커에 대한 CSS class

								onPageClick : function(event, page) {
									getList(page, opt, keyword);
								}
							});
						}

					

						// 버튼 click event 실행
						$('button#btn').on('click', function(e) {
							if ($('#keyword').val() == '') {
								alert("검색어를 입력해주세요.");
								$('#keyword').focus();
							} else {
							// 유저가 입력한 값이 무엇인지 가져와야 함.
							opt = $("#searchOpt").val();
							keyword = $("#keyword").val();

							// 목록을 조회한 후
							getList(1, opt, keyword);}
						});

						// 페이지 진입시 초기에 목록 조회.
						getList();
					});
</script>
</html>

