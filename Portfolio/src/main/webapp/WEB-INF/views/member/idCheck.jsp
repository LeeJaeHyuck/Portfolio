<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<style>
body {
	background-color: #eeeeee;
}

.form_inline {
	display: inline-block;
	-ms-flex-flow: row wrap;
	flex-flow: row wrap;
	-ms-flex-align: center;
	align-items: center;
}

.mr-sm_2 {
	display: inline-block;
	width: 60%;
	margin-right: !important
}
</style>
<script type="text/javascript">
	function confirm() {
		opener.document.sign.id.value = "${id}";
		opener.document.sign.reid.value = "${id}";
		self.close();
		return;
	}
</script>
<title>아이디 중복 확인</title>
</head>
<body>
<div align="center">
<h3>아이디 중복 확인</h3>
  <form class="form_inline" action="id_check_form" method="post" name="sign">
    <input class="form-control mr-sm_2" type="text" value="${id}" name="id">
    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="검색"></input>
    <br>
    <c:if test="${result == 1}">
      ${id} 은(는) 이미 사용중인 아이디입니다.
    </c:if>
    <c:if test="${result == -1}">
    	${id} 은(는) 사용 가능한 아이디입니다.
        <input type="button" class="btn btn-outline-primary" onclick="return confirm()" value="사용"></input>
    </c:if>
  </form>
</div>
</body>
</html>