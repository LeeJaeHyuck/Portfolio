<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<script>
window.onload = function(){
	var val = document.update.originkind.value;
	document.update.kind.value = val;
}
</script>
<style>
</style>
<h1>상품수정</h1>
<hr>
<form action="update_product" method="post" enctype="multipart/form-data" name="update">
<input type="hidden" name="pseq" value="${product.pseq}">
<div align="center" style="width: 90%">
<table id="pwrite">
	<tr>
		<th>종류</th>
		<td colspan="5">
		<input type="hidden" value="${product.kind}" name="originkind">
		<select name="kind">
			<option value="1">피아노</option>
			<option value="2">기타</option>
			<option value="3">베이스</option>
			<option value="4">드럼</option>
			<option value="5">미디</option>
			<option value="6">악세사리</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>상품명</th>
		<td colspan="5"><input type="text" name="name" value="${product.name}"></td>
	</tr>
	<tr>
		<th>사용여부</th>
		<td colspan="5"><c:if test="${product.useyn == 'y'}">
			<label><input type="radio" name="useyn" value="y" checked>Y</label>
			<label><input type="radio" name="useyn" value="n">N</label>
			</c:if>
			<c:if test="${product.useyn == 'n'}">
			<label><input type="radio" name="useyn" value="y">Y</label>
			<label><input type="radio" name="useyn" value="n" checked>N</label>
			</c:if>
		</td>
	</tr>
	<tr>
		<th>베스트여부</th>
		<td colspan="5"><c:if test="${product.bestyn == 'y'}">
			<label><input type="radio" name="bestyn" value="y" checked>Y</label>
			<label><input type="radio" name="bestyn" value="n">N</label>
			</c:if>
			<c:if test="${product.bestyn == 'n'}">
			<label><input type="radio" name="bestyn" value="y">Y</label>
			<label><input type="radio" name="bestyn" value="n" checked>N</label>
			</c:if>
		</td>
	</tr>
	<tr>
		<th>원가</th>
		<td><input type="text" name="price1" onKeyUp='NumFormat(this)' value="${product.price1}"></td>
		<th>판매가</th>
		<td><input type="text" name="price2" onBlur="updateMargin()" onKeyUp='NumFormat(this)' value="${product.price2}"></td>
		<th>마진</th>
		<td><input type="text" name="price3" onKeyUp='NumFormat(this)' value="${product.price3}"></td>
	</tr>
	<tr>
		<th>설명</th>
		<td colspan="5"><textarea name="content" cols="80" rows="10" style="resize:none">${product.content}</textarea></td>
	</tr>
	<tr>
		<th>사진</th>
		<td colspan="5"><input type="file" name="images">
			<input type="hidden" name="image" value="${product.image}">
		</td>
	</tr>
</table>
<input type="reset" value="취소" onclick="javascript:history.go(-1)">
<input type="submit" value="등록" onclick="return go_update()">
</div>
</form>


<%@ include file="../../footer.jsp" %>