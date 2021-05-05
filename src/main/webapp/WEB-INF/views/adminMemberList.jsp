<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>관리자 일반회원 목록</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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

</style>
</head>
<body>
	<div class="flexBox">
		<div style="min-height: 800px;">
			<div>
				<div class="sideBar" style="margin-right: 15px;">
					<table style="border: none;">
							<tr>
								<td
									style="text-align: left; font-size: 20px; border: none; font-weight: 600; text-decoration: underline; text-underline-position: under;">Category</td>
							</tr>
							<tr>
								<td style="text-align: right; border: none;">메인</td>
							</tr>
							<tr>
								<td style="text-align: right; border: none; font-weight: 600;">일반회원
									목록></td>
							</tr>
							<tr>
								<td style="text-align: right; border: none;">업체회원 목록</td>
							</tr>
							<tr>
								<td style="text-align: right; border: none;">고객의소리</td>
							</tr>
							<tr>
								<td style="text-align: right; border: none;">신고된 게시글</td>
							</tr>
							<tr>
								<td style="text-align: right; border: none;">신고된 댓글</td>
							</tr>
							<tr>
								<td style="text-align: right; border: none;"></td>
							</tr>
							<tr>
								<td style="text-align: right; border: none;"></td>
							</tr>
							<tr>
								<td style="text-align: right; border: none;"></td>
							</tr>
							<tr>
								<td style="text-align: right; border: none;"></td>
							</tr>
					</table>
				</div>
				<div class="sideBar">
				<div style="display: flex; justify-content: space-between; ">
					<div class="headDESC">
						일반회원목록
					</div>
					<div>
						<select class="inputs" id="grade">
							<option value="0">회원등급</option>
							<option value="1">초보</option>
							<option value="2">중수</option>
							<option value="3">고수</option>
							<option value="4">초고수</option>
							<option value="5">신</option>
						</select> <select class="inputs" id="penalty">
							<option value="0">현재 패널티</option>
							<option value="1">작성 금지 1일</option>
							<option value="2">작성 금지 3일</option>
							<option value="3">작성 금지 5일</option>
							<option value="4">작성 금지 7일</option>
							<option value="5">작성 금지 30일</option>
							<option value="6">계정 비활성화</option>
						</select> <select class="inputs" id="drop">
							<option value="0">탈퇴 여부</option>
							<option value="0">false</option>
							<option value="7">true</option>
						</select>
						<input type="text" id="searchId" class="inputs" style="width: 160px;" placeholder="ID를 입력해주세요."/>
						<input type="button" id="searchBtn" class="inputs" value="검색" />
					</div>
				</div>
					<form>
						<table>
							<tr>
								<th>ID</th>
								<th style="width: 150px;">회원등급</th>
								<th>신고된 횟수 ▼</th>
								<th style="width: 150px;">가입일</th>
								<th style="width: 150px;">현재 패널티</th>
								<th>탈퇴 여부</th>
							</tr>
							<tbody id="list">
								
							</tbody>
							<tr>
								<td colspan="6"  id="paging">
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
	</div>
</body>
<script>
	function detailPopUp(i){
		var url = "adminMemberDetail/"
		console.log($("#"+i).val());
		var id = $("#"+i).val();
		url += id;
		window.open(url,"상세보기","width=480, height=400");
	}
	
	var thisPage = 1;
	var gradeIdx = 0;
	var stateIdx = 0;
	var searchId = 'none';
	listCall(thisPage, gradeIdx, stateIdx);


	$("#pagePerNum").change(()=>{
		console.log($("#pagePerNum").val());
		$("#pagination").twbsPagination('destroy');
		listCall(thisPage, gradeIdx, stateIdx);
	});

	
	$("#grade").change(()=>{
		thisPage = 1;
		gradeIdx = $("#grade").val();
		stateIdx = 0;
		$("#penalty").val([0]);
		$("#drop").val([0]);
		listCall(thisPage, gradeIdx, stateIdx);
	});
	
	$("#penalty").change(()=>{
		thisPage = 1;
		stateIdx = $("#penalty").val();
		gradeIdx = 0;
		$("#grade").val([0]);
		$("#drop").val([0]);
		listCall(thisPage, gradeIdx, stateIdx);
	});
	
	$("#drop").change(()=>{
		thisPage = 1;
		stateIdx = $("#drop").val();
		gradeIdx = 0;
		$("#grade").val([0]);
		$("#penalty").val([0]);
		listCall(thisPage, gradeIdx, stateIdx);
	});
	
	$("#searchBtn").click(()=>{
		thisPage = 1;
		if($("#searchId").val()== ""){
			alert("검색할 아이디를 입력해주세요!");
		} else {
			searchId = $("#searchId").val();
			console.log(searchId);
			listCall(thisPage, gradeIdx, stateIdx, searchId);
		}
	});
	
	function listCall(reqPage, gradeIdx, stateIdx) {	
		var reqUrl = 'adminMemberList'+'/'+15+'/'+reqPage+'/'+gradeIdx +'/'+ stateIdx +'/'+searchId;
		$.ajax({
			url:reqUrl
			,data:{}
			,type:'GET'
			,dataType:'JSON'
			,success:(data)=>{
				if(reqPage > data.maxPage){listCall(data.maxPage, gradeIdx, stateIdx,searchId);}
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
						listCall(page, gradeIdx, stateIdx,searchId);
					}
				});
				console.log('최대 페이지 '+data.maxPage);
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
				content += "<tr><td colspan='6'>해당 회원이 존재하지 않습니다.</td></tr>";
			} else {
				for(var i=0;i<list.length;i++){
				content += "<tr>"
					content += "<td><input type='button' id="+(i+1)+" class='inputs' value="+list[i].id+" onclick='detailPopUp("+(i+1)+")' style='border: none; border-radius: 10px; width: 120px;' /></td>"
					content += "<td>"+list[i].grade+"</td>"
					content += "<td>"+0+"</td>"
					var date = new Date(list[i].reg_date);
					content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>"
					if(list[i].stateIdx == 0){
						content += "<td>패널티가 없습니다.</td>"						
					} else if (list[i].stateIdx == 1){
						content += "<td>작성금지 1일</td>"
					} else if (list[i].stateIdx == 2){
						content += "<td>작성금지 3일</td>"
					} else if (list[i].stateIdx == 3){
						content += "<td>작성금지 5일</td>"
					} else if (list[i].stateIdx == 4){
						content += "<td>작성금지 7일</td>"
					} else if (list[i].stateIdx == 5){
						content += "<td>작성금지 30일</td>"
					} else if (list[i].stateIdx == 6){
						content += "<td>계정 비활성화</td>"
					}
					content += "<td>false</td>"
				content += "</tr>"
			}
		}
		$("#list").empty();
		$("#list").append(content);
	}
	

</script>
</html>
