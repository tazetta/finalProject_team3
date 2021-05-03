
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>자유게시판 상세보기</title>
<style>
#button {
	background-color: rgb(172, 172, 172);
	color: rgb(8, 8, 8);
	font-weight: bold;
	padding: 7px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 7%;
	border-radius: 5px;
}

#content {
	margin-top: 50px;
	margin-left: 300;
}

#contentbtn {
	background-color: rgb(172, 172, 172);
	color: rgb(8, 8, 8);
	font-weight: bold;
	padding: 7px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 7%;
	border-radius: 5px;
}
/* 생성된 댓글 테이블 설정*/
.commentTable {
	width: 1000px;
	margin: 10px;
}
/* 댓글작성란 스타일 */
#comment {
	background-color: rgb(241, 160, 122);
	color: rgb(8, 8, 8);
	font-weight: bold;
	padding: 7px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 800px;
	height: 40px;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="container" style="text-align: center;">
		<input type="text" size="75"
			style="border-radius: 5px; border: 2px solid rgb(203, 228, 248);"
			placeholder="검색어를 입력해주세요."> &nbsp;
		<button id="btn"
			style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248);">검색</button>
		<span><a href=""
			style="font-size: small; float: right; color: gray;">|고객센터</a></span> <span><a
			href="" style="font-size: small; float: right; color: gray;">|회원가입</a></span>
		<span><a href=""
			style="font-size: small; float: right; color: gray;">로그인</a></span>
	</div>
	<br />
	<br />
	<div class="container"
		style="text-align: center; padding-top: 100px; background-color: rgb(163, 182, 248);">
		
		제목${dto.subject}
		<div style="margin-top: 50px; margin-left: 300;">
			<button id="button" style="margin-left: 300;"
				onclick="location.href='../boardUpdateForm/${dto.boardIdx}'">수정</button>
			<button id="button" style="margin-left: 50;"
				onclick="location.href='../boardDel/${dto.boardIdx}'">삭제</button>
		</div>
		<!--style="
                    background-color: rgb(172, 172, 172);
                    color: rgb(8, 8, 8);
                    font-weight: bold;
                    padding: 7px;
                    margin: 8px 0;
                    border: none;
                    cursor: pointer;
                    width: 7%;
                    border-radius: 5px;"-->



	</div>
	<div class="container" style="text-align: center; padding-top: 100px;">

		${dto.content} 글번호:${dto.boardIdx} 조회수:${dto.bhit}
		카테고리:${dto.brdctgidx}
		<div id="content">
			<button id="contentbtn" style="margin-left: 300;">신고</button>
			<button id="contentbtn" style="margin-left: 50;">목록</button>
		</div>
	</div>
	<!--   <div class="container" style="text-align: center; ">
                <b>user</b> : <input type="text" size="75" placeholder="댓글을 입력해주세요."> 
                <button id="commentSave">댓글 작성</button>
            </div> -->
	<b>댓글 <span id="listSize"></span>개
	</b>
	<div id="commentBox" class="container" style="text-align: center;">
		<span><b name="loginId">${sessionScope.loginId }</b></span> <input
			type="text" name="comment" id="comment" placeholder="댓글을 입력해주세요" /> <input
			type="button" value="등록" id="commentSave" />
	</div>
	<c:if test="${listSize ='0' }">
		<div>현재 댓글이 없습니다</div>
	</c:if>
	<div id="commentListDiv"></div>


</body>
<script>
var msg = "${msg}";
if (msg != "") {
	alert(msg);
}

boardCommentList(); //댓글리스트

/* 댓글 등록 */
$("#commentSave").click(function(){
	var comment = $("#comment").val();
	/* var loginId = "${sessionScope.loginId}"; */
	var loginId = "sdk";
	var boardIdx ="${dto.boardIdx}";
	console.log("loginID:"+loginId+"/comment:"+comment);
	if(comment!=''){
		
		var reqUrl =' ../boardCommentWrite/${dto.boardIdx}'; 
		$.ajax({
			url : reqUrl,
			type : "GET",
			data : {"boardIdx":boardIdx,"comment":comment, "loginId":loginId},
			dataType : "JSON",
			success : function(data) {
				console.log("success: ", data);
				alert(data.msg);
				$("#comment").val('');
				boardCommentList();// 작성후 댓글 리스트 요청

			},
			error : function(error) {
				console.log("error:", error);
			}
		});	
	}
})

/* 댓글 목록 불러오기 */
	function boardCommentList() {
		var reqUrl = '../boardCommentList/'+${dto.boardIdx};
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
	content += '<td style="width:14% ">';
	
	 var reg_date = new Date(list[i].reg_date); 	 
	content += reg_date.toLocaleDateString("ko-KR");
	content += '</td>';
	content += ' <td style="width:5%" ><a href="#"><img alt="decommend" src="resources/images/interior3.jpg" width="15px" height="15px"> </a></td>'
	content += '<td style="text-align:left">';
	if("${sessionScope.loginId}"==list[i].id){
		content += '<button class="commDel" onclick="boardCommentDel('+list[i].commIdx+')">삭제</button></td>' ; //댓글삭제호출
		
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
function boardCommentDel(commIdx) {
	
	//삭제 confirm	
 		 if(confirm("정말로 삭제하시겠습니까?")){
 			 
 			var reqUrl = "./boardCommDel/"+commIdx;
 			$.ajax({
 				url : reqUrl,
 				type : "get",
 				data : {},
 				dataType : "JSON",
 				success : function(data) {
 					console.log("success: ", data);
 					boardCommentList(); //삭제 후 댓글리스트 요청
 					
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