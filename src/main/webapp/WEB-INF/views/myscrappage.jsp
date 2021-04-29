<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>스크랩북</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
table, td, th {
	border-collapse: collapse;
	padding: 10px 10px;
	margin: 10px;
	line-height: 100%;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
}


td {
	height: 55px;
}

.flexBox {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.inputs {
	width: 130px;
	height: 35px;
	border: 2px solid lightslategrey;
	line-height: 100%;
	font-size: 16px;
}

.headDESC {
	font-size: 25px;
	font-weight: 600;
	color: tomato;
	margin-left: 10px;
	margin-bottom: 0px;
}

input[type="button"], input[type="submit"] {
	background-color: #acd3fb;
	cursor: pointer;
	color: white;
	font-weight: bold;
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #acd3fb;
	cursor: pointer;
	box-shadow: 0 2px 4px rgba(0, 79, 255, 0.6);
	border: 2px solid white;
	color: white;
}

#monitor {
	width: 750px;
	height: 500px;
	overflow: auto;
	border: 2px solid #acd3fb;
}

select:hover {
	cursor: pointer;
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

th{
      border:1px solid gray;
      border-collapse: collapse;
      text-align: center;
	background-color: dodgerblue;
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
				<form>
					<table >
						<c:forEach items="${scrap}}" var="board">
						<tr>
							<td id="user" rowspan="2">
							   <div>
								  <a href="./scrapDetail?contentId=${scrap.contentid}" target=window.open()><img src="${scrap.firstimage}" width="200px" height="200px">
								  </a>
							   </div>
							 </td>
						</tr>
						
						 <tr>
							<td id="user" rowspan="2">
							   <div>
								  <a href="./scrapDetail?contentId=${scrap.contentid}" target=window.open()><img src="${scrap.firstimage}" width="200px" height="200px">
								  </a>
							   </div>
							 </td>
							
							
						 </tr>
						 </c:forEach>
					</table>
				</form>
			</div>
			
		</div>
	</div>
</body>
<script>
	function del(elem) {
		console.log(elem);
		var newFileName= elem.id.substring(elem.id.lastIndexOf("/")+1);
		console.log(newFileName);
		
		//1.실제 파일 삭제 요청
		$.ajax({
			url:'fileDelete',
			type:'get',
			data:{"fileName":newFileName},
			dataType:'json',
			success:function(d){
				console.log(d);
				if(d.success==1){
					$(elem).remove();//X 버튼삭제(자기자신)
				}
			},
			error:function(e){
				console.log(e);
			}
		});
		//2.파일 삭제 요청이 완료 되면 화면에 나타난 사진 삭제
	}

</script>
</html>
