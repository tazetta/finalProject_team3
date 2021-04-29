<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<title>상세보기</title>
<style>
table, td, th {
	width: 1100px;
	padding: 5px 10px;
	text-align: center;
	border: 1px solid black;
	border-collapse: collapse;
}

#kakaoLink {
	border: 1px solid gray;
}

#groupCnt {
	color: red;
	font-size: 130%;
}

#applyMember {
	margin: 10px;
}

#deadlinSpan {
	display: block;
	width: 90px;
	margin:0 auto;
	background-color : lightgray;


}
</style>
</head>
<body>
	<a href="/main/logout">로그아웃</a>
	<table>
		<tr>
			<th>idx</th>
			<th>카테고리</th>

			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>진행상황</th>
		</tr>
		<tr>
			<td>${dto.gpIdx}</td>
			<td>
				<%-- <c:if test="${dto.gpCtgIdx ==1}">공동구매</c:if> <c:if
					test="${dto.gpCtgIdx ==2}">무료나눔</c:if> --%> ${dto.category }
			</td>
			<td>${dto.subject}</td>
			<td>${dto.id}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.progress}</td>
		</tr>
		<tr>
			<td colspan="5" style="padding: 20px">${dto.content }</td>
			<td style="width: 20%">현재인원/모집인원 : <span id="groupCnt">${dto.currUser }/${dto.maxUser}</span>
				<br />마감날짜 : <b>${dto.deadline}</b> <br /> <%-- <c:if test="${state eq 'false' ||  empty state && dto.progIdx ne '3'}"> --%>
				<c:if test="${state eq 'false' ||  empty state }">
					<input type="button" id="toggleApply" value="신청" />
				</c:if> <c:if test="${state eq 'true'  && dto.progIdx ne '3'}">
					<input type="button" id="toggleApply" value="취소" />
				</c:if> <br /> <c:if test="${dto.currUser == dto.maxUser}">
					<span id="deadlinSpan">마감</span>
				</c:if>


			</td>
		</tr>
		<c:if test="${state eq 'true'  || dto.id == sessionScope.loginId }">
			<tr>
				<td colspan="6">
					<div id="kakaoLink">
						오픈카카오톡 링크 : <a href="${dto.chatURL }" target="_blanck">${dto.chatURL }</a>
					</div>

				</td>
			</tr>
			<tr>
				<td colspan="6"><b>신청자</b>
					<div id="applicant">
						<!-- 신청자 명단 불러올 영역 -->
					</div></td>
			</tr>
		</c:if>
	</table>
	<button onclick="location.href='groupListPage'">목록</button>
	<button onclick="location.href='groupDel/${dto.gpIdx}'">삭제</button>
	<button onclick="location.href='groupUpdateForm/${dto.gpIdx}'">수정</button>

	<hr />
	<b>댓글 <span>0</span></b>
	<div>현재 댓글이 없습니다</div>

</body>
<script>
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}

	var state = "${state}";
	console.log("State:" + state);

	//신청-취소 toggle
	$("#toggleApply")
			.click(
					function() {
						location.href = '/main/applyGroup/${dto.gpIdx}/${sessionScope.loginId}';
					});

	/* 신청자 명단 가져오기 */
	applyList();

	function applyList() {
		var reqUrl = './applyList/${dto.gpIdx}';
		$.ajax({
			url : reqUrl,
			type : "get",
			data : {},
			dataType : "JSON",
			success : function(data) {
				console.log("success:", data);

				for (var i = 0; i < data.list.length; i++) {
					console.log("id:" + data.list[i].id);
					var content = "";

					content += "<span id='applyMember'>" + data.list[i].id
							+ "</span>";

					$("#applicant").append(content);
				}

			},
			error : function(error) {
				console.log("error:", error);
			}
		});
	}

	if ("${dto.currUser}" == "${dto.maxUser}") { ///모집완료시 마감으로 변경
		progUpdate();
	}

	function progUpdate() {
		var reqUrl = './progUpdate/${dto.gpIdx}/${dto.progIdx}';
		$.ajax({
			url : reqUrl,
			type : "get",
			data : {},
			dataType : "JSON",
			success : function(data) {
				console.log("success: ", data);

			},
			error : function(error) {
				console.log("error:", error);
			}
		});
	}
</script>
</html>