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
	function confirm(postNum, sido, gugun, dong) {
		opener.document.sign.postNum.value=postNum;
		opener.document.sign.addr1.value=sido+" "+gugun+" "+dong;
		self.close();
		return;
	}
</script>
<title>주소찾기</title>
</head>
<body>
<div align="center">
<h3>주소 찾기</h3>
  <form class="form_inline" action="find_addr" method="post" name="sign">
    동 이름: <input class="form-control mr-sm_2" type="text" name="dong">
    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="검색"></input>
  </form>
  <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">우편번호</th>
      <th scope="col">주소</th>
    </tr>
  </thead>
 <c:forEach items="${addressList}" var="addr">
  <tbody>
    <tr>
      <td>${addr.postNum}</td>
      <td><a href='#' onclick="return confirm('${addr.postNum}', '${addr.sido}', '${addr.gugun}', '${addr.dong}')">
      ${addr.sido} ${addr.gugun} ${addr.dong} ${addr.bunji}</a></td>
    </tr>
  </tbody>
</c:forEach>
</table>
</div>
</body>
</html>