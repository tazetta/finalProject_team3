<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta  charset= "UTF-8">
<title>우리 집 자랑 글수정</title>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 부트스트랩 사용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<!-- 부트스트랩 사용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<style>
    th{
        text-align: center;
        color: rgb(107, 105, 105);
    }
   
        
        
    a {
	text-decoration: none;
    border-radius: 10px;
    }
    table{
        margin-top: 150px;
      
    }
    .table-bordered{
        width: 100%;
        border: 3px solid rgb(204, 203, 203);
    }
        
       
    ul{
        list-style: none;
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

#button{
color: rgba(30, 22, 54, 0.6);
    background-color: rgb(230, 226, 224);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 2px inset;
	border:none;
	border-radius: 10px;
}
#button:hover{
color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;

}

#button2 {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(194, 191, 243);
	box-shadow: rgb(194, 191, 243) 0 0px 0px 2px inset;
	border:none;
	border-radius: 10px;
}

#button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(194, 191, 243) 0 0px 0px 40px inset;
}

input.button{
	border : 1px rgba(30, 22, 54, 0.6);
 	border-radius: 10px;
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(230, 226, 224);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 2px inset;
	
}
input.button:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;

}
</style>
</head>

<body>

   <br/>
 <form action="/main/boardUpdate" method="POST">
	<input type="hidden" value="2" name="boardCtgIdx"/> 
	<input type="hidden" value="${sessionScope.loginId}" name="id"/>
	<div style="min-height: 210px; padding-top:50px;">
	            <jsp:include page="mainnavi.jsp"></jsp:include> 
            </div>
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr> 
                    <th class="list" style="vertical-align: top; border: 3px solid rgb(204, 203, 203);">필수항목</th>
                
                    <td>
                        <ul>
                            <li>
                                <select name="formidx" id="formcategory"style="border-radius: 5px; margin: 5px;">
                                <option value="${dto.formidx}">${dto.formcategory}</option>
                                <option value="1">원룸&오피스텔</option>
                                <option value="2">아파트</option>
                                <option value="3">단독주택</option>
                                <option value="4">기타</option>
                                </select>
                            </li>
                            <br/>
                         
                                <li>
                                    평수<input type="text" id="roomsize" name="roomsize" style="border-radius: 5px; border-color:  rgb(162, 163, 163); width: 50px;" value="${dto.roomsize}">
    
                                </li>
                                <br/>
                           
                            <li>

                                예산<input type="text" id="budget" name="budget" style="border-radius: 5px;border-color:  rgb(162, 163, 163);  width: 50px;" value="${dto.budget}">
                            </li>

                        </ul>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th  style=" border: 3px solid rgb(204, 203, 203);">제목</th>
                    <td  style=" border: 3px solid rgb(204, 203, 203);"><input id="subject" name="subject" type="text" style="width: 100%; " value="${dto.subject}"></td>
                </tr>
                <tr>
                    <th  style=" border: 3px solid rgb(204, 203, 203);">내용</th>
                    <td  id="editable" style=" border: 3px solid rgb(204, 203, 203);"><textarea id="content" name="content" style="width: 100%;"cols="30" rows="10">${dto.content} </textarea></td>
                </tr>
                <tr>
                    <th  style=" border: 3px solid rgb(204, 203, 203);">아이템</th>
                    <td style=" border: 3px solid rgb(204, 203, 203);"><textarea id="iteme" name="keyitems" style="width: 100%;" cols="30" rows="5">${dto.keyitems}</textarea></td>
                </tr>
            </tbody>
        </table>
       
        <div class="container">
           <!--   <a href="#" class="button" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; " onclick="fileUp()">첨부파일</a>-->
             <input id="button" class="button" style="max-width: 100; margin: 10px ;  padding: 10px 10px; font-weight: bold;" type="button" value="파일업로드" onclick="fileUp()" />
            <div class="row" style="float: right;">
                <button id="button2" class="save" style="max-width: 75; margin: 10px ; padding: 10px 10px; font-weight: bold; text-align:center;">저장</button>
            </div>
            <a id="button" class="button"  onclick="location.href='homemain'"style=" max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; float: right;">취소</a>
        </div>
        </div>
       

 </form>
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