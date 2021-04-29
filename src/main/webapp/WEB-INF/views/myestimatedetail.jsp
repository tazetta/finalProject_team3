<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>견적서-상세보기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
	<iframe src="mainnavi.html" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
	<div class="flexBox" >
		<div style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
			<div class="sideBar" style="margin-right: 15px;">
				<iframe class="마이프로필네비" src="mynavi.html" scrolling="no" frameborder="0"
				style="height: 650px; float: left; width:250px;" ></iframe>
			</div>
			<div class="sideBar">
                <div id="content">
                    <table id="msg">
						<h4>견적서</h4>
                          <tr>
                            <td><span>업체명</span> ${id}</td>
                         </tr>
                         <tr>
                            <td><span>주소</span> ${addr}</td><br/>
                         </tr>
                         <tr>
                            <td><span>평수</span> ${size}</td><br/>
                         </tr>
                         <tr>
                            <td><span>예산</span> ${cost}</td>
                        </tr>
                        <tr>
                            <td><span>연락처</span> ${phone}</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-top:10px;padding-bottom:60px;"><hr/>
							   <span>내용</span><br/><br/>
							    ${content}
								글내용 입니다.
								</td>
                        </tr>
                 </table>
                </div>
	</div>
</body>
<script>
    var msg = "${msg}";
if (msg != "") {
	alert(msg);
}


</script>
</html>
