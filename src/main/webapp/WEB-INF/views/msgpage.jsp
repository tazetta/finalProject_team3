<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>쪽지 페이지</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
table, td, th {
	border-collapse: collapse;
	padding: 10px 15px;
	margin: 15px;
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
	background-color: cornflowerblue;
            }

			.이미지{
            margin-top:2%;
            width: 200px;
            height: 150px;
            float: right;
        }
		h2{
		
			width: 110px;
			margin: 1px;
			text-align: center;
			font-size: 18px;
		
		}
        h3{
     padding-left: 280px;
    font-size: 17px;
   }
   
   
   input[type="submit"] {
	background-color: orange;
	cursor: pointer;
	color: white;
	font-weight: bold;
    margin-left: 600px;
    font-size: 18px;
}


</style>
</head>
<body>
	<iframe src="mainnavi.html" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
	<div class="flexBox" >
		<div style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
			<div class="sideBar" style="margin-right: 15px;">
				<iframe  src="mynavi.html" scrolling="no" frameborder="0"
				style="height: 650px; float: left; width:250px;" ></iframe>
			</div>
			<div class="sideBar">
				<form>
                   <h2>쪽지</h2>
                 
                    <input type="submit"  value="쪽지쓰기" />  
               
                     <table>
                         
						<h3>[ 받은 쪽지함 ] <a href="" style="font-size: small; color:mediumblue;">전체보기</a></h3>
                       
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
                            <td>쪽지함 테스트</td>
                            <td>2021-04-28</td>
                            <td> 
                                <input type="button"  value="삭제" onclick="deletingList($boardIdx)" class="del" />  
                            </td>
						</tr>
                        <tr>
							<td>USER</td>
                            <td>쪽지함 테스트</td>
                            <td>2021-04-28</td>
                            <td> 
                                <input type="button"  value="삭제" onclick="deletingList($boardIdx)" class="del" />  
                            </td>
						</tr>
					</c:forEach>
					</table>
                    <br/>
                    <br/>
                    <br/>
                    <table>
						<h3>[ 보낸 쪽지함 ] <a href="" style="font-size: small; color:mediumblue;">전체보기</a></h3>
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
                            <td>쪽지함 테스트</td>
                            <td>2021-04-28</td>
                            <td> 
                                <input type="button"  value="삭제" onclick="deletingList($boardIdx)" class="del" />  
                            </td>
						</tr>
                        <tr>
							<td>USER</td>
                            <td>쪽지함 테스트</td>
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

</script>
</html>

