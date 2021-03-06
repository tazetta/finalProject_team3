<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
	border-bottom: 1px solid lightgray;
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
</style>
</head>
<body>
	<div class="flexBox">
		<div>
			<form>
				<div class="headDESC">${dto.id} 회원</div>
				<table>
					<tr>
						<th>ID</th>
						<td>${dto.id}</td>
						<th>회원등급</th>
						<c:if test="${dto.gradeIdx == 1}"><td>초보</td></c:if>
						<c:if test="${dto.gradeIdx == 2}"><td>중수</td></c:if>
						<c:if test="${dto.gradeIdx == 3}"><td>고수</td></c:if>
						<c:if test="${dto.gradeIdx == 4}"><td>초고수</td></c:if>
						<c:if test="${dto.gradeIdx == 5}"><td>신</td></c:if>
					</tr>
					<tr>
						<th>EMAIL</th>
						<td colspan="3">${dto.email}</td>
					</tr>
					<tr>
						<th>신고된 횟수</th>
						<td>7</td>
						<th>가입일</th>
						<td>${dto.reg_date}</td>
					<tr>
						<th>현재 패널티</th>
						<c:if test="${dto.stateIdx==0}">
							<td id="stateIdx" colspan="3">패널티가 없습니다.</td>
						</c:if>
						<c:if test="${dto.stateIdx==1}">
							<td id="stateIdx" colspan="3">작성금지 1일</td>
						</c:if>
						<c:if test="${dto.stateIdx==2}">
							<td id="stateIdx" colspan="3">작성금지 3일</td>
						</c:if>
						<c:if test="${dto.stateIdx==3}">
							<td id="stateIdx" colspan="3">작성금지 5일</td>
						</c:if>
						<c:if test="${dto.stateIdx==4}">
							<td id="stateIdx" colspan="3">작성금지 7일</td>
						</c:if>
						<c:if test="${dto.stateIdx==5}">
							<td id="stateIdx" colspan="3">작성금지 30일</td>
						</c:if>
						<c:if test="${dto.stateIdx==6}">
							<td id="stateIdx" colspan="3">계정 비활성화</td>
						</c:if>
						<c:if test="${dto.stateIdx==7}">
							<td id="stateIdx" colspan="3">탈퇴 회원</td>
						</c:if>
					</tr>
					<tr>
						<th>패널티 부여</th>
						<td colspan="3">
							<select class="inputs" id="penaltyVal">
								<option value="0">패널티 해제</option>
								<option value="1">작성 금지 1일</option>
								<option value="2">작성 금지 3일</option>
								<option value="3">작성 금지 5일</option>
								<option value="4">작성 금지 7일</option>
								<option value="5">작성 금지 30일</option>
								<option value="6">계정 비활성화</option>
							</select>
							<input type="button" class="inputs" id="penaltyBtn" value="확인"/> 
						</td>
					</tr>
				</table>
				<div style="text-align: right;"><input type="button" class="inputs" value="창 닫기" onclick="window.close()"/>&nbsp;&nbsp;&nbsp;</div>
			</form>
		</div>
	</div>
</body>
<script>	
function closePopUp() {
	window.close();
} 

$("#penaltyBtn").click(()=>{
	var penalty = $("#penaltyVal").val();
	console.log(penalty);
	var id = "";
	id += "${dto.id}";
	$.ajax({
		url: "../adminPenaltyCfm/"+id+"/"+penalty
		,data:{}
		,type:'GET'
		,success:(data)=>{ 
			console.log(data.msg);
			if(data.msg!=""){
				alert(data.msg);
				location.reload(); 
				opener.parent.location.reload();
			}
		}
		,error:(data)=>{
			console.log(data);
		}
	});
}); 
</script>
</html>
