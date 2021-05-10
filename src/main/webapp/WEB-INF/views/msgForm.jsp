<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
	<form name="msgForm" method="GET">
		<table>
			<tr>
				<th>보내는 사람</th>
				<td><input id="sender" type="text" name="sender"
					value="${loginId}" readonly></td>
			</tr>
			<tr>
				<th>받는 사람</th>
				<td><c:set var="rcver" value="${receiver}"></c:set> <c:if
						test="${rcver == null}">
						<input id="receiver" type="text" name="receiver">
					</c:if> <c:if test="${rcver != null}">
						<input id="receiver" type="text" name="receiver"
							value="${receiver}" readonly />
					</c:if></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="content" name="content" id="" cols="30"
						rows="10" maxlength="1000"></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input id="btn"type="button" onclick="goSubmit()" value="보내기" /></th>
			</tr>
		</table>
	</form>
</body>
<script>
	/* function goSubmit(){
		window.opener.name="parentPage";
		
		document.msgForm.target = "parentPage";
		
		document.msgForm.action="sendMsg";
		
		document.msgForm.submit();
		self.close();
	} */
	function goSubmit() {

		var $sender = $("#sender");
		var $receiver = $("#receiver");
		var $content = $("#content");

		var params = {};
		var reqUrl = './sendMsg';
		params.sender = $sender.val();
		params.receiver = $receiver.val();
		params.content = $content.val();

		$.ajax({

			url : reqUrl,
			type : 'POST',
			data : params,
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				alert(data.msg);
				if (data.success > 0) {
					self.close();
					opener.parent.location.reload();
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
</script>
</html>