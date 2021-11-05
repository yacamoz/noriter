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
 <form>
 <table class="table">
  <thead>
    <tr>
      <th><%=board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","%gt;").replaceAll("\n", "<br>") %></th>
    </tr>
  </thead>
  <tbody>
  	<tr>
  	<td>글쓴이: <%=board.getUserID() %></td>
  	<td>작성일: <%=board.getBoardDate() %></td>
  	</tr>
    <tr>
      <td colspan="12" height="480px"><%=board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","%gt;").replaceAll("\n", "<br>") %></td>
    </tr>
  </tbody>
</table>
<a href="board.jsp" class="btn btn-dark">목록</a>
<%
	if(userID != null && userID.equals(board.getUserID())) { %>
		<a href="update.jsp?boardID=<%=boardID %>" class="btn btn-dark">수정</a>
		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?boardID=<%=boardID %>" class="btn btn-danger">삭제</a>
<%} %>
 </form>
  </body>
</html>