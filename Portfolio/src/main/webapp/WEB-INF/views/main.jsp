<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
  <div id="front">   
   <h2><a href="product_list" style="color:black;">New Item</a></h2>
    <div id="mainProduct">
      <c:forEach items="${newProduct}" var="productVO" begin="0" end="3" step="1">
        <div id="item">
          <a href="product_detail?pseq=${productVO.pseq}" id="detail">
            <img src="product_images/${productVO.image}" />
            <h4>${productVO.name}</h4>    
            <p><fmt:formatNumber value="${productVO.price2}" />원</p>
          </a>    
        </div>
      </c:forEach>      
    </div>
   <div class="clear"></div>
     
      <h2><a href="product_list" style="color:black;"> Best Item</a></h2>  
      <div id="mainProduct">         
        <c:forEach items="${bestProduct}" var="productVO" begin="0" end="3" step="1">
          <div id="item">
           <a href="product_detail?pseq=${productVO.pseq}" id="detail">
             <img src="product_images/${productVO.image}" />
           <h4> ${productVO.name} </h4>    
           <p><fmt:formatNumber value="${productVO.price2}" /> 원 </p>
        </a>  
      </div>
    </c:forEach>      
  </div>
   <div class="clear"></div>

   <h2><a href="room_list" style="color:black;"> Studio</a></h2> 
      <div id="mainRoomProduct">         
        <c:forEach items="${roomList}"  var="room" begin="0" end="3" step="1">
          <div id="item">
           <a href="room_detail?roomNum=${room.roomNum}" id="detail">
             <img src="room_images/${room.image}" />
           <h4> ${room.roomNum} </h4>    
           <p>${room.person}인실<br><fmt:formatNumber value="${room.price}" />원/일</p>
        </a>  
      </div>
    </c:forEach>      
  </div>
  <div class="clear"></div>
  </div>
<%@ include file="footer.jsp" %>
