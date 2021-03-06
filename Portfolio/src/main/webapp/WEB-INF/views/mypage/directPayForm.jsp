<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp" %>
<h1>주문하기</h1>
<form name="order" method="post" action="direct_insert_order?pseq=${product.pseq}&qty=${quantity}">
<table class="table" style="text-align:center">
  <thead class="thead-dark">
    <tr>
      <th scope="col">상품명</th>
      <th scope="col">수량</th>
      <th scope="col">개당가격</th>
      <th scope="col">가격</th>
    </tr>
  </thead>
  <tbody>
    	<tr>
    	<td><a href="product_detail?pseq=${product.pseq}">${product.name}</a></td>
    	<td>${quantity}</td>
    	<td><fmt:formatNumber value="${product.price2}"></fmt:formatNumber>원</td>
    	<td>
    	<input type="hidden" value="${product.pseq}" name="pseq">
    	<fmt:formatNumber value="${product.price2 * quantity}"></fmt:formatNumber>원</td>
    	</tr>
  </tbody>
</table>
<hr>
<div id="paydiv" align="center">
<h3>주문자 정보</h3>
<table id="paytable">
<tr>
<th>주문자명</th><td>${user.name}</td></tr>
<tr><th>전화번호</th><td>${user.phone}</td></tr>
<tr><th>우편번호</th><td><input type="text" value="${user.postNum}" name="postNum" readonly>
<input type="button" value="배송지 변경" onclick="change_address()"></td></tr>
<tr><th>주소</th><td><input type="text" value="${user.addr1}" name="addr1" size="35" readonly></td></tr>
<tr><th>상세 주소</th><td><input type="text" value="${user.addr2}" name="addr2"></td></tr>
<tr><th>결제 방식</th>
<td>
<label><input type="radio" name="pay" value="1">신용카드</label> 
<label><input type="radio" name="pay" value="2">계좌이체</label>
<label><input type="radio" name="pay" value="3">휴대폰  </label>
</td></tr>
</table>
</div>
<br>
<div align="right">
<button type="button" class="btn btn-outline-secondary" onclick="location='index'">쇼핑하러 가기</button>
<input type="submit" class="btn btn-primary" onclick="return payCheck()" value="구매">
</div>
</form>
<%@ include file="../footer.jsp" %>