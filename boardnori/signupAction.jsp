<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ||
			user.getUserGender() == null) {
		pw.println("<script>");
		pw.println("alert('빠진 부분이 있어용')");
		pw.println("history.back()");
		pw.println("</script>");
	}

	user1.signUp(user.getUserID(), user.getUserPassword(), user.getUserName(), user.getUserGender(), user.getUserEmail());
	
	pw.println("<script>");
	pw.println("location.href='login.jsp'");
	pw.println("</script>");
%>
</body>
</html>