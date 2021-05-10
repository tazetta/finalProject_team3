<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<style>
input {
	border: none;
}
input:focus{
	outline: none;
}
table tr td{
	
	padding :10px 3px;
}
#content{
	width:370px;
	heigth:500px;
	resize:none;
	font-size:14px;
}
   #btn{
      color: white;
    background-color: #166cea;
    border:none;
    border-radius: 2px;
    font-weight: bold;
     padding: 8px;
     width:200px;
     height:40px;
     border-radius: 4px;
    }
    #btn:hover{
       background-color: white;
    color: #166cea;
    border: 1px solid #166cea;
    cursor: pointer;
    box-shadow: 0px 5px 5px rgb(235, 232, 232);
     transition: all .4s ease;
    }
</style>
</head>
<body>
	<h3>쪽지 상세보기</h3>
	<form name="msgDetailPage" method="GET">
		<table>
			<tr>
				<th>보낸사람</th>
				<td><input id="sender" type="text" value="${info.sender}"
					readonly /></td>
			</tr>
			<tr>
				<th>받는 사람</th>
				<td><input id="receiver" type="text" value="${info.receiver}"
					readonly /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td id="content">${info.content}</td>
			</tr>
			<c:set var="sender" value="${info.sender}"></c:set>
			<c:set var="loingId" value="${sessionScope.loginId}"></c:set>
			<c:if test="${sender == loingId}"></c:if>
			<c:if test="${sender != loingId}">
				<tr>
					<th colspan="2"><input id="btn" type="button"
						onclick="reMsgFormPopUp('${info.sender}')" value="답장" /></th>
				</tr>
			</c:if>
		</table>
	</form>
</body>
<script>
	//+$sender.val()+'/'+$receiver.val();
	/* function reMsgFormPopUp(){
		var $sender  = $("#receiver");
		var $receiver = $("#sender");
		var reqUrl = './reMsgFormPopUp';
		var params = {};
		console.log($receiver.val());
		params.sender = $sender.val();
		params.receiver = $receiver.val();
		$.ajax({
			url:reqUrl
			,type:'GET'
			,data:params
			,dataType:'JSON'
			,success:function(data){
				console.log(data);
				if(data.success){
					
					
					window.open(data.url,"쪽지보내기폼","width=500, height=450");
				}
			},error:function(error){
				console.log(error);
			}
		})
	} */

	function reMsgFormPopUp(receiver) {
		//var receiver = $("#sender").val();
		var url = "../reMsgFormPopUp/" + receiver;
		console.log(receiver);
		window.open(url, "답장하기폼", "width=500, height=450");
		self.close();
	}
</script>
</html>