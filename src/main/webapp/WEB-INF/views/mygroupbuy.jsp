<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>신청한 공동구매 내역</title>
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



select:hover {
	cursor: pointer;
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
    

font-size: 17px;
color: gray;
   
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
                <h3>신청한 공동구매 내역</h3>
				<form>
					<table>
					<tr class="table"> 
						<th style="width:60px">글번호</th>
						<th style="width:60px">현재상태</th>
						<th style="width:60px">남은자리</th>
                        <th style="width:180px">제목</th>
                        <th style="width:60px">작성자</th>
                        <th style="width:60px">작성일</th>
					</tr>
				    	<c:forEach items="${list}" var="board">
						   <tr>
							  <td>${board.idx}</td>
							  <td>${board.situation}</td>
                              <td>${board.empy}</td>
                              <td><a class="mouse_over" href="boardDetail?boardIdx=${border.boardIdx}&page=${currPage}">${board.subject}</a></td>
							  <td>${board.id}</td>
                              <td>${board.reg_date}</td>
						  </tr>
                          <tr>
                            <td>5000</td>
                            <td>진행중</td>
                            <td>15</td>
                            <td>거꾸리 공동구매</td>
                            <td>USER3</td>
                            <td>2021-04-29</td>
                         </tr>
                         <tr>
                            <td>1000</td>
                            <td>진행중</td>
                            <td>15</td>
                            <td>LED전구 공동구매.</td>
                            <td>USER2</td>
                            <td>2021-04-24</td>
                         </tr>
                     </c:forEach>
					</table>
				</form>
			</div>
			
		</div>
	</div>
</body>
<script>
   
</script>
</html>
