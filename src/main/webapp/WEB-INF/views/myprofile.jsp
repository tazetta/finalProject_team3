<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>회원정보</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>



.sideBar {
	float: left;
}

table, td {
    position: relative;
	padding: 20px;
	width: 200px;
    
	font-family: Arial, Helvetica, sans-serif;
}



.flexBox {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}


input[type="button"], input[type="submit"] {
	background-color: #acd3fb;
	cursor: pointer;
	color: white;
	font-weight: bold;
    left: 250px;
    margin: 30px;
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
	<iframe src="mainnavi" scrolling="no" frameborder="0" style="width: 100%; "></iframe>
	<div class="flexBox" >
		<div style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #f2f2f2;">
			<div class="sideBar" style="margin-right: 15px;">
				<iframe class="마이프로필네비" src="mynavi" scrolling="no" frameborder="0"
				style="height: 650px; float: left; width:250px;" ></iframe>
			</div>
			<div class="sideBar">
			<h1>회원정보</h1>
            <table id="profile">
				<th >ID</th>
					<td>${sessionScope.loginId}</td>
				</tr>
				<tr>
					<th>NAME</th>
					<td>${profile.name}</td>
				</tr>
				<br/>
				<tr>
					<th>PHONE</th>
					<td>${profile.phone}</td>
				</tr>
				<br/>
				<tr>
					<th>EMAIL</th>
					<td>${profile.email}</td>
				</tr>
				<th>비밀번호</th>
					<td><input type="password" name="userPw" id="userPw"></td>
				</tr>
                <tr>
                    <td>
					<input type="button" id="btn" value="회원정보 수정"/>
                </td>
				</tr>
                </table>
			</div>
</body>
<script>



</script>
</html>
