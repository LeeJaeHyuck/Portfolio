<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<form name="form" action="direct_pay_form">
<input type="hidden" name="pseq" value="${product.pseq}">
<div class="media">
  <img src="product_images/${product.image}" class="align-self-center mr-3" width="50%" height="400px;" alt="image" />
  <div class="media-body">
    <h3>${product.name}</h3>
    <h5>${product.content}</h5>
			<table class="bordernone">
				<tr>
					<td>판매가격</td>
					<td><fmt:formatNumber value="${product.price2}" />원</td>
				<tr>
					<td>배송방법</td>
					<td>택배발송</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td>무료배송 (50,000원 이상 구매시 무료)</td>
				</tr>
				<tr>
					<td>배송지역</td>
					<td>전국</td>
				</tr>
				<tr>
					<td>상품평점</td>
					<td>[0명]</td>
				</tr>
				<tr>
					<td>수량선택</td>
					<td><input type="button" value="-" onclick="change(-1, '${product.price2}')">
					<input type="text" name="quantity" value="1" size="1" style="text-align: center;">
					<input type="button" value="+" onclick="change(1, '${product.price2}')"></td>
				</tr>
			</table>
			<hr>
			<c:choose>
			<c:when test="${loginUser.authority == 2 }">
			<button type="button" class="btn btn-outline-secondary" style="width:49%;" onclick="location='update_product_form?pseq=${product.pseq}'">수정</button>
			<button type="button" class="btn btn-outline-secondary" style="width:49%;" onclick="return deleteProduct()">삭제</button>
			</c:when>
			<c:otherwise>
			<table class="bordernone">
				<tr>
				<th>수량</th>
				<td><output name="count">1</output>개</td>
				</tr>
				<tr>
				<th>가격</th>
				<td><output name="totalPrice">${product.price2}</output>원</td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-outline-secondary" style="width:100%" onclick="addCart()">장바구니 담기</button></td>
					<td><button type="button" class="btn btn-outline-secondary" style="width:100%" onclick="location='index'">쇼핑하러 가기</button></td>
				</tr>
				<tr>
				<td colspan="2"><input type="submit" class="btn btn-primary" style="width:100%" value="구매하기" onclick="return buy_check()"></td>
				</tr>
			</table>
			</c:otherwise>
			</c:choose>
		</div>
</div>
</form>
<%@ include file="comment.jsp" %>
<%@ include file="../footer.jsp" %>