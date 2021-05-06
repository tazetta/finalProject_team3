
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
.commDel{
border:none;
}
.commentDiv{
	border:2px solid red;
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
.recommentTable{
background-color: #F2F1F1;
}

#recomment{
width:800px;
height:40px;
}
#recommentSave{
margin:5px;
}
#loginId{
margin:20px;
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
				<button id="button" style="margin-left: 50;"
				onclick="location.href='../boardCntUp/${dto.boardIdx}'">추천하기</button>
				<button id="button" style="margin-left: 50;"
				onclick="location.href='../boardCntDown/${dto.boardIdx}'">추천취소</button>
				<button id="button" style="margin-left: 50;"
				onclick="location.href='../boardScrap/${dto.boardIdx}/${dto.id}'">스크랩</button>
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
		아이디:${dto.id} <br>
		내용: ${dto.content} <br>
		글번호: ${dto.boardIdx} <br>
		조회수: ${dto.bhit} <br>
		카테고리: ${dto.brdctgidx} <br>
		추천수: ${dto.CNTRECO}
		<div id="content">
			<button id="contentbtn" style="margin-left: 300;">신고</button>
			<button onclick="location.href='../Freelist'" id="contentbtn" style="margin-left: 50;">목록</button>
		</div>
	</div>
	<!--   <div class="container" style="text-align: center; ">
                <b>user</b> : <input type="text" size="75" placeholder="댓글을 입력해주세요."> 
                <button id="commentSave">댓글 작성</button>
            </div> -->
            
       <hr />     
	<b>댓글 <span id="listSize"></span>개
	</b>
	<div id="commentBox" class="container" style="text-align: center;">
		<span><b id="loginId">${sessionScope.loginId }</b></span> <input
			type="text" name="comment" id="comment" placeholder="댓글을 입력해주세요" /> <input
			type="button" value="등록" id="commentSave" />
	</div>
	<div id="commentListDiv">
	
	</div>


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
	var loginId = "${sessionScope.loginId}"; 
	var boardIdx ="${dto.boardIdx}";
	console.log("loginID:"+loginId+"/comment:"+comment);
	if(comment!=''){
		
		var reqUrl =' ../boardCommentWrite'; 
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
				if(data.listSize == 0){
					$("#commentListDiv").html("현재 댓글이 없습니다!");
				} else {
					commentListPrint(data.list);
					recCommList(); //내가 추천한 댓글 이미지 활성화로 고정
				}
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
		content +=	"<div id='commentDiv"+list[i].commIdx+"'>";
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
		content += ' <td style="width:7%" >';
		//댓글추천 
		content += '<a href="javascript:void(0)"; onclick="boardCommRec('+list[i].commIdx+')"><img alt="decommend" src="resources/images/decommend.png" width="15px" height="15px" id="'+list[i].commIdx+'"> </a>';
		//댓글 추천수
		if(list[i].recCnt!=0){
		content += '<span class="commIdxRecCnt">'+list[i].recCnt+'</span></td>';
		}
		content += '<td style="text-align:left">';
	
	if("${sessionScope.loginId}"==list[i].id){
		 content += '<button class="commDel" id="+list[i].commIdx+" onclick="boardCommentDel('+list[i].commIdx+')">삭제</button></td>' ; //댓글삭제호출 
	}else{
		//대댓글작성
	content += '<button class="commDel" id="+list[i].commIdx+" onclick="boardCommentDel('+list[i].commIdx+')">삭제</button></td>' ; //댓글삭제호출 
	content +='<a href="javascript:void(0)"; onclick="recommForm('+list[i].commIdx+')">답글달기</a>&nbsp;&nbsp;';
	content +=  '<a href="#">신고</a></td>' ;
	}
	content += '</tr>';
	content += '</table>';
	content +=	"</div>";
	content +=	"<div id='recommentListDiv"+list[i].commIdx+"'></div>"; //대댓글 리스트 가져올 영역
	boardRecommList(list[i].commIdx); //대댓글 리스트 호출
	}
	$("#commentListDiv").empty(); //#list안의 내용을 버려라
	$("#commentListDiv").append(content);

}
/* 댓글삭제 */
function boardCommentDel(commIdx) {
	
	//삭제 confirm	
 		 if(confirm("정말로 삭제하시겠습니까?")){
 			  var reqUrl = "../boardCommDel/"+commIdx;
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
/* 내가 추천한 댓글 이미지 활성화로 고정*/
function recCommList(){
	var reqUrl = "../brdrecCommList";
	$.ajax({
			url : reqUrl,
			type : "get",
			data : {},
			dataType : "JSON",
			success : function(data) {
				console.log("recCommListsuccess: ", data);
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
	content += '<input type="text" name="recomment" id="recomment" placeholder="답글 작성해주세요."/>';
	content += '<input type="button" value="등록" id="recommentSave" onclick="recommWirte('+commIdx+')"/>';
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
			url : "../boardRecommWrite",
			type : "get",
			data : {"commIdx":commIdx,"comments":recomment, "loginId":loginId},
			dataType : "JSON",
			success : function(data) {
				console.log("recommWirteSuccess: ", data);
				alert(data.msg);
				$("#recommentBox").remove();
			},
			error : function(error) {
				console.log("recommWirteError:", error);
			}
		});	
	}
}
/*대댓글 리스트 불러오기*/
function boardRecommList(commIdx) {
	$.ajax({
		url : "../boardRecommList/"+commIdx,
		type : "get",
		data : {},
		dataType : "JSON",
		success : function(data) {
			console.log("commentsListsuccess: ", data);
			for (var i = 0 ; i < data.list.length ; i++) {
				console.log(data.list[i].commIdx);
				boardRecommPrint(data.list[i]); //대댓글 리스트 뿌리기
			}
				console.log("--------------------------------");
		},
		error : function(error) {
			console.log("error:", error);
		}
	});
}

/*대댓글 리스트 뿌리기*/
 function boardRecommPrint(list){
	var content ="";
	content +=	"<div id='recommentDiv"+list.commIdx+"'>";
	content += "<table class='recommentTable'>";
	content += "<tr>";
	content += '<td  style="width:14%"><b>'+list.id+'</b></td>';
	content += '<td colspan="2" style="text-align:left">';
	content += list.comments;
 	content += '</td>';
	content += '</tr>';
	content += '<tr>';
	content += '<td style=" font-size:90%; color:gray; ">';
	 var reg_date = new Date(list.reg_date); 	 
	content += reg_date.toLocaleDateString("ko-KR");
	content += '</td>';
	content += ' <td  style="text-align:left">';
	//대댓글삭제
	if("${sessionScope.loginId}"==list.id){
		content += '<button class="commDel" onclick="boardRecommentDel('+list.com2ndIdx+')">삭제</button>' ; 
		
	}else{
	content += '<a href="#">신고</a></td>' ;
	}
	content += '</tr>';
	content += '</table>';
	content +=	"</div>";

	$("#recommentListDiv"+list.commIdx).empty(); //#list안의 내용을 버려라
	$("#recommentListDiv"+list.commIdx).after(content);

}
</script>
</html>