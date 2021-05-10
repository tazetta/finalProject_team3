<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<title>상세보기</title>
<style>
/*title*/
#groupTitle{
font-weight:600;
font-size:130%;
margin:20px;
margin-top:30px;
color:#337ab7;
/* 중앙정렬 */
display: flex; 
justify-content: center;
}
#groupTitle>a:visited{
color:#337ab7;
}

/*테이블*/
#detailAll{
display: flex; 
justify-content: center;
position:relative;
}
#groupTable{
margin-top:10px;
width: 1200px;

}

#groupTable table, #groupTable td, #groupTable th {
	padding: 5px 10px;
	text-align: center;
	border-bottom: 1px solid lightgray;
	border-collapse: collapse;
}


#groupCnt {
	color: red;
	font-size: 130%;
}

#applyMember {
	margin-left:6px;
	margin-right: 18px;
	font-weight:600;
}
#applicant{
margin:20px;
}
/*모집상태*/
.deadlineSpan {
	display: block;
	width: 100px;
	margin:0 auto;
	background-color : lightgray;
	padding:10px;
	border-radius:4px;
	font-weight:600;
}
/*신청-취소버튼*/
#toggleApply{
margin:10px;
width:80px;
height:40px;
border:none;
font-size:110%;
font-weight:600;
cursor:pointer;
background-color: #0080FF;
color:white;
border-radius:5px;

}

/*버튼*/
#btnBox{
width:300px;
position:relative;
margin:10px;
left:1300px;
}
.btnClass{
border:none;
font-weight:600;
font-size:90%;
color:gray;
background-color: white;
cursor:pointer;
}

/*댓글창 영역*/
#commentBox{
margin:0 auto;
text-align:center;
margin-top:15px;
}
#comment{
width:800px;
height:40px;
}

#loginId{
margin:20px;
}

/* 댓글리스트영역 */
#commentListDiv{
width:1000px;
margin:0 auto;
 
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
a:link{
text-decoration:none;
}

/*대댓글창 영역*/
#recommentBox{
	margin-left:50px;
}

#recomment{
width:800px;
height:40px;
}
#recommentSave{
margin:5px;
}

/*대댓글 리스트 영역*/
.recommentTable{
 width:900px;
 margin:10px;
 margin-left:70px;
 border-radius:5px;
 padding:8px;
}
.recommentTable{
background-color: #E6E6E6;
}

</style>
</head>
<body>
 <jsp:include page="mainnavi.jsp"></jsp:include> 
<span id="groupTitle"><a href="groupListPage">공동구매&무료나눔</a></span>
<div id="detailAll">
	<table id="groupTable">
		<tr >
			<th>글번호</th>
			<th>카테고리</th>

			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>진행상황</th>
		</tr>
		<tr >
			<td>${dto.gpIdx}</td>
			<td>
				 ${dto.category }
			</td>
			<td style="width:40%; font-weight:600;">${dto.subject}</td>
			<td><span class="grade">${writerGrade}</span>&nbsp;${dto.id}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.gHit}</td>
			<td>${dto.progress}</td>
		</tr>
		<tr >
			<td colspan="6" style="padding: 20px;  border-bottom:none; ">${dto.content}</td>
			<td style="width: 20%; border-bottom:none;">현재인원/모집인원 : <span id="groupCnt">${dto.currUser }/${dto.maxUser}</span>
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
				<td colspan="7" style="border-top:1px dashed dodgerblue; border-width:2px;  border-bottom:none; ">
					<div id="kakaoLink">
						오픈카카오톡 링크 &nbsp;&nbsp; <a href="${dto.chatURL }" target="_blanck">${dto.chatURL }</a>
					</div>

				</td>
			</tr>
			<tr>
				<td colspan="7" style="border-top:1px dashed dodgerblue; border-width:2px;"><br/><b>신청자</b>
					<div id="applicant">
						<!-- 신청자 명단 불러올 영역 -->
						<c:if test="${dto.currUser==0 }">
							<span>현재 신청자가 없습니다</span>
						</c:if>
					</div></td>
			</tr>
		</c:if>
		<c:if test="${state ne 'true'  && dto.id != sessionScope.loginId }">
		<tr>
			<td colspan="7" style="border-top:1px solid lightgray;">신청자와 작성자에게만 오픈 채팅 URL이 공유됩니다.</td>
		</tr>
		</c:if>
	</table>
	</div>
	<div id="btnBox">
	<!-- <button onclick="location.href='groupListPage'" style="margin-right:10px;">목록</button> -->
	<c:if test="${ dto.id != sessionScope.loginId }">
	<button onclick="reportBoard()" style="margin-right:8px;" class="btnClass">신고</button>
	</c:if>
	<c:if test="${ dto.id == sessionScope.loginId }">
	<button onclick="location.href='groupDel/${dto.gpIdx}'" style="margin-right:8px;" class="btnClass">삭제</button>
	<button onclick="location.href='groupUpdateForm/${dto.gpIdx}'" style="margin-right:8px;" class="btnClass">수정</button>
	</c:if>
	</div>
	
	


	<div id="commentBox">
	<span style="position:relative; left:-500; font-weight:600;">댓글 <span id="listSize"></span>개</span><br/><br/>
		<span><b id="loginId">${sessionScope.loginId }</b></span>
		<input type="text" name="comment" id="comment" placeholder="개인정보를 공유 및 요청하거나, 명예훼손, 무단 광고시 모니터링 후 삭제될수 있습니다"/>

		<input type="button" value="등록" id="commentSave" style="width:50px; height:40px; font-weight:600; border:none; background-color:#F7BE81; border-radius:4px;"/>
	</div>
	<c:if test="${listSize ='0' }">
	<div>현재 댓글이 없습니다</div>
	</c:if>
	<section id="commentListDiv">
	<!-- 댓글 불러올 영역 -->
	</section>
	

</body>
<script>


	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
	
	groupCommentList(); //댓글리스트 호출

	/*글 신고 새창*/
	function reportBoard(){
		window.open("groupRepBoardForm/${dto.gpIdx}","reportBoard","width=800, height=600");
		//요청url,타이틀,옵션
	}
	
	/*신청-취소 toggle*/
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
				console.log("applyListSuccess:", data);

				for (var i = 0; i < data.list.length; i++) {
						console.log("grade:",data.gradeList[i]);
						var content = "";
						content += "<span class='grade'>"+ data.gradeList[i]+"</span>";
						content += "<span id='applyMember'>" + data.list[i].id + "</span>";
						$("#applicant").append(content);
				}
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
				commentListPrint(data.list); //댓글 리스트 뿌리기
				recCommList(); //내가 추천한 댓글 이미지 활성화로 고정
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
		content +=	"<div id='commentDiv"+list[i].commIdx+"' style='margin-top:25px;'>";
		content += "<table class='commentTable'>";
		content += "<tr>";
		content += '<td style="width:14%; text-align:center;"><b>'+list[i].id+'</b></td>';
		content += '<td colspan="2" style="text-align:left; padding:5px;">';
		content += list[i].comments;
	 	content += '</td>';
		content += '</tr>';
		content += '<tr>';
		content += '<td style="width:14%; font-size:90%; color:gray; text-align:center;">';
		 var reg_date = new Date(list[i].reg_date); 	 
		content += reg_date.toLocaleDateString("ko-KR");
		content += '</td>';
		content += ' <td style="width:5%" >';
		//댓글추천 
		content += '<a href="javascript:void(0)"; onclick="commRec('+list[i].commIdx+')"><img alt="decommend" src="resources/images/decommend.png" width="15px" height="15px" id="'+list[i].commIdx+'"> </a>';
		//댓글 추천수
		if(list[i].recCnt!=0){
		content += '<span class="commIdxRecCnt">'+list[i].recCnt+'</span></td>';
		}
		content += '<td style="text-align:left; font-size:90%;">';
		//댓글삭제
		if("${sessionScope.loginId}"==list[i].id){
			content += '<a class="commDel" href="javascript:void(0)"; onclick="groupCommentDel('+list[i].commIdx+')" style="color: #FA5858;">삭제</a></td>' ; 
			
		}else{
		//대댓글작성
		content += '<a href="javascript:void(0)"; onclick="recommForm('+list[i].commIdx+')">답글달기</a>&nbsp;&nbsp;';
		//댓글 신고
		content += '<a href="javascript:void(0)"; onclick="repCommForm('+list[i].commIdx+')">신고</a></td>' ;
		}
		content += '</tr>';
		content += '</table>';
		content +=	"</div>";
		content +=	"<div id='recommentListDiv"+list[i].commIdx+"'></div>"; //대댓글 리스트 가져올 영역
	
		groupRecommList(list[i].commIdx); //대댓글 리스트 호출
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
	
	/* 댓글 추천-취소 */
	function commRec(commIdx){
		console.log("commIdx: "+commIdx);
		var reqUrl = "./groupCommRec/"+commIdx;
		$.ajax({
				url : reqUrl,
				type : "get",
				data : {},
				dataType : "JSON",
				success : function(data) {
					console.log("commRecSuccess: ", data);
					console.log("rescResult:"+data.recResult);
					if(data.recResult =='true'){
						console.log($("#"+commIdx+""));
						$("#"+commIdx+"").attr('src','resources/images/recommend.png');
						groupCommentList(); //댓글리스트 호출(댓글추천수 새로고침)
					}else{
						console.log($("#"+commIdx+""));
						$("#"+commIdx+"").attr('src','resources/images/decommend.png');
						groupCommentList(); //댓글리스트 호출(댓글추천수 새로고침)
					}
					
				},
				error : function(error) {
					console.log("error:", error);
				}
			});
	}
	
	/* 내가 추천한 댓글 이미지 활성화로 고정*/
	function recCommList(){
		var reqUrl = "./recCommList";
		$.ajax({
				url : reqUrl,
				type : "get",
				data : {},
				dataType : "JSON",
				success : function(data) {
					console.log("recommendSuccess: ", data);
					for (var i = 0; i < data.recCommList.length; i++) {
						console.log(data.recCommList[i].commIdx);
						$("#"+data.recCommList[i].commIdx+"").attr('src','resources/images/recommend.png');
					}		
				},
				error : function(error) {
					console.log("error:", error);
				}
			});
	}
	
	/*대댓글 창 노출*/
	function recommForm(commIdx){
		console.log("대댓글달기: "+commIdx);
		var content ="";
		content +='<div id="recommentBox">';
		content +='<span><b id="loginId">${sessionScope.loginId }</b></span>';
		content += '<input type="text" name="recomment" id="recomment" placeholder="개인정보를 공유 및 요청하거나, 명예훼손, 무단 광고시 모니터링 후 삭제될수 있습니다"/>';
		content += '<input type="button" value="등록" id="recommentSave" onclick="recommWirte('+commIdx+')"/>'; //대댓글 작성 호출
		content += '</div>';
		$("#commentDiv"+commIdx).after(content);
	}
	
	
	/*대댓글 작성*/
	function recommWirte(commIdx){
		var recomment = $("#recomment").val();
		var loginId = "${sessionScope.loginId }";
		console.log("loginID:"+loginId+"/commIdx"+commIdx+"/recomment:"+recomment);
		if(recomment!=''){
			
			$.ajax({
				url : "groupRecommWrite",
				type : "get",
				data : {"commIdx":commIdx,"comments":recomment, "loginId":loginId},
				dataType : "JSON",
				success : function(data) {
					console.log("recommWirteSuccess: ", data);
					alert(data.msg);
					$("#recommentBox").remove(); //대댓글창 삭제
					groupCommentList();//댓글 리스트 불러오기
				},
				error : function(error) {
					console.log("recommWirteError:", error);
				}
			});	
		}
	}
	
	/*대댓글 리스트 불러오기*/
	function groupRecommList(commIdx) {
		$.ajax({
			url : "groupRecommList/"+commIdx,
			type : "get",
			data : {},
			dataType : "JSON",
			success : function(data) {
				console.log("commentsListsuccess: ", data);
				for (var i = 0 ; i < data.list.length ; i++) {
					console.log(data.list[i].commIdx);
					groupRecommPrint(data.list[i]); //대댓글 리스트 뿌리기
				}
					console.log("--------------------------------");
			},
			error : function(error) {
				console.log("error:", error);
			}
		});
	}
	
	/*대댓글 리스트 뿌리기*/
	 function groupRecommPrint(list){
		var content ="";
		content +=	"<div id='recommentDiv"+list.commIdx+"'>";
		content += "<table class='recommentTable'>";
		content += "<tr>";
		content += '<td  style="width:14%;  text-align:center; padding:5px;"><b>'+list.id+'</b></td>';
		content += '<td colspan="2" style="text-align:left;">';
		content += list.comments;
	 	content += '</td>';
		content += '</tr>';
		content += '<tr>';
		content += '<td style=" font-size:90%; color:gray;  text-align:center; ">';
		 var reg_date = new Date(list.reg_date); 	 
		content += reg_date.toLocaleDateString("ko-KR");
		content += '</td>';
		content += ' <td  style="text-align:left; font-size:90%;">';
		//대댓글삭제
		if("${sessionScope.loginId}"==list.id){
			content += '<a class="commDel" href="javascript:void(0)"; onclick="groupRecommentDel('+list.com2ndIdx+')" style="color: #FA5858;">삭제</a>' ; 
			
		}else{
		content += '<a href="javascript:void(0)"; onclick="repRecommForm('+list.com2ndIdx+')">신고</a></td>' ;
		}
		content += '</tr>';
		content += '</table>';
		content +=	"</div>";

		$("#recommentListDiv"+list.commIdx).empty(); //#list안의 내용을 버려라
		$("#recommentListDiv"+list.commIdx).after(content);

	}
	
	/*대댓글 삭제*/
	function groupRecommentDel(com2ndIdx){
		//삭제 confirm	
		 if(confirm("정말로 삭제하시겠습니까?")){
			 
			var reqUrl = "./groupRecommDel/"+com2ndIdx;
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
	
	/* 댓글 신고 새창 */
	function repCommForm(commIdx){
		window.open("groupRepCommForm/1/"+commIdx,"reportComment","width=800, height=600");
	}
	
	/* 대댓글 신고 새창 */
	function repRecommForm(com2ndIdx){
		window.open("groupRepCommForm/2/"+com2ndIdx,"reportRecomment","width=800, height=600");
	}
	
	
</script>
</html>