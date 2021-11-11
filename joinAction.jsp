<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.memberDAO"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>A팀 프로젝트-로그인</title>
	</head>
	<body>
	<%PrintWriter pw = response.getWriter(); %>
	<%
	String userID=request.getParameter("Id");
	String userPassword=request.getParameter("Pw");
	String userName=request.getParameter("Name");
	int userPhone=0;
	try {
		userPhone = Integer.parseInt(request.getParameter("Phone"));
	} catch (NumberFormatException e) {
		pw.println("<script>");
		pw.println("alert('전화번호 입력이 잘못되었습니다.')");
		pw.println("history.back()");
		pw.println("</script>");
	}
	
	if(userID==""||userPassword==""||userName==""){
		pw.println("<script>");
		pw.println("alert('빠진 항목이 존재합니다.')");
		pw.println("history.back()");
		pw.println("</script>");
	}
	
	
 	memberDAO dao=new memberDAO();
 	if(userPhone!=0) {
//	dao.signUp(userID,userPassword,userName,userPhone);
	System.out.println("회원가입 성공");
	response.sendRedirect("./main.jsp");
 	}
	%>
	</body>
</html>