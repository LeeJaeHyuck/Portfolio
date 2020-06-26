<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
th, td{
	text-align: center;
}

</style>
<h1>Contact</h1>
<div align="right">
	<button type="button" class="btn btn-outline-primary" onclick="location='contact_write'">글쓰기</button>
</div>
<table class="table">
  <thead>
    <tr>
      <th scope="col" width="15%">글번호</th>
      <th scope="col" width="40%">제목</th>
      <th scope="col" width="15%">아이디</th>
      <th scope="col" width="15%">등록일</th>
      <th scope="col" width="15%">답변</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${contactList}" var="cont">
    	<tr>
    		<td style="text-align:center">${cont.cseq}</td>
    		<td><a href="contact_detail?cseq=${cont.cseq}">${cont.title}</a></td>
    		<td>${cont.id}</td>
    		<td><fmt:formatDate value="${cont.regdate}" pattern="yyyy-MM-dd" /></td>
    		<td>
    			<c:choose>
    				<c:when test="${cont.rep == 1}"><label id="redlabel">미답변</label></c:when>
    				<c:otherwise><label id="bluelabel">답변완료</label></c:otherwise>
    			</c:choose>
    		</td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<%@ include file="../footer.jsp"%>