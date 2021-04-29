<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String loginId = (String)request.getSession().getAttribute("loginId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<style>
			table,td,th{
                border: 1px solid black;
                border-collapse: collapse;
                padding: 5px 10px;
                text-align: center;
                font-size: 16px;
            }
            table{
            	width: 100%;
                height: 100%;  
            }
            #reason{
            	width:100%;
            	height:350px;
				resize:none;
				font-size: 16px;
            }
            .text{
            	width:100%;
            	font-size: 16px;
            }
	
</style>
</head>
<body>
	<c:if test="${msg eq null}">
	<form action="./companyReport" method="post">
		<table>
			<tr>
				<th>신고할업체명</th>
				<td><input type="text" class="text" name="boardIdx" value="${comId}" readonly/></td>
			</tr>
			<tr>
				<th>신고자</th>
				<td><input type="text" class="text" name="id" id="userId" value="mingmang" readonly/></td><!-- 로그인세션 -->
			</tr>
			<tr>
				<th rowspan="2">신고사유</th>
				<td>
					<select name="reason">
						<option value="불친절한 대응">불친절한 대응</option>
						<option value="연락두절">연락두절</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><textarea id="reason" name="content" placeholder="상세사유를 입력하세요"></textarea></td>
			</tr>
		</table>
				<input type="submit" id ="regist" value="등록"/>
				<input type="button" onclick=window.close() value="취소"/>
			
	</form>
	</c:if>
</body>
<script>
var msg="${msg}";
if(msg!=""){
	alert(msg);
	window.close();
}
</script>
</html>