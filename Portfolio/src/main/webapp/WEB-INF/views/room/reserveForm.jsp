<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp" %>
<h1>예약하기</h1>
<form name="form" method="post" action="reserve_room">
<input type="hidden" name="date" value="${book.date}">
<table class="table" style="text-align:center">
  <thead class="thead-dark">
    <tr>
      <th scope="col">방번호</th>
      <th scope="col">날짜</th>
      <th scope="col">인원</th>
      <th scope="col">가격</th>
    </tr>
  </thead>
  <tbody>
    	<tr>
    	<td><a href="room_detail?roomNum=${room.roomNum}">${room.roomNum}</a></td>
    	<td><fmt:parseDate var="redate" value="${book.date}" pattern="yyyyMMdd" ></fmt:parseDate>
    		<output name="format"><fmt:formatDate value="${redate}" pattern="yyyy년 MM월 dd일" /></output><br>
    		<input type="button" value="날짜 선택" onclick="opendate()"></td>
    	<td>
    		<select name="person">
    			<c:forEach var="i" begin="1" end="${room.person}" step="1" varStatus="status">
    				<option value="${status.count}">${status.count}</option>
    			</c:forEach>
    		</select>
    	</td>
    	<td>
    	<input type="hidden" value="${room.roomNum}" name="roomNum">
    	<input type="hidden" value="${room.price }" name="price">
		<fmt:formatNumber value="${room.price}"></fmt:formatNumber>원</td>
    	</tr>
  </tbody>
</table>

<h3>예약자 정보</h3>

<table class="table" style="text-align:center">
  <thead class="thead-dark">
    <tr>
      <th scope="col">예약자ID</th>
      <th scope="col">예약자명</th>
      <th scope="col">전화번호</th>
      <th scope="col">결제방식</th>
    </tr>
  </thead>
  <tbody>
    	<tr>
    	<td>${user.id}</td>
    	<td>${user.name}</td>
    	<td>${user.phone}</td>
    	<td>
    	<label><input type="radio" name="pay" value="1">신용카드</label> 
		<label><input type="radio" name="pay" value="2">계좌이체</label>
		<label><input type="radio" name="pay" value="3">휴대폰  </label>
		</td>
    	</tr>
  </tbody>
</table>
<div align="right">
<button type="button" class="btn btn-outline-secondary" onclick="location='index'">취소</button>
<button type="submit" class="btn btn-primary" onclick="return reserveCheck()">예약</button>
</div>
</form>
<%@ include file="../footer.jsp" %>