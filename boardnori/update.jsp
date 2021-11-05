<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.board" %>
<%@ page import="board.boardDAO" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>글 보기</title>
  </head>
  <body>
  <%
  
  PrintWriter pw = response.getWriter();
  String userID=null;
  if(session.getAttribute("userID")!=null){
	  userID = (String) session.getAttribute("userID");
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
  board board = new boardDAO().getBoard(boardID);
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
 <form method="post" action="updateAction.jsp?boardID=<%=boardID %>">
 <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">글수정 양식</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="60" value="<%=board.getBoardTitle() %>"></td>
    </tr>
    <tr>
      <td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="4096" style="height: 360px;"><%=board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","%gt;") %></textarea></td>
    </tr>
  </tbody>
</table>
<input type="submit" class="btn btn-primary" value="작성완료">
 </form>
  </body>
</html>