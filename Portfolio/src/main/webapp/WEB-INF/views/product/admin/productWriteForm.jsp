<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<h1>상품등록</h1>
<hr>
<form action="insert_product" method="post" enctype="multipart/form-data" name="write">
<div align="center" style="width: 90%">
<table id="pwrite">
	<tr>
		<th>구분</th>
		<td colspan="5">
		<select name="kind">
			<option value="0">구분선택</option>
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
		<td colspan="5"><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>원가</th>
		<td><input type="text" name="price1" onKeyUp='NumFormat(this)'></td>
		<th>판매가</th>
		<td><input type="text" name="price2" onBlur="writeMargin()" onKeyUp='NumFormat(this)'></td>
		<th>마진</th>
		<td><input type="text" name="price3" onKeyUp='NumFormat(this)' readonly></td>
	</tr>
	<tr>
		<th>설명</th>
		<td colspan="5"><textarea name="content" cols="80" rows="10" style="resize: none;"></textarea></td>
	</tr>
	<tr>
		<th>사진</th>
		<td colspan="5"><input type="file" name="images"></td>
	</tr>
</table>
<input type="reset" value="취소" onclick="javascript:history.go(-1)">
<input type="submit" value="등록" onclick="return goInsert()">
</div>
</form>


<%@ include file="../../footer.jsp" %>