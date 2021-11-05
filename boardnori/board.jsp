<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.boardDAO" %>
<%@ page import="board.board" %>
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>보-드</title>
  </head>
  <body>
  <%
  
  PrintWriter pw = response.getWriter();
  String userID=null;
  if(session.getAttribute("userID")!=null){
	  userID = (String) session.getAttribute("userID");
  }
  int pageNumber = 1;
  if(request.getParameter("pageNumber") != null) {
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
  }
  int pageBlock = (pageNumber-1)/5;
  %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 	  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">대충 '바'라는 뜻</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="main.jsp">집</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="board.jsp">게시판</a>
        </li>
       <%if(userID==null){
    	   %>
    	   <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            내림
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="signup.jsp">회원가입</a></li>
            <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
          </ul>
        </li>
      </ul>
       <% }%>
       <%if(userID != null){ %>
           <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            내림
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="userInfo.jsp">회원정보</a></li>
            <li><a class="dropdown-item" href="logout.jsp">로그아웃</a></li>
          </ul>
        </li>
      </ul>
       <%} %>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
 <h1>Board</h1>
 <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">날짜</th>
    </tr>
  </thead>
  <tbody>
  <%
  boardDAO boardDAO = new boardDAO();
  ArrayList<board> blist = boardDAO.getlist(pageNumber);
  for(int i=0;i<blist.size();i++){
  %>
    <tr>
      <td scope="row"><%= blist.get(i).getBoardID()%></td>
      <td><a class="text-decoration-none text-dark fw-bold" href="view.jsp?boardID=<%=blist.get(i).getBoardID() %>"><%=blist.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","%gt;").replaceAll("\n", "<br>") %></a></td>
      <td><%=blist.get(i).getUserID()%></td>
      <td><%=blist.get(i).getBoardDate() %></td>
    </tr>
 <%} %>
 <%if(userID != null){ %>
    <a href="write.jsp" class="btn btn-primary">글쓰기</a>
 <%} %>
  </tbody>
</table>
<%
	if(pageNumber != 1) {
%>
 <a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class = "btn btn-dark btn-arrow-left">&lt;이전</a>
 <%} if(boardDAO.nextPage(pageNumber+1)) {%>
 <a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class = "btn btn-dark btn-arrow-left">다음&gt;</a>
 <%} %>
 <br><br>
 <%
 	ArrayList<board> ablist = boardDAO.AllBoard();
 	int totalpage=0;
 	if(ablist.size()%10==0){
 		totalpage=ablist.size()/10;
 	}
 	else {
 		totalpage=(ablist.size()/10)+1;
 	}
 	for(int i=(pageBlock*5); i<(pageBlock*5)+5;i++){
 		if (totalpage<i+1) {break;}
 		if (pageNumber==i+1){
 %>
 <a href="board.jsp?pageNumber=<%=i+1 %>" class="btn btn-success"><%=i+1 %></a>
<%} else{%>
 <a href="board.jsp?pageNumber=<%=i+1 %>" class="btn btn-secondary"><%=i+1 %></a>
 <% } 
 }%>
 </body>
</html>