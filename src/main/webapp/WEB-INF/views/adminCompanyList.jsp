<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>관리자 일반회원 목록</title>
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
	font-family: Arial, Helvetica, sans-serif;
}

table {
	border-top: 2px solid lightgray;
	border-bottom: 2px solid lightgray;
}

td {
	height: 55px;
}

form table th {
	border-bottom: 1px solid lightgray;
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
	margin-bottom: 15px;
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

#companyMember {
	font-weight: 600;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="flexBox">
		<jsp:include page="adminSideBar.jsp" />
		<div>
			<div class="center">
				<div class="sideBar">
					<div style="display: flex; justify-content: space-between;">
						<div class="headDESC">업체회원목록</div>
						<div>
							<input type="text" id="searchId" class="inputs"
								style="width: 160px" placeholder="ID를 입력해주세요." /> <input
								type="button" id="searchBtn" class="inputs" value="검색" />
						</div>
					</div>
					<form>
						<table>
							<tr>
								<th>ID</th>
								<th>기업명</th>
								<th>사업자등록번호</th>
								<th>전화번호</th>
								<th>가입일</th>
							</tr>
							<tbody id="list">

							</tbody>
							<tr>
								<td colspan="5" id="paging">
									<!-- PlugIn -->
									<div class="container">
										<nav aria-label="page navigation" style="text-align: center;">
											<ul class="pagination" id="pagination"></ul>
										</nav>
									</div> <!-- /PlugIn -->
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function detailPopUp(i){
		var url = "adminCompanyDetail/";
		console.log($("#"+i).val());
		var id = $("#"+i).val();
		url += id;
		window.open(url ,"상세보기","width=600, height=650");
	}
	
	var thisPage = 1;
	var searchId = 'none';
	listCall(thisPage, searchId);
	
	$("#searchBtn").click(()=>{
		thisPage = 1;
		if($("#searchId").val()== ""){
			alert("검색할 아이디를 입력해주세요!");
		} else {
			searchId = $("#searchId").val();
			console.log(searchId);
			listCall(thisPage, searchId);
		}
	});
	
	function listCall(reqPage,searchId) {	
		var reqUrl = 'adminCompanyList/'+15+'/'+reqPage+'/'+searchId;
		$.ajax({
			url:reqUrl
			,data:{}
			,type:'GET'
			,dataType:'JSON'
			,success:(data)=>{
				if(reqPage > data.maxPage){listCall(data.maxPage,searchId);}
				console.log(reqUrl);
				console.log(data);
				thisPage = data.currPage;
				listPrint(data.list);
				$("#pagination").twbsPagination({
					startPage:data.currPage
					,totalPages:data.maxPage
					,visiblePages:5
					,first : '<span aria-hidden="true"><<</span>'
						,prev : "이전"
						,next : "다음"
						,last : '<span aria-hidden="true">>></span>'
					,onPageClick:(evt, page)=>{
						console.log(evt);
						console.log(page);
						listCall(page,searchId);
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
					content += "<td><input type='button' id="+(i+1)+" class='inputs' value="+list[i].comId+" onclick='detailPopUp("+(i+1)+")' style='border: none; border-radius: 10px; width: 120px;' /></td>"
					content += "<td>"+list[i].comName+"</td>"
					content += "<td>"+list[i].license+"</td>"
					content += "<td>"+list[i].phone+"</td>"
					var date = new Date(list[i].reg_date);
					content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>"
				content += "</tr>"
			}
		}
		$("#list").empty();
		$("#list").append(content);
	}
</script>
</html>
