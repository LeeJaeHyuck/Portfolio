<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="member/member.js"></script>
<script type="text/javascript" src="product/product.js"></script>
<script type="text/javascript" src="mypage/mypage.js"></script>
<script type="text/javascript" src="room/room.js"></script>
<script type="text/javascript" src="contact/contact.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link href="css/musicFarm.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<title>MusicFarM</title>
<div id="wrap">
	<nav class="navbar navbar-dark bg-dark">
		<!-- Image and text -->
		<nav class="navbar navbar-light">
			<a class="navbar-brand" href="index"> <img
				src="main_images/logom.png" width="200" height="50"
				class="d-inline-block align-top" alt="" loading="lazy">
			</a> <!-- <a class="navbar-brand" href="index">MusicFarM</a> -->
		</nav>
		<c:choose>
			<c:when test="${loginUser == null}">
				<nav>
					<button type="button" class="btn btn-outline-light"
						onclick="location='login'">LOGIN</button>
					<button type="button" class="btn btn-outline-light"
						onclick="location='contract'">SIGNUP</button>
				</nav>
			</c:when>
			<c:otherwise>
				<c:if test="${loginUser.authority == 1 }">
					<nav>
						${loginUser.name}님 반갑습니다.
						<button type="button" class="btn btn-primary"
							onclick="location='logout'">LOGOUT</button>
					</nav>
				</c:if>
				<c:if test="${loginUser.authority == 2 }">
					<nav>
						${loginUser.name} 관리자님 반갑습니다.
						<button type="button" class="btn btn-primary"
							onclick="location='logout'">LOGOUT</button>
					</nav>
				</c:if>
			</c:otherwise>
		</c:choose>

	</nav>
	<div
		style="position: relative; width: 100%; height: 300px; background-image: url('main_images/main.jpg'); background-size: 100% 300px; align: center;">
	</div>
	<div id="menudrop" align="center">
		<ul class="myMenu">
			<c:choose>
				<c:when test="${loginUser.authority == 2 }">
					<li class="menu1"><a class="nav-item nav-link" id="nav-link"
						href="admin_product_list">INSTRUMENT</a>
						<ul class="menu1_s submenu">
							<li><a class="nav-item nav-link" id="nav-link"
								href="admin_product_list?kind=1">피아노</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="admin_product_list?kind=2">기타</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="admin_product_list?kind=3">베이스</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="admin_product_list?kind=4">드럼</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="admin_product_list?kind=5">미디</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="admin_product_list?kind=6">악세사리</a></li>
						</ul></li>
				</c:when>
				<c:otherwise>
					<li class="menu1"><a class="nav-item nav-link" id="nav-link"
						href="product_list">INSTRUMENT</a>
						<ul class="menu1_s submenu">
							<li><a class="nav-item nav-link" id="nav-link"
								href="product_list?kind=1">피아노</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="product_list?kind=2">기타</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="product_list?kind=3">베이스</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="product_list?kind=4">드럼</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="product_list?kind=5">미디</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="product_list?kind=6">악세사리</a></li>
						</ul></li>
				</c:otherwise>
			</c:choose>
			<li class="menu1"><a class="nav-item nav-link" id="nav-link"
				href="room_list">STUDIO</a>
				<ul class="menu1_s submenu">
					<li><a class="nav-item nav-link" id="nav-link"
						href="room_list?person=4">4인실</a></li>
					<li><a class="nav-item nav-link" id="nav-link"
						href="room_list?person=5">5인실</a></li>
					<li><a class="nav-item nav-link" id="nav-link"
						href="room_list?person=6">6인실</a></li>
				</ul></li>


			<li class="menu1"><a class="nav-item nav-link" id="nav-link"
				href="mypage">MY PAGE</a> <c:choose>
					<c:when test="${loginUser.authority == 2 }">
						<ul class="menu1_s submenu">
							<li><a class="nav-item nav-link" id="nav-link"
								href="member_list">회원리스트</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="admin_order_list">주문리스트</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="admin_reserve_list">예약리스트</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="sales_graph_form">판매그래프</a></li>
						</ul>
					</c:when>

					<c:otherwise>
						<ul class="menu1_s submenu">
							<li><a class="nav-item nav-link" id="nav-link"
								href="cart_list">장바구니</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="order_list">주문내역</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="reserve_list">예약내역</a></li>
							<li><a class="nav-item nav-link" id="nav-link"
								href="my_contact_list">문의내역</a></li>
						</ul>
					</c:otherwise>
				</c:choose></li>

			<li class="menu1"><a class="nav-item nav-link" id="nav-link"
				href="contact_list">CONTACT</a></li>

		</ul>
	</div>
	<div class="clear"></div>
</html>