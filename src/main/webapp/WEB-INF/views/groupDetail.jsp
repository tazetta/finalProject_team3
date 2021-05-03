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

.deadlineSpan {
	display: block;
	width: 100px;
	margin:0 auto;
	background-color : lightgray;
	padding:10px;
}
#comment{
width:800px;
height:40px;
}

#loginId{
margin:20px;
}
.commentTable{
width:1000px;
margin:10px;
}
.commDel{
border:none;
}
.grade{
color:orange;
font-weight:600;
font-size:90%;
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
				 ${dto.category }
			</td>
			<td>${dto.subject}</td>
			<td><span class="grade">${writerGrade}</span>&nbsp;${dto.id}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.progress}</td>
		</tr>
		<tr>
			<td colspan="5" style="padding: 20px">${dto.content}</td>
			<td style="width: 20%">현재인원/모집인원 : <span id="groupCnt">${dto.currUser }/${dto.maxUser}</span>
				<br />마감날짜 : <b>${dto.deadline}</b> <br /> 
				
				<c:if test="${ dto.progIdx eq '1'  && state eq 'false' ||  empty state  }">
					<input type="button" id="toggleApply" value="신청" />
				</c:if> <c:if test="${dto.progIdx eq '1'  && state eq 'true'  }">
					<input type="button" id="toggleApply" value="취소" />
				</c:if> <br /> <c:if test="${dto.currUser == dto.maxUser && dto.progIdx eq '3'}">
					<span class="deadlineSpan">마감</span>
				</c:if>
				<c:if test="${dto.currUser<dto.maxUser && dto.progIdx eq '2'}">
					<span class="deadlineSpan">인원부족마감</span>
				</c:if>


			</td>
		</tr>
		<c:if test="${state eq 'true'  || dto.id == sessionScope.loginId }">
		<!-- 신청자와 작성자에게만 노출 -->
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
	<c:if test="${ dto.id == sessionScope.loginId }">
	<button onclick="location.href='groupDel/${dto.gpIdx}'">삭제</button>
	<button onclick="location.href='groupUpdateForm/${dto.gpIdx}'">수정</button>
	</c:if>
	
	

	<hr />
	<b>댓글 <span id="listSize"></span>개</b>
	<div id="commentBox">
		<span><b id="loginId">${sessionScope.loginId }</b></span>
		<input type="text" name="comment" id="comment" placeholder="개인정보를 공유 및 요청하거나, 명예훼손, 무단 광고시 모니터링 후 삭제될수 있습니다"/>

		<input type="button" value="등록" id="commentSave"/>
	</div>
	<c:if test="${listSize ='0' }">
	<div>현재 댓글이 없습니다</div>
	</c:if>
	<div id="commentListDiv">
	
	</div>

</body>
<script>


	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
	
	groupCommentList(); //댓글리스트

	//신청-취소 toggle
	$("#toggleApply").click(function() {
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

	/* 모집인원 달성시 마감으로 변경 */
	if ("${dto.currUser}" == "${dto.maxUser}" && "${dto.progIdx}" !='3') { 
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
	
	/* 댓글 등록 */
	$("#commentSave").click(function(){
		var comment = $("#comment").val();
		var loginId = "${sessionScope.loginId }";
		var gpIdx ="${dto.gpIdx}";
		console.log("loginID:"+loginId+"/comment:"+comment);
		if(comment!=''){
			
			var reqUrl =' ./groupCommentWrite'; 
			$.ajax({
				url : reqUrl,
				type : "get",
				data : {"gpIdx":gpIdx,"comment":comment, "loginId":loginId},
				dataType : "JSON",
				success : function(data) {
					console.log("success: ", data);
					alert(data.msg);
					$("#comment").val('');
					groupCommentList();// 작성후 댓글 리스트 요청

				},
				error : function(error) {
					console.log("error:", error);
				}
			});	
		}
	})
	

	/* 댓글 목록 불러오기 */
	function groupCommentList() {
		var reqUrl = './groupCommentList/${dto.gpIdx}';
		$.ajax({
			url : reqUrl,
			type : "get",
			data : {},
			dataType : "JSON",
			success : function(data) {
				console.log("success: ", data);
				console.log("listSize:"+data.listSize);
				$("#listSize").html(data.listSize);
				commentListPrint(data.list);
			},
			error : function(error) {
				console.log("error:", error);
			}
		});
	}
	
	/* 댓글 리스트 뿌리기 */
	function commentListPrint(list){
		var content ="";
		for (var i = 0 ; i < list.length ; i++) {
		content += "<table class='commentTable'>";
		content += "<tr>";
		content += '<td style="width:14%;"><b>'+list[i].id+'</b></td>';
		content += '<td colspan="2" style="text-align:left">';
		content += list[i].comments;
	 	content += '</td>';
		content += '</tr>';
		content += '<tr>';
		content += '<td style="width:14%; font-size:90%; color:gray; ">';
		 var reg_date = new Date(list[i].reg_date); 	 
		content += reg_date.toLocaleDateString("ko-KR");
		content += '</td>';
		content += ' <td style="width:5%" >';
		content += '<a href="#"><img alt="decommend" src="resources/images/decommend.png" width="15px" height="15px"> </a>';
		content += '</td>';
		content += '<td style="text-align:left">';
		if("${sessionScope.loginId}"==list[i].id){
			content += '<button class="commDel" onclick="groupCommentDel('+list[i].commIdx+')">삭제</button></td>' ; //댓글삭제호출
			
		}else{
		content += '<a href="#">답글달기</a>&nbsp;&nbsp;';
		content += '<a href="#">신고</a></td>' ;
		}
		content += '</tr>';
		content += '</table>';
		
		}
		$("#commentListDiv").empty(); //#list안의 내용을 버려라
		$("#commentListDiv").append(content);
	
	}
	
	/* 댓글삭제 */
	function groupCommentDel(commIdx) {
		
		//삭제 confirm	
	 		 if(confirm("정말로 삭제하시겠습니까?")){
	 			 
	 			var reqUrl = "./groupCommDel/"+commIdx;
	 			$.ajax({
	 				url : reqUrl,
	 				type : "get",
	 				data : {},
	 				dataType : "JSON",
	 				success : function(data) {
	 					console.log("success: ", data);
	 					groupCommentList(); //삭제 후 댓글리스트 요청
	 					
	 				},
	 				error : function(error) {
	 					console.log("error:", error);
	 				}
	 			});
	 			
	 			}else{
	 				console.log("삭제취소");
	 			}	
	}
	
	
</script>
</html>