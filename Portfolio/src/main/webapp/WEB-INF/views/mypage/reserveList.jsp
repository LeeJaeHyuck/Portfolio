<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp" %>
<h1>예약내역</h1>

<form name="book" method="post" action="book_del">
<table class="table" style="text-align:center">
  <thead class="thead-dark">
    <tr>
      <th style="width:3%;"><input type="checkbox" name="checkAll" onclick="reserve_check_all()"/></th>
      <th scope="col">방번호</th>
      <th scope="col">예약자명</th>
      <th scope="col">사용날짜</th>
      <th scope="col">가격</th>
      <th scope="col">인원</th>
      <th scope="col">예약한날짜</th>
    </tr>
  </thead>
  <tbody>
  <c:if test="${empty bookList}">
  	<tr><td colspan="7" style="color:red;"><h4>예약내역이 없습니다.</h4></td></tr>
  </c:if>
    <c:forEach var="book" items="${bookList}">
    	<tr>
    	<c:if test="${book.result == 1}">
    		<td><input type="checkbox" name="result" value="${book.bseq}" onclick="reserve_result_check()"></td>
    	</c:if>
    	<c:if test="${book.result == 2}">
    		<td><input type="checkbox" name="result" value="${book.bseq}" disabled="disabled" checked></td>
    	</c:if>
    	<td><a href="room_detail?roomNum=${book.roomNum}">${book.roomNum}호</a></td>
    	<td>${book.name}</td>
    	<td><fmt:formatDate value="${book.reserveDate}" pattern="yyyy년 MM월  dd일"/></td>
    	<td><fmt:formatNumber value="${book.price}"></fmt:formatNumber></td>
    	<td>${book.person} 명</td>
    	<td><fmt:formatDate value="${book.regDate}" pattern="yyyy년 MM월  dd일"/></td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<div align="right">
<button type="submit" class="btn btn-outline-secondary" onclick="return reserve_del()">예약취소</button>
<button type="button" class="btn btn-outline-secondary" onclick="location='index'">쇼핑하러 가기</button>
</div>
</form>

<%@ include file="../footer.jsp" %>