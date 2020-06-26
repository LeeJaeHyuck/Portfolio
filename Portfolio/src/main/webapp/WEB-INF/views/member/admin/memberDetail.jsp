<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
<%@ include file="../../header.jsp" %>
<div class="sign">
<h1>회원정보</h1>
<form action="admin_update_member" method="post" name="mdetail">
	<input type="hidden" name="pwd" value="${member.pwd}">
    <div class="form-group">
      <label for="inputEmail4">아이디</label><br>
      <input type="text" class="form-control" id="inputEmail4" name="id" value="${member.id}">
    </div>
    
    <div class="form-group">
      <label for="inputPassword4">이름</label>
      <input type="text" class="form-control" id="inputPassword4" name="name" value="${member.name}">
    </div>  
    
  <div class="form-group">
      <label for="inputEmail4">이메일</label>
      <input type="email" class="form-control" id="inputEmail4" name="email" value="${member.email}">
    </div>
   
  <div class="form-group">
      <label for="inputEmail4">우편번호</label><br>
      <table>
      <tr>
      <th style="width:75%">
      <input type="text" class="form-input" id="inputEmail4" name="postNum" value="${member.postNum}" readonly>
      </th>
      <th style="text-align:center">
      <button type="button" class="btn btn-primary" onclick="find_addr()">주소찾기</button>
      </th>
      </tr>
      </table>
    </div>
    
  <div class="form-group">
    <label>주소</label>
    <input type="text" class="form-control" name="addr1" value="${member.addr1}" readonly>
    <label>상세 주소</label><br>
    <input type="text" class="form-control" id="regNum" name="addr2" value="${member.addr2}">
  </div> 
  
  <div class="form-group">
      <label for="inputPassword4">전화번호</label>
      <input type="text" class="form-control" id="inputPassword4" name="phone" value="${member.phone}">
    </div>  
    
      <div class="form-group">
      <label for="inputPassword4">권한</label><br>
      	<c:if test="${member.authority == 1}">
			<label><input type="radio" name="authority" value="1" checked>사용자</label>
			<label><input type="radio" name="authority" value="2">관리자</label>
		</c:if>
		<c:if test="${member.authority == 2}">
			<label><input type="radio" name="authority" value="1">사용자</label>
			<label><input type="radio" name="authority" value="2" checked>관리자</label>
		</c:if>
    </div>  
    
     <div class="form-group">
      <label for="inputPassword4">탈퇴 여부</label><br>
		<c:if test="${member.useyn == 'y'}">
			<label><input type="radio" name="useyn" value="y" checked>사용중</label>
			<label><input type="radio" name="useyn" value="n">탈퇴</label>
		</c:if>
		<c:if test="${member.useyn == 'n'}">
			<label><input type="radio" name="useyn" value="y">사용중</label>
			<label><input type="radio" name="useyn" value="n" checked>탈퇴</label>
		</c:if>
    </div>  
  
  <div align="center">
  <button type="submit" class="btn btn-primary" onclick="return change_info()">수정</button>
  <button type="reset" class="btn btn-primary">취소</button>
  </div>
</form></div>
<%@ include file="../../footer.jsp" %>
</body>
</html>