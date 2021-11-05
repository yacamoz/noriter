<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>회원가입 페이지!</title>
  </head>
  <body>
    <h1>회원가입 해보아용</h1>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <form method="post" action="signupAction.jsp">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">아이디</label>
    <input type="text" class="form-control" name="userID", maxlength="20">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
    <input type="password" class="form-control" name="userPassword" maxlength="16">
  </div>
    <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">이름</label>
    <input type="text" class="form-control" name="userName" maxlength="30">
  </div>
    <div class="mb-3" style-"text-align: center;">
   		<div class="btn-group" data-toggle="buttons">
   			<label calss="btn btn-primary active">
   				<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
   			</label>
 		</div>
 		<div class="btn-group" data-toggle="buttons">
   			<label calss="btn btn-primary active">
   				<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
   			</label>
 		</div>
    </div>
    <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">이메일</label>
    <input type="email" class="form-control" name="userEmail" maxlength="30">
  </div>
  <button type="submit" class="btn btn-primary">보내기</button>
</form>
  </body>
</html>