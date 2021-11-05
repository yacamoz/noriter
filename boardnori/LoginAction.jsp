<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>웰컴투메뚜기월드</title>
</head>
<body>
<%PrintWriter pw = response.getWriter(); %>
<%
	String userID=null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		
	}
	if (userID != null) {
		pw.println("<script>");
		pw.println("alert('이미 로그인됨')");
		pw.println("location.href='main.jsp");
		pw.println("</script>");
	}
	
	userDAO user1 = new userDAO();
	int result = user1.login(user.getUserID(), user.getUserPassword());
	if (result == 1) {
		session.setAttribute("userID", user.getUserID());
		pw.println("<script>");
		pw.println("location.href='main.jsp'");
		pw.println("</script>");
	}
	if (result == 0) {
		pw.println("<script>");
		pw.println("alert('비밀번호가 틀려용')");
		pw.println("history.back()");
		pw.println("</script>");
	}
	if (result == -1) {
		pw.println("<script>");
		pw.println("alert('아이디가 없어용')");
		pw.println("location.href='login.jsp'");
		pw.println("</script>");
	}
	if (result == -2) {
		pw.println("<script>");
		pw.println("alert('다 틀린 것 같아용')");
		pw.println("location.href='login.jsp'");
		pw.println("</script>");
	}
%>
</body>
</html>