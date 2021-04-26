<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>견적서 상세보기</title>
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
            button{
                border: 1px solid gray;
                border-collapse: collapse;
                height: 30px;
                width: 200px;
                border-radius: 5px;/*깍기*/
                background-color: white;
                color: gray;
            }
            button:hover, button:active{
        background-color: whitesmoke;
        }
            td:hover{
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
     
            #hidden4{
                border: 1px solid gray; 
                width: 80px;
                   height: 25px;
                    color:black;
                    background: white;
                    border-radius: .25em;
                    transition:0.3s;     
                    line-height: normal;
                    font-size: 15px;
            }
          
            .업체정보{
                border:1px solid gainsboro;
                border-collapse: collapse;
                width: 200px;
                height: 200px;
                position: absolute;
                top:200px;
                left:100px;
                margin-top: 30px;
                margin-left: 4%;
                text-align: center;
            }
          .업체정보수정{
                border:1px solid gray;
                   width: 200px;
                   height: 40px;
                    color: gray;
                    background: white;
                    border-radius: .25em;
                    transition:0.3s;     
                    line-height: normal;
                    font-size: 15px;
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
                <th style="float: left;">시공사례<a style="color: deepskyblue;">갯수</a></th>
               <th> <button style="float: right;">시공사례작성하기</button></th>
            </tr>
            
            <tr>
                <td class="시공사례" colspan="2">
                    <div class="시공글">글내용 </div><div class="이미지">이미지</div>
                </td>
            </tr>
        
            <tr>
                <td class="시공사례" colspan="2">
                    <div class="시공글">글내용 </div><div class="이미지">이미지</div>
                </td>
            </tr>
            
            </table>
    
        </body>
        <script>

            </script>
        </html>