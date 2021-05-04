<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	table{
        		position:absolute;
        		left:20%;
        		top:30%;
        		width: 40%;
        	}
            th{
                background-color: rgb(144, 209, 240);
                color: white;
            }
            th,td{
                height: 30px;
                font-size: 15px;
            }
            table,td,th,tr{
                border-collapse: collapse;
                border-top: 1px solid gray;
                border-bottom: 0px solid gray;
                text-align: center;
            }
            
              .업체네비{
              position:absolute;
               top:-100px;
                left:0px;
          	  height: 250px;
             	 width: 230px;
                height: 175px;
                margin-top: 300px;
                margin-left: 4%;
                z-index: 3;
            } 
	

</style>
</head>
<body>
<hr/>
 <iframe src="mainnavi" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
<iframe  class="업체네비" src="companynavi" scrolling="no" frameborder="0"></iframe>
	<table>
		<tr>
			<th>업체</th>
			<td>${dto.comId}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.id}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${dto.address }</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${dto.phone }</td>
		</tr>
		<tr>
			<th>평수</th>
			<td>${dto.roomsize}평</td>
		</tr>
		<tr>
			<th>예산</th>
			<td>${dto.budget}만원</td>
		</tr>
		<tr>
			<th>세부사항</th>
			<td>
				${dto.content}
			</td>
		</tr>
	</table>
</body>
<script>

</script>
</html>