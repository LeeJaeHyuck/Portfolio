<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../header.jsp" %>
<script type="text/javascript">
</script>
<form name="book" method="post" action="admin_reserve_list">
  	<div align="right">
  	<h3 style="float:left;" >예약 목록</h3>
    <input class="form-control1" type="search" placeholder="ID를 입력하세요." aria-label="Search" name="search">
    <button type="submit" class="btn btn-outline-success">검색</button>
    </div>
<table class="table" style="text-align:center;">
  <thead class="thead-dark">
    <tr>
      <th scope="col"><input type="checkbox" name="checkAll" onclick="reserve_check_all()"/>예약번호(처리여부)</th>
      <th scope="col">예약자</th>
      <th scope="col">방번호</th>
      <th scope="col">예약날짜</th>
      <th scope="col">인원</th>
      <th scope="col">전화번호</th>
    </tr>
  </thead>
  <tbody >
  <c:if test="${empty bookList}">
  	<tr><td colspan="6" style="color:red;"><h4>예약내역이 없습니다.</h4></td></tr>
  </c:if>
  
    <c:forEach var="book" items="${bookList}">
    	<input type="hidden" name="bseq" value="${book.bseq}">
    	<tr>
    	<td>
    		<c:choose>
        		<c:when test='${book.result=="1"}'>
        		<input type="checkbox" name="result" value="${book.bseq}" onclick="reserve_result_check()">
        		<span style="font-weight: bold; color: blue">${book.bseq}</span>
        		(미처리)
        		</c:when>
        		<c:otherwise>
        		<input type="checkbox" checked="checked" disabled="disabled">
          		<span style="font-weight: bold; color: red">${book.bseq}</span>
          		(처리완료)
        		</c:otherwise>
      		</c:choose>
      	</td>
    	<td><a href="member_detail?id=${book.id}">${book.id}</a></td>
    	<td><a href="room_detail?roomNum=${book.roomNum}">${book.roomNum}</a></td>
    	<td><fmt:formatDate value="${book.reserveDate}" pattern="yyyy-MM-dd"/></td>
    	<td>${book.person}명</td>
    	<td>${book.phone}</td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<hr>
<div align="right">
<button type="button" class="btn btn-outline-secondary" onclick="return admin_reserve_del()">예약취소</button>
<button type="button" class="btn btn-outline-secondary" onclick="admin_reserve_save()">예약처리</button>
</div>
</form>
<%@ include file="../../footer.jsp" %>