<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<style>
   
    li{
        line-height: 4;
        border-top: 2px solid dodgerblue;
        border-bottom: 2px solid dodgerblue;
        float: left;
        padding: 0px 20px;
        background-color: white;
        font-size: 25px;
        font-weight: 700;
        text-align: center;
        width:auto;
        height: 100px;
        list-style: none;
         }
        a:link{
            color: black;
            text-decoration: none;
        }
        a:visited{
            color: pink;
        }
        li:hover{
            color: white;
            background-color: deepskyblue;
        }
        div.bar{
            background-color: white;
            min-width: 700px;
        }
</style>

<div class="bar">
    <a href="Freelist" target="_parent">
        <li>자유게시판</li>
    </a>
    <a href="*" target="_parent">
        <li>우리집 자랑</li>
    </a>
    <a href="groupListPage" target="_parent">
        <li>공동 구매</li>
    </a>
    <a href="helpMain" target="_parent">
        <li>도와줘요 자취만렙</li>
    </a>
    <a href="interiorexamList" target="_parent">
        <li>전문가 인테리어</li>
    </a>

</div>
</html>