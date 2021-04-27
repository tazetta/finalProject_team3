<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <title>견적서보내기</title>
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




    </style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


    <body>
        <iframe src="mainnavi" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
       
        
        <hr style="margin-bottom: 2%;"/>

        <div style="margin-left: 2%;font-size: 50px;"><strong style="color: coral;">고객의 소리</strong> </div>


        <table style="width: 700px; margin-top: 3%; margin-left: 15%;">
            <tr>
                <td  style="width: 100px; text-align: center;"><strong>접 수 종 류</strong></td>
                    <td><select name="">
                    <option value="">게시판관련</option>
                    <option value="">유저관련</option>
                    <option value="">신고관련</option>
                    <option value="">기타</option>

                </select></td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: center; height: 50px;"><strong> 이 름</td>
                <td></strong><input style="width: 250px;" type="text" id="" placeholder="이 름"></td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: center; height: 50px;"><strong>이메일</strong></td>
                   <td> <input style="width: 250px;" type="email" id="" placeholder="이 메 일"></td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: center; height: 50px;"><strong> 제 목</strong></td>
                    <td><input style="width: 250px;" type="text" id="subject" placeholder="제 목"></td>
            </tr>
            <tr> 
                <td style="width: 100px; text-align: center; height: 50px;"><strong>글 내 용</strong></td>
                <td><div style="width: 400px; height: 40%;" contenteditable="true" placeholder="글 내 용"></div></td>
              
            </tr>
            <tr>
                <td style="width: 100px; text-align: center; height: 50px;"></td>
                <td>
                    <div class="filebox preview-image">
                        <input class="upload-name" value="업로드된 파일" disabled="disabled" >
                        <label for="input-file">업로드</label>
                         <input type="file" id="input-file" class="upload-hidden">
                         </div>
                        </td>
                    </td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: center; height: 50px;"></td>
                <td >
            <input class="보내기" type="submit" value="보 내 기"/>
        </td>
            </tr>
        </table>

      
    </body>
    <script>
        $(document).ready(function(){
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
 });
    </script>
    </html>