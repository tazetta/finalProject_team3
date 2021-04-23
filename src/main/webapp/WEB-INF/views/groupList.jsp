<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매</title>
</head>
<body>

<button onclick="location.href='groupWriteForm'">글쓰기</button>

</body>
<script>
var msg="${msg}";
if(msg!=""){
	 alert(msg);
}
</script>
</html>