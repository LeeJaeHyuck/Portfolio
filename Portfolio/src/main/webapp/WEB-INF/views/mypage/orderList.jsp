<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp" %>

<h1>주문내역</h1>

<form name="order" method="post" action="all_pay_form">
<table class="table" style="text-align:center">
  <thead class="thead-dark">
    <tr>
      <th scope="col">상품명</th>
      <th scope="col">가격</th>
      <th scope="col">주문날짜</th>
      <th scope="col">주문상태</th>
      <th scope="col">상세 조회</th>
    </tr>
  </thead>
  <tbody>
  <c:if test="${empty orderList}">
  	<tr><td colspan="5" style="color:red;"><h4>주문내역이 없습니다.</h4></td></tr>
  </c:if>
  
    <c:forEach var="order" items="${orderList}">
    	<tr>
    	<td><a href="order_detail?oseq=${order.oseq}">${order.pname}</a></td>
    	<td><fmt:formatNumber value="${order.price2}" />원</td>
    	<td><fmt:formatDate value="${order.regdate}" pattern="yyyy년 MM월 dd일"/> </td>
    	<td>
    		<c:choose>
    			<c:when test="${order.result == 1}">
    			<font color="blue">배송중</font>
    			</c:when>
    			<c:otherwise>
    			<font color="red">배송완료</font>
    			</c:otherwise>
    		</c:choose>		
      	</td>
      	<td><input type="button" class="btn btn-outline-danger" onclick="location='order_detail?oseq=${order.oseq}'" value="조회"></td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<hr>
<div align="right">
<button type="button" class="btn btn-outline-secondary" onclick="location='index'">쇼핑하러 가기</button>
</div>
</form>
<%@ include file="../footer.jsp" %>