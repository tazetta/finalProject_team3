<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>보낸 쪽지함</title>
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
h3{
    
    
    padding-left: 280px;
    font-size: 17px;
   
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
					<table>
						<h3>[보낸 쪽지함]</h3>
                       
					<tr class="table"> 
						<th style="width:70px">작성자</th>
						<th style="width:400px">내용</th>
						<th style="width:60px">날짜</th>
					</tr>
				    	<c:forEach items="${list}" var="board">
						   <tr>
							<td>${board.id}</td>
							<td><a class="mouse_over" href="boardDetail?boardIdx=${border.boardIdx}&page=${currPage}">${board.content}</a></td>
							<td>${board.reg_date}</td>
							<td> 
                                <input type="button"  value="삭제" onclick="deletingList($boardIdx)" class="del" />  
                            </td>
						</tr>
                        <tr>
							<td>USER</td>
                            <td>내용 작성 테스트 입니다.</td>
                            <td>2021-04-28</td>
                            <td> 
                                <input type="button"  value="삭제" onclick="deletingList($boardIdx)" class="del" />  
                            </td>
						</tr>
                        <tr>
							<td>USER</td>
                            <td>내용 작성 테스트 입니다.</td>
                            <td>2021-04-28</td>
                            <td> 
                                <input type="button"  value="삭제" onclick="deletingList($boardIdx)" class="del" />  
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
    var msg = "${msg}";
if (msg != "") {
	alert(msg);
}


function deletingList(boardIdx){
	console.log(boardIdx);
	 if(confirm("정말로 삭제하시겠습니까?")){
		 
		 	location.href="wroteDel?boardIdx="+boardIdx;
		}else{
			location.href="wroteList";
		}
};  

</script>
</html>
