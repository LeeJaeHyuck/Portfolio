<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp" %>
<h1>장바구니</h1>
<form name="cart" method="post" action="all_pay_form">
<table class="table" style="text-align:center">
  <thead class="thead-dark">
    <tr>
      <th scope="col">상품명</th>
      <th scope="col">수량</th>
      <th scope="col">가격</th>
      <th scope="col">삭제</th>
    </tr>
  </thead>
  <tbody>
  <c:if test="${empty cartList}">
  	<tr><td colspan="4" style="color:red;"><h4>장바구니가 비었습니다.</h4></td></tr>
  </c:if>
    <c:forEach var="cart" items="${cartList}">
    	<tr>
    	<td><a href="product_detail?pseq=${cart.pseq}">${cart.pname}</a></td>
    	<td>${cart.quantity}</td>
    	<td><fmt:formatNumber value="${cart.price2 * cart.quantity}"></fmt:formatNumber>원</td>
    	<td>
    	<input type="hidden" value="${cart.cseq}" name="cseq">
    	<input type="button" class="btn btn-outline-danger" onclick="deleteCart()" value="삭제">
    	<input type="button" class="btn btn-outline-primary" onclick="location='pay_form?cseq=${cart.cseq}'" value="구매"></td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<div align="right">
<button type="button" class="btn btn-outline-secondary" onclick="alldeleteCart()">전체삭제</button>
<button type="button" class="btn btn-outline-secondary" onclick="location='index'">쇼핑하러 가기</button>
<input type="submit" class="btn btn-primary" value="전체구매">
</div>
</form>
<%@ include file="../footer.jsp" %>