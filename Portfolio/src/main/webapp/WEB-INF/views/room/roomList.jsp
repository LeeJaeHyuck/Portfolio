<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<h1>작업실 목록</h1>
 <div id="roomList">
 
        <c:forEach items="${roomList}"  var="room">
          <div id="item">
           <a href="room_detail?roomNum=${room.roomNum}" id="detail">
             <img src="room_images/${room.image}" />
           <h4> ${room.roomNum}</h4>    
           <p>${room.person}인실<br><fmt:formatNumber value="${room.price}" />원/일</p>
        </a>  
      </div>
    </c:forEach>      
  </div>
  
  <c:if test="${loginUser.authority == 2}">
  <div align="right" style="width:97%;">
  	<input type="button" value="작업실추가" onclick="location='insert_room_form'">
  </div>
  
  </c:if>
	<ul class="pagination justify-content-center">
    	<li class="page-item">
			<a class="page-link" href="room_list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&person=${person}">&lt;&lt;</a>
    	</li>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<li class="page-item active" aria-current="page">
     					 <a class="page-link" href="#">${p}</a>
   					 </li>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<li class="page-item"><a class="page-link" href="room_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&person=${person}">${p}</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
    	<li class="page-item">
			<a class="page-link" href="room_list?nowPage=${paging.nowPage+1 }&cntPerPage=${paging.cntPerPage}&person=${person}">&gt;&gt;</a>
    	</li>
  </ul>
<%@ include file="../footer.jsp" %>
