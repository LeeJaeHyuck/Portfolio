<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<h1>문의등록</h1>
<hr>
<form name="cont" action="send_contact" method="post">
<div class="sign">
  <div class="form-group">
    <input type="text" class="form-control" id="exampleFormControlInput1" name="title" style="border:none;" placeholder="제목">
  </div>
<hr>
  <div class="form-group">
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name="content" style="border:none; resize: none;" placeholder="내용"></textarea>
  </div>
  <input type="hidden" name="id" value="${loginUser.id}">
  <div align="right">
  <input type="reset" class="btn btn-outline-secondary" value="취소" onclick="javascript:history.go(-1)">
  <input type="submit" class="btn btn-primary" value="보내기" onclick="return contact_check()">
  </div>
</div>
</form>

<%@ include file="../footer.jsp"%>