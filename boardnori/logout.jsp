<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그아웃액션</title>
</head>
<body>
<%
 session.invalidate();
%>
<script>
	location.href='main.jsp'
</script>
</body>
</html>