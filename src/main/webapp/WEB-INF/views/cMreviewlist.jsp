<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>업체:시공 리뷰보기</title>
    </head>
    <style>
            tr,td{
                border: 1px solid gray;
            }
            td{
                border: 1px solid gray;
                border-collapse: collapse;
                height: 30px;
                width: 200px;
                border-radius: 5px;/*깍기*/
                background-color: white;
                color: gray;
            }
            .페이지처리{
                border: none;
                height: 30px;
                width: 100px;
                border-radius: 5px;/*깍기*/
                background-color: deepskyblue;
                color: white;
            }
            .페이지처리:hover, .페이지처리:active{
            background-color: dodgerblue;
            }
  
            .시공리뷰보기:hover{
                background-color: whitesmoke;
            }
            .시공글{
                line-height: 4;
               margin-left:2%;
                width: 500px;
            height: 150px;
            float: left;
            }
       
        .이미지{
            margin-top:2%;
            width: 200px;
            height: 150px;
            float: right;
        }
    
              .업체네비{
              position:absolute;
               top:-50px;
                left:50px;
            height: 250px;
              width: 230px;
                height: 175px;
                margin-top: 300px;
                margin-left: 4%;
            } 
        </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     
    
        <body>
            <iframe src="mainnavi" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
             
            <iframe  class="업체네비" src="companynavi" scrolling="no" frameborder="0"></iframe>
    
            <table style="width: 1000px; margin-left: 30%;">
            <tr>
                <th style="float: left; margin-bottom: 1%;">시공리뷰 &nbsp;<a style="color: deepskyblue;">갯수</a></th>
               
            </tr>
            
            <tr>
                <td class="시공리뷰보기" colspan="2">
                    <div class="시공글">글내용 </div><div class="이미지">이미지</div>
                </td>
            </tr>
        
            <tr>
                <td class="시공리뷰보기" colspan="2">
                    <div class="시공글">글내용 </div><div class="이미지">이미지</div>
                </td>
            </tr>
            <tr>
                <td  colspan="3" style="border: 1px solid white; color: dodgerblue; text-align: center; line-height: 5;">
                   <button class="페이지처리"><strong>◀이전</strong></button>
                    <Strong>1 2 3 4 5</Strong>
                    <button class="페이지처리"><strong>다음▶</strong></button>
                </td>
                
            </tr>
            
            </table>
    
        </body>
        <script>

            </script>
        </html>