
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset= "UTF-8">
<title>자유게시판 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 부트스트랩 사용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>


</head>
<style>
a,.button {
	text-decoration: none;
    border-radius: 10px;
}
a.button,.button {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(230, 226, 224);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 2px inset;
	border: 1px  rgb(230, 226, 224);
}

a.button:hover,.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;
}

a.button2,.button2 {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(255, 210, 180);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 2px inset;
	border-radius: 10px;
	border: 1px  rgba(30, 22, 54, 0.6);
	
}

a.button2:hover,.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 40px inset;
}
</style>




<body>

    
    <form name = "form" method="POST" action="boardWrite">
    	<input type="hidden" value="1" name="boardCtgIdx"/>
    	<input type="hidden" value="${sessionScope.loginId}" name="id"/>
      	 <div style="min-height: 210px; padding-top:50px;">
	            <jsp:include page="mainnavi.jsp"></jsp:include> 
            </div>
        <br/>
        
        <div class="container" style="height:200px; background-color: rgb(163, 182, 248); text-align:center;">

        <h2 style="padding-top: 70px; font-weight: bold; ">자유게시판 글쓰기</h2>
        <th>글 작성하기</th>          
        
        </div>
        <br/>
        <div class="container">
        <table class="table">
            <tr>
                <td><input type="text" class="form-control" placeholder="제목을 100자 내로 입력해주세요" id="subject" name="subject" maxlength="40"></td>
            </tr>
            <tr>
                <td><div contenteditable="true" id="editable" style="overflow:scroll; width: 100%; height: 400px; border: 2px solid black; border-radius: 10px;">
                <input id="content" type="text" class="form-control" placeholder="내용을 입력하세요" name="content" maxlength="1024" style="height: 400px;"  hidden="hidden"/></div></td>
            </tr>
        </table>
      </div>
        <div class="container">
        <!-- <a href="#" class="button" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; onclick="fileUp()">첨부파일</a> -->
          <input class="button" style="max-width: 100; margin: 10px ;  padding: 10px 10px; font-weight: bold;" type="button" value="파일업로드" onclick="fileUp()" />
            <div class="row" style="float: right;">
           <input class="button2" id="save" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; " type="button" value="저장"/>
            </div>
            <a href="Freelist" class="button" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; float: right;">취소</a>
            </div>
               

</form>

</body>
<script>

var msg = "${msg}";
if(msg != ""){
	alert(msg);
	msg = "";
}

//boarduploadForm에서 보내는 elem확인
$("#save").click(function() {
	var subject = $("#subject").val();
	var editable = $("#editable").html();
	if(subject==''|| content==''){
		console.log("subject:"+subject);
		console.log("content:"+content);
		alert("모든 양식을 작성해주세요");
	}else{
		$("#editable>a").find("b").remove(); //a태그안 b태그 삭제
	 	$("#editable>a").removeAttr("onclick"); //del(this) 무효화
	 	$("#content").val($("#editable").html()); //입력한 값 content에 넣기
	 	alert("작성완료되었습니다.");
		$("form").submit(); 
	}		
});

function fileUp(){
	window.open("boardUploadForm","fileUpload","width=400, height=100");
	//요청url,타이틀,옵션
}
function del(elem){
	console.log(elem); //<a>
	var newFileName = elem.id.substring(elem.id.lastIndexOf("/")+1); //파일명만 뽑아내기
	console.log(newFileName);


//1. 실제 파일 삭제 요청
$.ajax({
	url:"boardFileDelete",
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
</script>

</html>


