<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>받은 쪽지함</title>
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
.body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.all-area {
	min-height: 900px;
	min-width: 1680px;
}

.mainnavi-area {
	
}

.sidenavi-area {
	float: left;
	width: 200px;
	height: 634px;
}

.table-area {
	float: left;
}

.table-top {
	text-align: center;
}

table th {
	width: 300px;
}
</style>

</head>
<body>
	<div class="all-area">

		<div class="mainnavi-area">
			<jsp:include page="mainnavi.jsp"></jsp:include>
		</div>
		
		<div class="table-area">
			<h3>전체 쪽지함</h3>
			<div class="table-top">
				<span>받은쪽지함</span> <a href="msgreceivepage">더보기</a>
				<button onclick="msgFormPopUp()">쪽지 쓰기</button>
			</div>
			<table>
				<thead>
					<tr>
						<th>작성자</th>
						<th>내용</th>
						<th>날짜</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="list">
					<tr>
						<td>자취만렙</td>
						<td><a href="msgDetail/84">테스트25</a></td>
						<td>2021. 5. 5.</td>
						<td><button class="delBtn" onclick="deleteMsg(84)">삭제</button></td>
					</tr>
					<tr>
						<td>자취만렙</td>
						<td><a href="msgDetail/83">테스트24</a></td>
						<td>2021. 5. 5.</td>
						<td><button class="delBtn" onclick="deleteMsg(83)">삭제</button></td>
					</tr>
					<tr>
						<td>자취만렙</td>
						<td><a href="msgDetail/82">테스트23</a></td>
						<td>2021. 5. 5.</td>
						<td><button class="delBtn" onclick="deleteMsg(82)">삭제</button></td>
					</tr>
					<tr>
						<td>자취만렙</td>
						<td><a href="msgDetail/81">테스트22</a></td>
						<td>2021. 5. 5.</td>
						<td><button class="delBtn" onclick="deleteMsg(81)">삭제</button></td>
					</tr>
					<tr>
						<td>자취만렙</td>
						<td><a href="msgDetail/80">테스트22</a></td>
						<td>2021. 5. 5.</td>
						<td><button class="delBtn" onclick="deleteMsg(80)">삭제</button></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td class="paging" colspan="6">
							<!-- 플러그인 사용 -->
							<div class="container">
								<nav aria-label="page navigation" style="text-align: center">
									<ul class="pagination" id="pagination">
										<li class="page-item first disabled"><a href="#"
											class="page-link">First</a></li>
										<li class="page-item prev disabled"><a href="#"
											class="page-link">Previous</a></li>
										<li class="page-item active"><a href="#"
											class="page-link">1</a></li>
										<li class="page-item"><a href="#" class="page-link">2</a></li>
										<li class="page-item"><a href="#" class="page-link">3</a></li>
										<li class="page-item"><a href="#" class="page-link">4</a></li>
										<li class="page-item next"><a href="#" class="page-link">Next</a></li>
										<li class="page-item last"><a href="#" class="page-link">Last</a></li>
									</ul>
								</nav>
							</div> <!--// 플러그인 사용 -->
						</td>
					</tr>
				</tbody>
			</table>

			<div class="table-top">
				<span>보낸 쪽지함</span> <a href="msgsenderpage">더보기</a>
			</div>
			<table>
				<thead>
					<tr>
						<th>작성자</th>
						<th>내용</th>
						<th>날짜</th>
						<th></th>

					</tr>
				</thead>
				<tbody id="list2">
					<tr>
						<td>kthwan</td>
						<td><a href="msgDetail/107">하위</a></td>
						<td>2021. 5. 6.</td>
						<td><button class="delBtn" onclick="deleteMsg(107)">삭제</button></td>
					</tr>
					<tr>
						<td>kthwan</td>
						<td><a href="msgDetail/106">hihi</a></td>
						<td>2021. 5. 6.</td>
						<td><button class="delBtn" onclick="deleteMsg(106)">삭제</button></td>
					</tr>
					<tr>
						<td>kthwan</td>
						<td><a href="msgDetail/66">테스트9</a></td>
						<td>2021. 5. 5.</td>
						<td><button class="delBtn" onclick="deleteMsg(66)">삭제</button></td>
					</tr>
					<tr>
						<td>kthwan</td>
						<td><a href="msgDetail/65">테스트8</a></td>
						<td>2021. 5. 5.</td>
						<td><button class="delBtn" onclick="deleteMsg(65)">삭제</button></td>
					</tr>
					<tr>
						<td>kthwan</td>
						<td><a href="msgDetail/64">테스트7</a></td>
						<td>2021. 5. 5.</td>
						<td><button class="delBtn" onclick="deleteMsg(64)">삭제</button></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td class="paging" colspan="6">
							<!-- 플러그인 사용 -->
							<div class="container">
								<nav aria-label="page navigation" style="text-align: center">
									<ul class="pagination" id="pagination2">
										<li class="page-item first disabled"><a href="#"
											class="page-link">First</a></li>
										<li class="page-item prev disabled"><a href="#"
											class="page-link">Previous</a></li>
										<li class="page-item active"><a href="#"
											class="page-link">1</a></li>
										<li class="page-item"><a href="#" class="page-link">2</a></li>
										<li class="page-item"><a href="#" class="page-link">3</a></li>
										<li class="page-item next"><a href="#" class="page-link">Next</a></li>
										<li class="page-item last"><a href="#" class="page-link">Last</a></li>
									</ul>
								</nav>
							</div> <!--// 플러그인 사용 -->
						</td>
					</tr>
				</tbody>
			</table>

		</div>
</body>
<script>
	function msgFormPopUp() {
		var url = "msgFormPopUp";

		window.open(url, "쪽지보내기폼", "width=500, height=450");

	}
	function msgDetailPopUp(idx) {
		var url = "msgDetailPopUp/" + idx;

		window.open(url, "쪽지 상세보기", "width=500, height=450");
	}

	var showPage = 1;
	var pagePerNum = 5;
	listCall(showPage, pagePerNum);
	listCall2(showPage, pagePerNum);
	function listCall(reqPage, reqPagePerNum) {

		var reqUrl = './msgReceiveList/' + reqPagePerNum + "/" + reqPage;
		$.ajax({
			url : reqUrl,
			type : 'GET',
			data : {},
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				showPage = data.currPage;
				console.log(showPage);
				console.log(data.list);
				listPrint(data.list);

				$("#pagination").twbsPagination({
					startPage : data.currPage,//시작 페이지
					totalPages : data.range,//생성 가능 최대 페이지
					visiblePages : 5,//5개씩 보여 주겠다.(1~5)
					onPageClick : function(evt, page) {//각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall(page, pagePerNum);
					}
				});
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	function listCall2(reqPage, reqPagePerNum) {

		var reqUrl = './msgSenderList/' + reqPagePerNum + "/" + reqPage;
		$.ajax({
			url : reqUrl,
			type : 'GET',
			data : {},
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				showPage = data.currPage;
				console.log(showPage);
				console.log(data.list);
				//listPrint(data.list);
				listPrint2(data.list);
				$("#pagination2").twbsPagination({
					startPage : data.currPage,//시작 페이지
					totalPages : data.range,//생성 가능 최대 페이지
					visiblePages : 5,//5개씩 보여 주겠다.(1~5)
					onPageClick : function(evt, page) {//각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall2(page, pagePerNum);
					}
				});
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

	function listPrint(list) {
		//var content = "";
		//for(var i = 0; i<list.length; i++){
		var content = "";
		for (var i = 0; i < list.length; i++) {
			console.log(list[i].content.length);
			var contentMsg = list[i].content;
			var str = "";
			console.log(contentMsg)
			if (contentMsg.length > 10) {

				console.log(contentMsg.substring(0, 10));
				str = contentMsg.substring(0, 10);
				str += '...';
			} else {
				str = contentMsg;
			}
			console.log(list[i].content.length);
			content += "<tr>"
			content += "<td>" + list[i].sender + "</td>"
			content += "<td><a href='#' id=" + list[i].msgIdx
					+ " onclick='msgDetailPopUp(" + list[i].msgIdx + ")'>"
					+ str + "</td>"
			var date = new Date(list[i].reg_date);
			content += "<td>" + date.toLocaleDateString("ko-KR") + "</td>"
			content += "<td><button class=\"delBtn\"  onclick=\"deleteMsg("
					+ list[i].msgIdx + ")\"" + ">삭제</button></td>"
			//content +="<td><button onclick=\"location.href='msgDelete/"+list[i].msgIdx+"'\">삭제</button></td>"
			content += "</tr>"
		}
		$("#list").empty();
		$("#list").append(content);
	}

	function listPrint2(list) {
		var content = "";
		for (var i = 0; i < list.length; i++) {
			console.log(list[i].content.length);
			var contentMsg = list[i].content;
			var str = "";
			console.log(contentMsg)
			if (contentMsg.length > 10) {

				console.log(contentMsg.substring(0, 10));
				str = contentMsg.substring(0, 10);
				str += '...';
			} else {
				str = contentMsg;
			}
			content += "<tr>"
			content += "<td>" + list[i].sender + "</td>"
			content += "<td><a href='#' id=" + list[i].msgIdx
					+ " onclick='msgDetailPopUp(" + list[i].msgIdx + ")'>"
					+ str + "</td>"
			var date = new Date(list[i].reg_date);
			content += "<td>" + date.toLocaleDateString("ko-KR") + "</td>"
			content += "<td><button class=\"delBtn\"  onclick=\"deleteMsg("
					+ list[i].msgIdx + ")\"" + ">삭제</button></td>"
			//content +="<td><button onclick=\"location.href='msgDelete/"+list[i].msgIdx+"'\">삭제</button></td>"
			content += "</tr>"
		}
		$("#list2").empty();
		$("#list2").append(content);
	}

	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
	function deleteMsg(msgIdx) {
		if (confirm("정말 삭제하시겠습니까?")) {

			var params = {};

			params.msgIdx = msgIdx;
			$.ajax({
				type : 'get',
				url : 'msgDelete/' + msgIdx,
				data : {},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					alert(data.msg);
					location.reload(true);
				},
				error : function(e) {
				}
			})

		}
	}
</script>
</html>