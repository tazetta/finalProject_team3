<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>공동구매 글쓰기</title>
<style>
table, td {
	padding: 5px 10px;
	text-align: center;
	border: 1px solid black;
	border-collapse: collapse;
}

#editable {
	width: 600px;
	height: 400px;
	border: 1px solid gray;
	text-align: left;
	overflow: auto;
	padding: 5px;
}

.text{
	width: 100%;
}
</style>
</head>
<body>
 <jsp:include page="mainnavi.jsp"></jsp:include> 

	<form action="groupWrite" method="post">
		<table>
			<tr>
				<td><select name="groupCtg">
						<option value="1">공동구매</option>
						<option value="2">무료나눔</option>
				</select></td>
				<td><input type="text" name="subject"  id="subject" required="required" class="text"/>
				<input type="hidden" name="id" value="${sessionScope.loginId }"/> 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div contenteditable="true" id="editable"></div> 
					<input name="content" type="hidden" id="content" />
				</td>
			</tr>
			<tr>
				<td>오픈카카오톡 URL</td>
				<td><input type="text" name="chatUrl" id="chatUrl" class="text"/></td>
			</tr>
			<tr>
				<td>최대참여자</td>
				<td><input type="number" name="maxUser"  id="maxUser"  /></td>
			</tr>
			<tr>
				<td>마감날짜</td>
				<td><input type="Date" name="deadline" id="deadline" /></td>
			</tr>
		</table>
	</form>
	<input type="button" value="파일업로드" onclick="fileUp()" />
	<button onclick="location.href='groupListPage'">취소</button>
	<input type="button" id="save" value ="작성완료" />

</body>
<script>
	$("#save").click(function() {
		
		
		/* 유효성 검사 */
		var subject = $("#subject").val();
		var editable = $("#editable").html();
		var chatUrl = $("#chatUrl").val();
		var maxUser = $("#maxUser").val();
		var deadline = $("#deadline").val();
		if(subject==''|| content==''|| chatUrl=='' || maxUser=='' ||deadline=='' ){
			console.log("subject:"+subject);
			console.log("content:"+content);
			console.log("chatUrl:"+chatUrl);
			console.log("maxUser:"+maxUser);
			console.log("deadline:"+deadline);
			alert("모든 양식을 작성해주세요");
		}else{
			$("#editable>a").find("b").remove(); //a태그안 b태그 삭제
		 	$("#editable>a").removeAttr("onclick"); //del(this) 무효화
		 	$("#content").val($("#editable").html()); //입력한 값 content에 넣기
			$("form").submit(); 
		}		
	});
	
	/* 파일업로드 새창*/
	function fileUp(){
		window.open("groupUploadForm","fileUpload","width=400, height=100");
		//요청url,타이틀,옵션
	}
	
	/* 파일 삭제 - 비동기 */
	//groupuploadForm에서 보내는 elem확인
	function del(elem){
		console.log(elem); //<a>
		var newFileName = elem.id.substring(elem.id.lastIndexOf("/")+1); //파일명만 뽑아내기
		console.log(newFileName);

		// 1. 실제 파일 삭제 요청
		 $.ajax({
			url:"groupFileDelete",
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
	$("#deadline").change(function dateChk(e){
	 		var deadline = $(this).val();
	 		var defaultVal = $(this).prop("defaultValue");
	 		console.log("deadline:"+deadline);
	 		console.log("defaultVal:"+defaultVal);
	 	if(deadline<today){
	 		alert("마감일은 오늘날짜보다 이전으로 설정 할 수 없습니다.")
	 		$(this).val(defaultVal); 
	 	}
	});
	
	
</script>
</html>