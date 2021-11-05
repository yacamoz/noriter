<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.boardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="board" class="board.board" scope="page"/>
<jsp:setProperty name="board" property="boardTitle"/>
<jsp:setProperty name="board" property="boardContent"/>
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
	if (userID == null) {
		pw.println("<script>");
		pw.println("alert('로그인 하세용')");
		pw.println("location.href='main.jsp");
		pw.println("</script>");
	} else {
		if(board.getBoardTitle()==null||board.getBoardContent()==null){
			pw.println("<script>");
			pw.println("alert('글 제목과 글 내용을 써주세용')");
			pw.println("history.back()");
			pw.println("</script>");
		}
	}
	  int boardID=0;
	  if (request.getParameter("boardID") != null){
		  boardID = Integer.parseInt(request.getParameter("boardID"));
	  }
	  if (boardID==0) {
		  pw.println("<script>");
		  pw.println("alert('유효하지 않은 글')");
		  pw.println("location.href = 'board.jsp'");
		  pw.println("</script>");
	  }
	boardDAO board1 = new boardDAO();
	int result = board1.updateTitle(board.getBoardTitle(), boardID);
	int result2 = board1.updateContent(board.getBoardContent(), boardID);
	if(result==-1 || result2==-1) {
		pw.println("<script>");
		pw.println("alert('글수정 실패')");
		pw.println("history.back()");
		pw.println("</script>");
	}
	else {
		pw.println("<script>");
		pw.println("location.href ='board.jsp'");
		pw.println("</script>");
	}
%>
</body>
</html>