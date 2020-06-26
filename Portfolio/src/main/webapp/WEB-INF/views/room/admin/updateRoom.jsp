<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<script>
window.onload = function(){
	var val = document.update.originperson.value;
	document.update.person.value = val;
}
</script>
<h1>작업실 수정</h1>
<hr>
<form action="update_room" method="post" enctype="multipart/form-data" name="update">
<div align="center">
<table class="table" style="text-align: center;">
  <thead>
    <tr>
      <th scope="col">사용가능인원</th>
      <th scope="col">방번호</th>
      <th scope="col">가격</th>
      <th scope="col">사진</th>
    </tr>
  </thead>
  <tbody>
    <tr>
		<td>
		<input type="hidden" name="originperson" value="${room.person}">
		<select name="person">
			<option value="4">4인실</option>
			<option value="5">5인실</option>
			<option value="6">6인실</option>
		</select>
		</td>
    <td><input type="text" name="roomNum" value="${room.roomNum}" readonly>호</td>
	<td><input type="text" name="price" onKeyUp='NumFormat(this)' value="${room.price}"></td>
		<td><input type="file" name="images">
		<input type="hidden" name="image" value="${room.image}"></td>
	</tr>
  </tbody>
</table>
<input type="reset" value="취소" onclick="javascript:history.go(-1)">
<input type="submit" value="등록" onclick="return goUpdate()">
</div>
</form>


<%@ include file="../../footer.jsp" %>