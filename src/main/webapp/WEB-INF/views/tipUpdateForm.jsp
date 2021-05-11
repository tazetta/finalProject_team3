
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>꿀팁 수정하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</head>
<style>

a {
	text-decoration: none;
    border-radius: 10px;
}
a.button {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(230, 226, 224);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 2px inset;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(255, 210, 180);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 40px inset;
}

</style>
</head>
	
	
<body>
 <div style="min-height: 210px; padding-top:50px;">
    <jsp:include page="mainnavi.jsp" />
</div>
   <br/>

    <div class="container"  style="height:200px; background-color: rgb(184, 185, 190); text-align:center;">
  		<form action="/main/boardUpdate" method="POST">
        <h1 style="padding-top: 50px; font-weight: bold;">꿀팁 게시판</h1>
        <br/>
        <h>글 수정하기</h>
    </div>
    <br/>
    <div class="container">
        <table class="table">
            <tr>
                <td><input type="text" class="form-control" name="subject"  maxlength="40" value="${dto.subject}">
            </tr>
            <tr>
                 <td colspan="2">
      				<input name="boardIdx" type="hidden" value="${dto.boardIdx}" />
      				<input type="hidden" name="brdctgidx" value="${dto.brdctgidx }" />
					<div  class="form-control" contenteditable="true" id="editable" style="overflow:scroll; width: 100%; height: 400px;  border-radius: 10px;"> ${dto.content}</div> 
					<input name="content" type="hidden" id="content" />
			</td>
            </tr>
            </form>
          </table>
        <button id="button" 
        onclick="fileUp()"
        style="height: 20;
        background-color: rgb(182, 172, 159);
        color: white;
        font-weight: bold;
        padding: 3px 15px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 15%;
        border-radius: 10px;">사진추가</button>
    </div>
       
      

     
        <div style="text-align: right; padding-right: 230px;">
        <button id="button" style="height: 20;
        background-color: rgb(218, 208, 194);
        color: rgb(19, 18, 18);
        font-weight: bold;
        padding: 3px 10px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 7%;
        border-radius: 10px;"
        onclick="location.href='../boarddetail?boardIdx=${dto.boardIdx}'">취소</button>
        &nbsp;&nbsp;
        <button id="button" style="height: 20;
        background-color: rgb(252, 214, 158);
        color: rgb(19, 18, 18);
        font-weight: bold;
        padding: 3px 15px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 7%;
        border-radius: 10px;"
        class="save">수정</button>

        </div>
    </body>
    <script>
$(".save").click(function() {
	console.log($("#editable").html());
	$("#editable>a").find("b").remove(); //a태그안 b태그 삭제
	$("#editable>a").removeAttr("onclick"); //del(this) 무효화
	$("#content").val($("#editable").html());
	$("form").submit();
});

/* 파일업로드 새창*/
function fileUp(){
	window.open("/main/boardUploadForm","fileUpload","width=400, height=100");
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
		url:"/main/boardFileDelete",
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