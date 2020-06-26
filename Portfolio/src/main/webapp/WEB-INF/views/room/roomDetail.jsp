<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script>
</script>
<form name="form" action="reserve_room_form">
<input type="hidden" name="roomNum" value="${room.roomNum}">
<input type="hidden" name="date">
<div class="media">
  <img src="room_images/${room.image}" class="align-self-center mr-3" width="50%" height="400px;" alt="image" />
  <div class="media-body">
    <h3>${room.roomNum}호</h3>
			<table class="bordernone">
				<tr>
					<td>가격</td>
					<td><fmt:formatNumber value="${room.price}" />원/일</td>
				</tr>
				<tr>
					<td>수용인원</td>
					<td>최대 ${room.person}명</td>
				</tr>
				<tr>
					<td>예약가능 날짜</td>
					<td><input type="button" value="달력" onclick="opendate()"></td>
				</tr>
				<tr>
					<td>이용가능 시간</td>
					<td>10:00 ~ 23:00</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>서울특별시 관악구 신림동 159-753번지 지하1층</td>
				</tr>
			</table>
			<hr>
			<c:choose>
			<c:when test="${loginUser.authority == 2 }">
			<button type="button" class="btn btn-outline-secondary" style="width:49%;" onclick="location='update_room_form?roomNum=${room.roomNum}'">수정</button>
			<button type="button" class="btn btn-outline-secondary" style="width:49%;" onclick="return deleteRoom()">삭제</button>
			</c:when>
			<c:otherwise>
			<table class="bordernone">
				<tr>
				<th>예약날짜</th>
				<td style="width: 50%;"><output name="format"></output></td>
				</tr>
				<tr>
				<th>가격</th>
				<td><output name="totalPrice">${room.price}</output>원</td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-outline-secondary" style="width:100%" onclick="location='index'">쇼핑하러 가기</button></td>
					<td><input type="submit" class="btn btn-primary" style="width:100%" value="예약하기"></td>
				</tr>
			</table>
			</c:otherwise>
			</c:choose>
		</div>
</div>

</form>
<%@ include file="comment.jsp" %>
<%@ include file="../footer.jsp" %>