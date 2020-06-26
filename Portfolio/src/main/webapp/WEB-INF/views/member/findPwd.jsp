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

div {
	width: 100%;
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
	width: 95%;
	margin-right: !important
}
</style>
<script type="text/javascript">
	function check() {
		if (document.find.id.value == "") {
			alert("아이디를 입력해주세요.");
			return false;
		} else if (document.find.name.value == "") {
			alert("이름을 입력해주세요.");
			return false;
		} else if (document.find.email.value == "") {
			alert("이메일을 입력해주세요.");
			return false;
		}
	}

	function confirm() {
		opener.document.log.pwd.value = "${pwd}";
		self.close();
		return;
	}
</script>

<title>비밀번호 찾기</title>
</head>
<body>
<div align="center">
<h3>비밀번호 찾기</h3>
  <form class="form_inline" action="find_pwd" method="post" name="find">
  아이디: <input class="form-control" type="text" name="id"><br>  
    이름: <input class="form-control" type="text" name="name"><br>
    이메일: <input class="form-control" type="text" name="email"><br>
    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" onclick="return check()" value="찾기"></input>
    <br>
    <c:if test="${result == 1}">
      	회원님의 비밀번호는 '${pwd}' 입니다.
      	<input type="button" class="btn btn-outline-primary" onclick="return confirm()" value="사용"></input>
    </c:if>
    <c:if test="${result == -1}">
    	등록되지 않은 아이디 또는 이름 또는 이메일 입니다.
    </c:if>
  </form>
</div>
</body>
</html>