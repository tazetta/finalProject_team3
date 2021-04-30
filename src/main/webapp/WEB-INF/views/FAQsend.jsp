<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <title>고객의소리보내기</title>
    </head>
    <style>
        table{
            border-collapse: collapse;
            border: 2px solid gray;
         
        }
        
        .보내기{
            border:none;
               width: 100px;
               height: 40px;
                color:#fff;
                background: #004fff;
                border-radius: .25em;
                box-shadow: 0 4px 16px rgba(0,79,255,0.3);
                transition:0.3s;     
                line-height: normal;
                font-size: 15px;
        }
        .보내기:link, .보내기:visited,.filebox label:link ,.filebox label:visited{
        background-color: deepskyblue;
        color: white;
        padding: 14px 25px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        }

        .보내기:hover, .보내기:active,.filebox label:hover ,.filebox label:active {
        background-color: dodgerblue;
        }
        


        div[contenteditable=true] {
        border: 1px solid #ddd;
        color : #333;
        font-size: 12px;
        width: 300px;
        padding: 5px;
        }
                [contenteditable=true]:empty:before{
        content: attr(placeholder);
        display: block; /* For Firefox */
        }

        .filebox input[type="file"] {
            position: absolute;
            width: 1px; height: 1px;
            padding: 0; margin: -1px;
            overflow: hidden;
            clip:rect(0,0,0,0); border: 0;
            } 
            .filebox label {
        display: inline-block;
        padding: .5em .75em;
        color: white;
        font-size: inherit;
        line-height: normal;
        vertical-align: middle;
        background-color: #004fff;
        cursor: pointer; border: 1px solid #ebebeb;
        border-bottom-color: #e2e2e2;
        border-radius: .25em;
        }
         /* named upload */ 
        .filebox .upload-name {
        display: inline-block;
        padding: .5em .75em; /* label의 패딩값과 일치 */ 
        font-size: inherit;
        font-family: inherit;
        line-height: normal;
        vertical-align: middle;
        background-color: #f5f5f5;
        border: 1px solid #ebebeb;
        border-bottom-color: #e2e2e2;
        border-radius: .25em;
        -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
        -moz-appearance: none;
        appearance: none;
        }
        .filebox .upload-display {
            margin: 5px;
        }
         @media(min-width:768px){
            .filebox .upload-display{
                display: inline-block;
                margin-right: 5px;
                margin-bottom: 0;
            }
        } 
        .filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
         display: inline-block;
        width: 54px; padding: 2px; 
        vertical-align: middle; 
        border: 1px solid #ddd; 
        border-radius: 5px; 
        background-color: #fff; 
        }
        .filebox .upload-display img { /* 추가될 이미지 */
         display: block; 
         max-width: 100%; 
         width: 100% \9; 
         height: auto; 
         }
		
		#editable {
		width: 400px;
		height: 400px;
		border: 1px solid gray;
		text-align: left;
		overflow: auto;
		padding: 5px;
		}



    </style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


    <body>
        <iframe src="mainnavi" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
       
        
        <hr style="margin-bottom: 2%;"/>

        <div style="margin-left: 2%;font-size: 50px;"><strong style="color: coral;">고객의 소리</strong> </div>

		<form action="boardWrite" method="post">
        <input type="hidden" name="boardCtgIdx" value="5"/>
        <table style="width: 700px; margin-top: 3%; margin-left: 15%;">
            <tr>
                <td  style="width: 100px; text-align: center;"><strong>접 수 종 류</strong></td>
                    <td>
                    	<select name="select">
                    		<option value="board">게시판관련</option>
                    		<option value="user">유저관련</option>
                    		<option value="report">신고관련</option>
                    		<option value="other">기타</option>
 	               		</select>
 	               </td>
            </tr>
            <tr>
                <td style="width: 90px; text-align: center; height: 50px;"><strong>아이디</strong></td>
                <td><input style="width: 250px;" type="text" value="${sessionScope.loginId}" name="id" readonly></td>
            </tr>
            <tr>
                <td style="width: 90px; text-align: center; height: 50px;"><strong>이메일</strong></td>
                   <td> <input style="width: 250px;" type="email" id="email" name="email" placeholder="이 메 일"></td>
            </tr>
            <tr>
                <td style="width: 90px; text-align: center; height: 50px;"><strong> 제 목</strong></td>
                    <td><input style="width: 250px;" type="text" id="subject" name="subject" placeholder="제 목"></td>
            </tr>
            <tr> 
                <td style="width: 90px; text-align: center; height: 500px;"><strong>글 내 용</strong></td>
                <td colspan="2" style="width: 250px; text-align: center; height: 500px;">
					<div contenteditable="true" id="editable" ></div> 
					<input name="content" type="hidden" />
				</td>  	
            </tr>
            <tr>
            	<td colspan="2">
					<input type="button" value="파일업로드" onclick="fileUp()" />	
            	</td>
               <!--  <td>
                    <div class="filebox preview-image">
                        <input class="upload-name" value="업로드된 파일" disabled="disabled" >
                        <label for="input-file">업로드</label>
                         <input type="file" id="input-file" class="upload-hidden">
                         </div>                      
               </td> -->
            </tr>
        </table>
        </form>
		<button onclick="location.href='interiorexamList'">취소</button>
		<button id="save">작성완료</button>
      
    </body>
    <script>
    $("#save").click(function() {
    	if($("#email").val()==""||$("#subject").val()==""){
    		alert("이메일,제목,내용을 모두 작성해주세요");
    	}else{
    		console.log($("#editable").html());
    		$("#editable>a").find("b").remove(); //a태그안 b태그 삭제
    		$("#editable>a").removeAttr("onclick"); //del(this) 무효화
    		$("#content").val($("#editable").html());
    		$("form").submit();
    	}
		
	});
	
	/* 파일업로드 새창*/
	function fileUp(){
		window.open("boardUploadForm","fileUpload","width=400, height=100");
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
	
       /*  $(document).ready(function(){
            var fileTarget = $('.filebox .upload-hidden');
            
        fileTarget.on('change', function(){// 값이 변경되면 
            if(window.FileReader){ // modern browser
            var filename = $(this)[0].files[0].name;
        } else { // old IE
            var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
        } 
        // 추출한 파일명 삽입
        $(this).siblings('.upload-name').val(filename);
     }); 
    });

    //업로드부분
        var imgTarget = $('.preview-image .upload-hidden');
        imgTarget.on('change', function(){
        var parent = $(this).parent();
        parent.children('.upload-display').remove();
        if(window.FileReader){ //image 파일만 
        if (!$(this)[0].files[0].type.match(/image\//)) return;
        var reader = new FileReader();
        reader.onload = function(e){
        var src = e.target.result;
        parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
        } 
        reader.readAsDataURL($(this)[0].files[0]);
        } else { 
        $(this)[0].select(); 
        $(this)[0].blur();
        var imgSrc = document.selection.createRange().text;
        parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
        var img = $(this).siblings('.upload-display').find('img');
        img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
        }
 }); */
    </script>
    </html>