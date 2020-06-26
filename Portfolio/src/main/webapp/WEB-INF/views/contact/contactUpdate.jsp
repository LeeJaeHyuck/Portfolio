<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<h1>Contact</h1>
<hr>
<form name="cont" action="contact_update" method="post">
<input type="hidden" value="${contact.cseq }" name="cseq">
<div class="sign">
  <div class="form-group">
    <input type="text" class="form-control" id="exampleFormControlInput1" name="title" value="${contact.title }">
  </div>
	<hr>
  <div class="form-group">
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name="content">${contact.content}</textarea>
  </div>
  
  <div align="right">
  <input type="button" class="btn btn-outline-secondary" value="취소" onclick="javascript:history.go(-1)">
  <input type="submit" class="btn btn-primary" value="수정">
  </div>
</div>
</form>
<%@ include file="../footer.jsp"%>