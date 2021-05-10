<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>수정 상세보기</title>
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
a:link{
text-decoration:none;
}

/*테이블*/
#updateTable{
margin:0 auto;
width:800px;
position:relative;
}
#updateTable table, #updateTable td {
	padding: 5px 10px;
	border-collapse: collapse;
}

#editable {
	width: 800px;
	height: 500px;
	border: 1px solid gray;
	text-align: left;
	overflow: auto;
	padding: 5px;
}

input[type='text'] {
	width: 100%;
}
/*버튼*/
#btnBox{
display: flex; 
justify-content: center;
}

#fileBtn{
margin-right:600px;
border:none;
height:30px;
background-color: #424242;
color:white;
font-weight:600;
border-radius:4px;
}
.btn{
border:none;
height:30px;
background-color: dodgerblue;
color:white;
font-weight:600;
border-radius:4px;
}
</style>
</head>
<body>
 <jsp:include page="mainnavi.jsp"></jsp:include> 
 <span id="groupTitle"><a href="/main/groupListPage">공동구매&무료나눔</a></span>

	<form action="/main/groupUpdate" method="post">
		<table id="updateTable">
			<tr>
				<td colspan="2"><select name="gpCtgIdx" style="height:25px;">
					
						<option value="1">공동구매</option>					
						<option value="2">무료나눔</option>
				</select></td>
				
			</tr>
			<tr>
				
				<td colspan="2">
				<input type="text" name="subject" value="${dto.subject }" style="height:30px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input name="gpIdx" type="hidden" value="${dto.gpIdx}" />
					<div contenteditable="true" id="editable"> ${dto.content }</div> 
					<input name="content" type="hidden" id="content" />
				</td>
			</tr>
			<tr>
				<td style="width:150px; text-align:right;">오픈카카오톡 URL</td>
				<td><input type="text" name="chatURL" value="${dto.chatURL }"  style="height:30px;" /></td>
			</tr>
			<tr>
				<td style=" text-align:right;">최대참여자</td>
				<td><input type="number" name="maxUser" id="maxUser" style="height:25px; width:50px;"   value="${dto.maxUser }" min="0"></td>
			</tr>
			<tr>
				<td style=" text-align:right;">모집상태</td>
				<td>
				<select name="progIdx" id="progIdx"  style="height:25px;">
						<option value="1" <c:if test="${dto.progIdx == 1}">selected </c:if> >진행중</option>
						<option value="2" <c:if test="${dto.progIdx == 2}">selected</c:if>>인원부족마감</option>
						<option value="3" <c:if test="${dto.progIdx == 3}">selected</c:if>>마감</option>
				</select>
				</td>
			</tr>
			<tr>
				<td style=" text-align:right;">마감날짜</td>
				<td><input type="Date" name="deadline" id="deadline" value="${dto.deadline }" /></td>
			</tr>
		</table>
	</form>
		<div id="btnBox">
	<input type="button" value="파일업로드" onclick="fileUp()" id="fileBtn" >
	<button onclick="location.href='/main/groupDetail?gpIdx=${dto.gpIdx}&loginId=${sessionScope.loginId}'" class="btn" style="margin-right:10px;" >취소</button>
	<input type="button" id="save" value="수정완료" class="btn"/>
</div>
</body>

<script>

var msg = "${msg}";
if (msg != "") {
	alert(msg);
}


/* 글수정 전송*/
 $("#save").click(function() {
 	console.log($("#editable").html());
 	$("#editable>a").find("b").remove(); //a태그안 b태그 삭제
 	$("#editable>a").removeAttr("onclick"); //del(this) 무효화
 	$("#content").val($("#editable").html()); //input에 div값 넣기
 	$("form").submit();
 	
 });

/* 파일업로드 새창*/
function fileUp(){
	window.open("/main/groupUploadForm","fileUpload","width=400, height=100");
	//요청url,타이틀,옵션
}

/* 파일 삭제 - 비동기 */
//groupuploadForm에서 보내는 elem확인
function del(elem){
	console.log(elem); //<a>
	var newFileName = elem.id.substring(elem.id.lastIndexOf("/")+1); //파일명만 뽑아내기
	console.log("newFileName:"+newFileName);

	// 1. 실제 파일 삭제 요청
	 $.ajax({
		url:"/main/groupFileDelete",
		type:"get",
		data:{"fileName":newFileName},
		dataType:"json",
		success:function(d){
			console.log("success:"+d.success);
	// 2. 파일 삭제 요청이 완료되면 화면에 나타난 사진 삭제
			if(d.success ==1){ //실제 파일 삭제 성공시
				$(elem).find('img').remove(); //이미지 삭제
				/* $(elem).next().remove(); */ //<br> 삭제
				$(elem).remove(); // <a>삭제
			}
		},error:function(e){
			console.log(e);
		}
	}); 	
}

/* 최대참여자 수정시 적합성 여부 확인 */
$("#maxUser").change(function(e){
	var defaultVal = $(this).prop("defaultValue");
	var currVal = $(this).val();
	
	if(currVal < defaultVal){
		console.log("신청한 현재 인원보다 적은지 확인필요");
		console.log(defaultVal+"->"+currVal);
		var elem = [defaultVal,currVal];
		maxUserChk(elem);
	}
});

function maxUserChk(elem){
	console.log(elem);
	 $.ajax({
			url:"/main/currUserChk/${dto.gpIdx}/"+elem[1],
			type:"get",
			data:{},
			dataType:"json",
			success:function(data){
				console.log("현재신청인원:",data.currUser);
				
				if(data.currUser>elem[1]){//변경한 최대참여자수가 현재 신청인원수보다 작은 수 라면
					$("#maxUser").val(elem[0]);  //초기값으로 설정
					alert("현재신청한 인원보다 작게 설정할 수 없습니다");
					
				}else if(data.currUser==elem[1] && elem[1]>0){ //변경한 최대참여자수가 현재신청인원수와 같다면
					 if(confirm("현재신청인원수와 일치합니다. 마감하시겠습니끼?")){
						 //마감을 원한다면
						 console.log("마감O");
						  var selected = $("#progIdx option:selected").val();
						  $("#progIdx").val(3); //진행상태 마감으로 변경
					 }else{
						 //마감하지않길 원한다면
						 console.log("마감X");
						 alert("최대참여자수는 현재신청인원보다 커야합니다");
						 var maxUser = $("#maxUser").val();
						 maxUser =+ parseInt(maxUser)+1; 
						$("#maxUser").val(maxUser); //최대참여자수+1한 값을 강제
					 }	
				}
			},errer:function(error){
				console.log(error);
			}
		}); 	 
}

/* Date 타입 변환 함수*/
Date.prototype.format = function (f) {

    if (!this.valueOf()) return " ";
    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    var d = this;

    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear(); // 년 (4자리)
            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
            case "dd": return d.getDate().zf(2); // 일 (2자리)          
            default: return $1;
        }
    });
};

String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
Number.prototype.zf = function (len) { return this.toString().zf(len); };

var today = new Date();
today = today.format("yyyy-MM-dd"); //오늘날짜


/* 날짜 변경시  오늘 이전으로 설정하지 못하도록 강제*/
$("#deadline").on("change", function dateChk(e){
 		var deadline = $(this).val();
 		var defaultVal = $(this).prop("defaultValue");
 		console.log("deadline:"+deadline);
 		console.log("defaultVal:"+defaultVal);
 	if(deadline<today){
 		alert("마감일은 오늘날짜보다 이전으로 설정 할 수 없습니다.")
 		$(this).val(defaultVal); 
 	}
});



/* 진행중인 상태에서 마감으로 변경시 인원부족마감으로 변경*/
var selected = $("#progIdx option:selected").val(); //현재 선택되어있는 옵션가져오기

if(selected==1){ //진행중에서
	$("#progIdx").change(function(){ 
		if($("#progIdx").val() ==3){ //마감으로 변경시
			alert("현재 모집인원이 부족하여 인원부족마감으로 변경합니다");
			$("#progIdx").val(2); //인원부족마감으로 변경
		}
	
});
}
	
	
/*인원부족마감인 상태에서 진행중으로 변경시 오늘날짜 이후로 설정하도록 강제*/

if(selected==2){ //인원부족마감에서
	console.log("인원부족마감 상태임");
	$("#progIdx").change(function(){ 
		if($("#progIdx").val() ==1){ //진행중으로 변경시
			console.log("진행중으로 변경");
			var deadline = $("#deadline").val();
	 		console.log("deadline:"+deadline);
	 		console.log("today: "+today);
	 	if(deadline<today){
	 		alert("마감일은 오늘보다 이전으로 설정 할 수 없습니다.");
	 		$("#deadline").val(today); 
		}
	}
});
	/* 인원부족마감인 상태에서 날짜변경시 진행중으로 변경묻기*/
	$("#deadline").on("change", function dateChk(e){
 		var deadline = $(this).val();
 		var defaultVal = $(this).prop("defaultValue");
 		console.log("deadline:"+deadline);
 		console.log("defaultVal:"+defaultVal);
 	if(deadline>=today){
 		if(confirm("진행중으로 변경하시겠습니까?")){
 			$("#progIdx").val(1); //진행중으로 변경
 		}else{
 			$("#deadline").val(defaultVal);  //원래값으로 강제
 		}
 	}
});
	/*인원부족마감인 상태에서 마감으로 변경시 인원부족마감으로 강제*/
	$("#progIdx").change(function(){ 
		if($("#progIdx").val() ==3){ //마감으로 변경시
			alert("현재 모집인원이 부족하여 인원부족마감으로 변경합니다.");
			$("#progIdx").val(2); //인원부족마감으로 변경
		}
	
});
}

/*마감인 상태에서 진행중으로 변경시 최대참여자 수를 초기값보다 크게 설정하도록 강제*/
if(selected==3){ //마감상태에서
	console.log("마감상태임");
	$("#progIdx").change(function(){ 
		if($("#progIdx").val() ==1){ //진행중으로 변경시
			var maxUser = $("#maxUser").val();
			console.log("maxUser:"+maxUser);
			alert("최대참여자수는 기존값보다 커야합니다.");
			maxUser =+ parseInt(maxUser)+1; 
			$("#maxUser").val(maxUser);//최대참여자수+1한 값으로 강제변환
			
			$("#maxUser").change(function(e){
				var defaultVal = $(this).prop("defaultValue"); 
				var currVal = $(this).val();
				
				if(currVal <= defaultVal){ //입력값이 변경됐다면
					console.log("신청한 현재 인원보다 적은지 확인필요");
					console.log(defaultVal+"->"+currVal);
					var elem = [defaultVal,currVal];
					maxUserChk(elem); //최대참여자 적합성 여부를 확인하는 함수 호출
				}
			});
			
		}else if($("#progIdx").val() ==2){ //인원부족마감으로 변경시
			 if(confirm("이미 인원이 모집되어 마감되었습니다 진행중으로 바꾸시겠습니까?")){
				 //진행중으로 바꾸길 원한다면
				 $("#progIdx").val(1);  //진행중으로
				 var maxUser = $("#maxUser").val();
					console.log("maxUser:"+maxUser);
					alert("최대참여자수는 기존값보다 커야합니다.");
					maxUser =+ parseInt(maxUser)+1; 
					$("#maxUser").val(maxUser);//최대참여자수+1한 값으로 강제변환
			 }else{
				 //진행중으로 바꾸지 않는다면
				 $("#progIdx").val(3); //마감으로
			 }
		}
	});
	
	/*마감인 상태에서 최대인원 수정시 진행중으로 변경묻기*/
	$("#maxUser").change(function(e){
		var defaultVal = $(this).prop("defaultValue");
		var currVal = $(this).val();
		
		if(currVal > defaultVal){
			if(confirm("진행중으로 변경하시겠습니까?")){
	 			$("#progIdx").val(1); //진행중으로 변경
	 		}else{
	 			$(this).val(defaultVal); //원래값으로 강제
	 		}
		}
	});
}




	

 

</script>
</html>