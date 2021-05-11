
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트랩 사용 -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>자유게시판 글쓰기</title>
<style>

</style>
</head>

<body>
    <br/>
	 <div style="min-height: 210px; padding-top:50px;">
	            <%-- <jsp:include page="mainnavi.jsp" />  --%>
	            <%@ include file="mainnavi.jsp" %>
            </div>
<div class="container" style="height:300px; background-color: rgb(163, 182, 248); text-align:center;">

  <form action="/main/boardUpdate" method="POST">
  <h2 style="padding-top: 100px;">자유게시판</h2>
  <th>글 수정하기</th>     <!-- 수정바람 -->     
</div>
    <div class="container">

        <table class="table">
      
        
      
            <tr>
      
                <td><input type="text" class="form-control" name="subject"  maxlength="40" value="${dto.subject}">
                </td>
      
            </tr>
      
            <tr>
            <td colspan="2">
      				<input name="boardIdx" type="hidden" value="${dto.boardIdx}" />
      				<input type="hidden" name="brdctgidx" value="${dto.brdctgidx }" />
					<div class="form-control" contenteditable="true" id="editable" style="overflow:scroll; width: 100%; height: 400px;"> ${dto.content}</div> 
					<input name="content" type="hidden" id="content" />
			</td>
          <%--       <td><div contenteditable="true" id="editable"><textarea type="text" class="form-control" placeholder="내용을 입력하세요" name="content"
                    maxlength="1000" style="height: 400px; ">${dto.content }</textarea></div></td> --%>
   
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
