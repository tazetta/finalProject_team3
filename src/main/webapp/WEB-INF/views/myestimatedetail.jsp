<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>견적서-상세보기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 반응형 디자인을 위한 css/js 라이브러리 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>   
 <!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야 함) -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>



.flexBox {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}


input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #acd3fb;
	cursor: pointer;
	box-shadow: 0 2px 4px rgba(0, 79, 255, 0.6);
	border: 2px solid white;
	color: white;
}


.pagingBtn {
	text-decoration: none;
	color: black;
	font-weight: 600;
	background-color: lightgray;
	margin: 1px 2px;
	margin-top: 0px;
	padding: 3px;
	border: 1px white;
}

.sideBar {
	float: left;
}

/*콘텐츠*/
#content {
	/*  background-color: lightgray; */
	position: relative;
	left: 20px;
	margin: 0 auto;
	width: 650px;
	 height: 700px;
}



table#msg {
	background-color: white;
	position: relative;
	top: 80px;
	margin: 0 auto;
	width: 80%;
	clear: both;
}

span {
	font-size: 17px;
	color: black;
	
}
.btn{
	float:right;
}
h4{
	color: gray;
    margin-left: 40%;
}
.content{
    border: 1px solid black;
}

        
</style>
</head>
<body>
		<iframe src="mainnavi" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
	<div class="flexBox" >
		<div style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
			<div class="sideBar" style="margin-right: 15px;">
				<iframe class="마이프로필네비" src="mynavi" scrolling="no" frameborder="0"
				style="height: 650px; float: left; width:250px;" ></iframe>
			</div>
			<div class="sideBar">
                <div id="content">
                    <table id="msg">
						<h4>견적서</h4>
                        		 <tr>
									<th>업체명</th>
									<td>${info.comId}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${info.address}</td>
								</tr>
								<tr>
									<th>평수</th>
									<td>${info.roomsize}</td>
								</tr>
								<tr>
									<th>예산</th>
									<td>${info.budget}</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>${info.phone}</td>
								</tr>
                      	<tr> 
                            <td colspan="2" style="padding-top:10px;padding-bottom:60px;"><hr/>
							   <span>내용</span><br/><br/>
							    ${info.content}
							</td>
						</tr>
                       
                 </table>
          </div>
	</div>
</body>
<script>


</script>
</html>
