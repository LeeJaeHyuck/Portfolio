<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGN UP</title>
<script type="text/javascript">
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="sign">
<h1>회원정보</h1>
<form action="update_member" method="post" name="sign">
	<input type="hidden" name="pass" value="${user.pwd}">
    <div class="form-group">
      <label for="inputEmail4">아이디</label><br>
      <input type="text" class="form-control" id="inputEmail4" name="id" value="${user.id}" readonly>
    </div>
    
    <div class="form-group">
      <label for="inputPassword4">비밀번호</label>
      <input type="password" class="form-control" id="inputPassword4" name="pwd" placeholder="변경하실때만 입력해주세요.">
    </div>
    
    <div class="form-group">
      <label for="inputPassword4">비밀번호 확인</label>
      <input type="password" class="form-control" id="inputPassword4" name="pwdCheck" placeholder="변경하실때만 입력해주세요.">
    </div>
    
    <div class="form-group">
      <label for="inputPassword4">이름</label>
      <input type="text" class="form-control" id="inputPassword4" name="name" value="${user.name}">
    </div>  
    
    <div class="form-group">
      <label for="inputPassword4">주민번호</label><br>
      <input type="text" class="form-control" id="regNum" name="regNum1" value="${regNum1}" readonly> - 
      <input type="password" class="form-control" id="regNum" name="regNum2" value="${regNum2}" readonly>
    </div>  
    
  <div class="form-group">
      <label for="inputEmail4">이메일</label>
      <input type="email" class="form-control" id="inputEmail4" name="email" value="${user.email}">
    </div>
   
  <div class="form-group">
      <label for="inputEmail4">우편번호</label><br>
      <table>
      <tr>
      <th style="width:75%">
      <input type="text" class="form-input" id="inputEmail4" name="postNum" value="${user.postNum}" readonly>
      </th>
      <th style="text-align:center">
      <button type="button" class="btn btn-primary" onclick="find_addr()">주소찾기</button>
      </th>
      </tr>
      </table>
    </div>
    
  <div class="form-group">
    <label>주소</label>
    <input type="text" class="form-control" name="addr1" value="${user.addr1}" readonly>
    <label>상세 주소</label><br>
    <input type="text" class="form-control" id="regNum" name="addr2" value="${user.addr2}">
  </div> 
  
  <div class="form-group">
      <label for="inputPassword4">전화번호</label>
      <input type="text" class="form-control" id="inputPassword4" name="phone" value="${user.phone}">
    </div>  
  
  <div align="center">
  <button type="submit" class="btn btn-primary" onclick="return member_update()">수정</button>
  <button type="reset" class="btn btn-primary" onclick="javascript:history.go(-1)">취소</button>
  <button type="button" class="btn btn-danger" style="float:right" onclick="return deleteCheck()">탈퇴</button>
  </div>
</form></div>
<%@ include file="../footer.jsp" %>
</body>
</html>