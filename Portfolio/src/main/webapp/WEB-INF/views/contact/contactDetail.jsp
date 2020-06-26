<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<br>
<form name="cont" action="contact_update_form" method="post">
	<input type="hidden" value="${contact.cseq}" name="cseq">
		<div class="bg-light mb-3" style="border: 1px solid rgba(0, 0, 0, 0.125); border-radius: 0.25rem;">
  			<div class="card-header"><font size="6">${contact.title }</font><hr>
  				<table style="width: 100%"><tr>
					<th>${contact.id}</th>
					<td style="text-align: right;"><fmt:formatDate value="${contact.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
					</tr></table>
 			</div>
  			<div class="card-body">
    		<pre class="card-text">${contact.content}</pre>
  			</div>
		</div><hr>
	
	<c:choose>
		<c:when test="${loginUser.authority == 2}">
			<c:if test="${contact.rep == 1}">
				<div align="right" id="reply">
					<input type="button" value="답변작성" onclick="add_reply()">
					<input type="button" value="삭제" onclick="return delete_contact()">
				</div>
			</c:if>
			<c:if test="${contact.rep == 2}">
				<div class="clear"></div>
				<div id="reply">
					<div class="card bg-light mb-3">
					<div class="card-header"><font size="6">답변</font></div>
  					<div class="card-body">
    				<p class="card-text">${contact.reply}</p>
  					</div>
  					</div>
					<!-- <textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name="reply" style="resize:none;">${contact.reply}</textarea> -->
					<div align="right"><input type="button" value="답변수정" onclick="add_reply('${contact.reply}')"></div>
				</div>
			</c:if>
		</c:when>
		<c:otherwise>
			<c:if test="${contact.rep == 1}">
				<div align="right">
					<input type="submit" value="수정"> 
					<input type="button" value="삭제" onclick="location='delete_contact?cseq=${contact.cseq}'">
				</div>
			</c:if>

			<c:if test="${contact.rep == 2}">
				<div class="clear"></div>
					<div class="bg-light mb-3" style="border: 1px solid rgba(0, 0, 0, 0.125); border-radius: 0.25rem;">
					<div class="card-header"><font size="6">답변</font></div>
  					<div class="card-body">
    				<p class="card-text">${contact.reply}</p>
  					</div>
  					</div>
			</c:if>
		</c:otherwise>
	</c:choose>



</form>
<br>
<%@ include file="../footer.jsp"%>