<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>견적서 리스트</title>
    </head>
        
        <style>
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
            th{
                background-color: rgb(144, 209, 240);
                color: white;
            }
            th,td{
                height: 50px;
                font-size: 15px;
            }
            table,td,th,tr{
                border-collapse: collapse;
                border-top: 1px solid gray;
                border-bottom: 1px solid gray;
                text-align: center;
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
    
            <table style="width: 1000px; margin-left: 25%;">
            <tr>
                <th>의뢰인</th>
                <th>제목</th>
                <th>날짜</th>
            </tr>
            <tr>
                    <td>자취생1호</td>
                    <td>22평 리모델링</td>
                    <td>2021-04-26</td>
                </tr>
                <tr>
                    <td>자취생2호</td>
                    <td>22평 리모델링</td>
                    <td>2021-04-26</td>
                </tr>
                <tr>
                    <td>자취생3호</td>
                    <td>22평 리모델링</td>
                    <td>2021-04-26</td>
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