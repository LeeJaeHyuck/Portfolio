<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body>
<div id="login">
<h1>로그인</h1>
<form action="login" method=post name="log">
  <div class="form-group">
    <label for="exampleInputEmail1">아이디</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="id">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">비밀번호</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="pwd">
  </div>
  <div align="center">
  <a href="#" onclick="find_id()">아이디 /</a><a href="#" onclick="find_pwd()"> 비밀번호 찾기</a><br>
  <button type="submit" class="btn btn-primary" onclick="return loginCheck()">로그인</button>
  <button type="button" class="btn btn-primary" onclick="location='contract'">회원가입</button>
  </div>
</form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>