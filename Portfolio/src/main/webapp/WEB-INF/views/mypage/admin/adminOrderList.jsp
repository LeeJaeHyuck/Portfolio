<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../header.jsp" %>
<script type="text/javascript">
</script>
<form name="order" method="post" action="admin_order_list">
<div>
  	<h3 style="float:left;" >주문 목록</h3>
  	<div style="float: right;">
    <input class="form-control1" type="search" placeholder="ID를 입력하세요." aria-label="Search" name="key">
    <button type="submit" class="btn btn-outline-success">검색</button>
    </div>
 </div>
<table class="table" style="text-align:center;">
  <thead class="thead-dark">
    <tr>
      <th scope="col"><input type="checkbox" name="checkAll" onclick="check_all()"/>주문번호<br>(처리여부)</th>
      <th scope="col">주문자</th>
      <th scope="col">상품명</th>
      <th scope="col">수량</th>
      <th scope="col">우편번호</th>
      <th scope="col">배송지</th>
      <th scope="col">전화</th>
      <th scope="col">주문일</th>
    </tr>
  </thead>
  <tbody style="font-size:0.8em;">
  <c:if test="${empty orderList}">
  	<tr><td colspan="8" style="color:red;"><h4>주문내역이 없습니다.</h4></td></tr>
  </c:if>
  
    <c:forEach var="order" items="${orderList}">
    	<tr>
    	<td>
    		<c:choose>
        		<c:when test='${order.result=="1"}'>
        		<input type="checkbox" name="result" value="${order.odseq}" onclick="result_check()">
        		<span style="font-weight: bold; color: blue">${order.oseq}</span><br>
        		(미처리)
        		</c:when>
        		<c:otherwise>
        		<input type="checkbox" checked="checked" disabled="disabled">
          		<span style="font-weight: bold; color: red">${order.oseq}</span><br>
          		(처리완료)
        		</c:otherwise>
      		</c:choose>
      	</td>
    	<td><a href="member_detail?id=${order.id}">${order.id}</a></td>
    	<td><a href="product_detail?pseq=${order.pseq}">${order.pname}</a></td>
    	<td>${order.quantity}</td>
    	<td>${order.postNum}</td>
    	<td>${order.addr1} ${order.addr2}</td>
    	<td>${order.phone}</td>
    	<td><fmt:formatDate value="${order.regdate}" pattern="yyyy-MM-dd"/> </td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<hr>
<div align="right">
<button type="submit" class="btn btn-outline-secondary" onclick="return admin_order_del()">주문취소</button>
<button type="button" class="btn btn-outline-secondary" onclick="return admin_order_save()">주문처리</button>
</div>
</form>
<%@ include file="../../footer.jsp" %>