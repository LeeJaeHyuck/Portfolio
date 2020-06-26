<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<h1>작업실 등록</h1>
<hr>
<form action="insert_room" method="post" enctype="multipart/form-data" name="write">
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
		<select name="person">
			<option value="4">4인실</option>
			<option value="5">5인실</option>
			<option value="6">6인실</option>
		</select>
		</td>
    <td><input type="text" name="roomNum"><input type="button" value="중복확인" onclick="roomNum_check()">
    	<input type="hidden" name="reRoomNum"></td>
	<td><input type="text" name="price" onKeyUp='NumFormat(this)'></td>
		<td><input type="file" name="images"></td>
	</tr>
  </tbody>
</table>
<input type="reset" value="취소" onclick="javascript:history.go(-1)">
<input type="submit" value="등록" onclick="return goRoomInsert()">
</div>
</form>


<%@ include file="../../footer.jsp" %>