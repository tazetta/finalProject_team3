<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<style>
table, td, th {
	border-collapse: collapse;
	padding: 10px 10px;
	margin: 10px;
	line-height: 100%;
	text-align: center;
}

table {
	border-top: 3px solid lightgray;
	border-bottom: 3px solid lightgray;
}

th {
	border-bottom: 1px solid lightgray;
}

td {
	height: 55px;
}

.flexBox {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
		min-width: 1680px;
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

#sound {
	font-weight: 600;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="flexBox">
		<div   style="min-height: 800px;">
			<jsp:include page="adminSideBar.jsp" />
			<div class="sideBar">
				<form>
					<div
						style="display: flex; justify-content: space-between; margin-right: 10px;">
						<div class="headDESC">고객의 소리</div>
						<div>
							<select id="sgtCtgSelect" class="inputs">
								<option value="none">전체</option>
								<option value="게시판">게시판 관련</option>
								<option value="유저">유저 관련</option>
								<option value="신고">신고 관련</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
					<table style="min-width: 1100px">
						<tr>
							<th style="text-align: left;">제목</th>
							<th>카테고리</th>
							<th>신청자</th>
							<th>작성일</th>
						</tr>
						<tbody id="list">
						
						</tbody>
						<tr>
							<td colspan="4">
								<!-- PlugIn -->
								<div class="container">
									<nav aria-label="page navigation" style="text-align: center;">
										<ul class="pagination" id="pagination"></ul>
									</nav>
								</div>
								<!-- /PlugIn -->
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	function detailPopUp(idx){
		var url = "adminSoundDetail/";
		var boardIdx = idx;
		console.log(idx);
		url += boardIdx;
		window.open(url ,"상세보기","width=600, height=650");
	}
	
	var thisPage = 1;
	var sgtctg = 'none';
	listCall(thisPage, sgtctg);
	
	$("#sgtCtgSelect").change(()=>{
		thisPage = 1;
		sgtctg = $("#sgtCtgSelect").val();
		listCall(thisPage, sgtctg);
	});
	
	function listCall(reqPage,sgtctg) {	
		var reqUrl = 'adminSoundList/'+10+'/'+reqPage+'/'+sgtctg;
		$.ajax({
			url:reqUrl
			,data:{}
			,type:'GET'
			,dataType:'JSON'
			,success:(data)=>{
				if(reqPage > data.maxPage){listCall(data.maxPage,sgtctg);}
				console.log(reqUrl);
				console.log(data);
				thisPage = data.currPage;
				listPrint(data.list);
				$("#pagination").twbsPagination({
					startPage:data.currPage
					,totalPages:data.maxPage
					,visiblePages:5
					,onPageClick:(evt, page)=>{
						console.log(evt);
						console.log(page);
						listCall(page,sgtctg);
					}
				});
			}
			,error:(data)=>{
				console.log(data);
			}
		});
	}
	
	function listPrint(list){
		var content = "";
		console.log("list.length : "+list.length);
			if(list.length == 0) {
				content += "<tr><td colspan='5'>해당 회원이 존재하지 않습니다.</td></tr>";
			} else {
				for(var i=0;i<list.length;i++){
				content += "<tr>"
					content += "<td style='text-align: left;' onclick='detailPopUp("+(list[i].boardIdx)+")'>"+list[i].subject+"</td>"
					content += "<td>"+list[i].sgtctg+"</td>"
					content += "<td>"+list[i].id+"</td>"
					var date = new Date(list[i].reg_date);
					content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>"
					content += "<td style='display: none;'>"+list[i].boardIdx+"</td>"
				content += "</tr>"
			}
		}
		$("#list").empty();
		$("#list").append(content);
	}
</script>
</html>
