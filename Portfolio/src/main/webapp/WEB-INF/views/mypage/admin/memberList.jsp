<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>


  <form class="form-inline" action="member_list">
  <div style="width: 97%">
  	<h3 style="float:left;" >회원 목록</h3>
  	<div style="float: right;">
  	<select name="key">
  		<option value="1">아이디</option>
  		<option value="2">이름</option>
  	</select>
    <input class="form-control1" type="search" placeholder="Search" aria-label="Search" name="search">
    <button type="submit" class="btn btn-outline-success">검색</button>
    </div>
  </div>
  </form>
<table class="table" style="text-align:center">
  <thead>
    <tr>
      <th scope="col">아이디</th>
      <th scope="col">이름</th>
      <th scope="col">이메일</th>
      <th scope="col">전화번호</th>
      <th scope="col">가입일</th>
      <th scope="col">상태</th>
      <th scope="col">권한</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="member" items="${memberList}">
    	<tr>
    		<td><a href="member_detail?id=${member.id}">${member.id}</a></td>
    		<td>${member.name}</td>
    		<td>${member.email}</td>
    		<td>${member.phone}</td>
    		<td><fmt:formatDate value="${member.regdate}" pattern="yyyy-MM-dd" /></td>
    		<td>
    			<c:if test="${member.useyn == 'y'}"><label>사용중</label></c:if>
    			<c:if test="${member.useyn == 'n'}"><label style="color:red">탈퇴</label></c:if>
    		</td>
    		<td>
    			<c:if test="${member.authority == 1}"><label>사용자</label></c:if>
    			<c:if test="${member.authority == 2}"><label style="color:red">관리자</label></c:if>
    		</td>
    	</tr>
    </c:forEach>
  </tbody>
</table>

  <ul class="pagination justify-content-center">
    	<li class="page-item">
			<a class="page-link" href="member_list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&search=${search}&key=${key}">&lt;&lt;</a>
    	</li>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<li class="page-item active" aria-current="page">
     					 <a class="page-link" href="#">${p}</a>
   					 </li>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<li class="page-item"><a class="page-link" href="member_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&search=${search}&key=${key}">${p}</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
    	<li class="page-item">
			<a class="page-link" href="member_list?nowPage=${paging.nowPage+1 }&cntPerPage=${paging.cntPerPage}&search=${search}&key=${key}">&gt;&gt;</a>
    	</li>
  </ul>

<%@ include file="../../footer.jsp"%>