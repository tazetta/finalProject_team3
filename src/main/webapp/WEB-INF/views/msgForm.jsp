<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
	<form name="msgForm" method="GET">
		<table>
			<tr>
				<th>보내는 사람</th>
				<td><input id="sender" type="text" name="sender"
					value="${loginId}"></td>
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
						rows="10"></textarea></td>
			</tr>
			<tr>
				<th><input type="button" onclick="goSubmit()" value="보내기" /></th>
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
			type : 'GET',
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