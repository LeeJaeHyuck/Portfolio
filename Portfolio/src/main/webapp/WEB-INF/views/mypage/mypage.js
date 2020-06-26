function hover() {
	var elem = document.getElementById("v-pills-home-tab");
	elem.classList.add('active');
}

function deleteCart() {

	if (confirm("정말 삭제하시겠습니까??") == true) {
		document.cart.action = "delete_cart";
		document.cart.submit();
		return true;
	} else {
		return false;

	}

}
function alldeleteCart() {
	if (confirm("정말 삭제하시겠습니까??") == true) {
		document.cart.action = "all_delete_cart";
		document.cart.submit();
		return true;
	} else {
		return false;

	}
}

function go_pay_form() {
	document.cart.action = "pay_form";
	document.cart.submit();
}

function change_address() {
	var url = "change_addr";
	window
			.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=550, height=500");
}

function member_update() {
	var check = prompt("비밀번호를 입력해주세요.");

	if (document.sign.pwd.value != document.sign.pwdCheck.value) {
		alert("비밀번호가 다릅니다.");
		document.sign.pwdCheck.focus();
		return false;
	} else if (document.sign.name.value == "") {
		alert("이름을 입력해주세요.");
		document.sign.name.focus();
		return false;
	} else if (document.sign.regNum1.value == ""
			|| document.sign.regNum2.value == "") {
		alert("주민번호를 입력해주세요.");
		document.sign.regNum1.focus();
		return false;
	} else if (document.sign.email.value == "") {
		alert("이메일을 입력해주세요.");
		document.sign.email.focus();
		return false;
	} else if (document.sign.postNum.value == "") {
		alert("우편번호를 입력해주세요.");
		document.sign.postNum.focus();
		return false;
	} else if (document.sign.addr1.value == ""
			|| document.sign.addr2.value == "") {
		alert("주소 입력해주세요.");
		document.sign.addr1.focus();
		return false;
	} else if (document.sign.phone.value == "") {
		alert("전화번호를 입력해주세요.");
		document.sign.phone.focus();
		return false;
	} else {
		if (check == document.sign.pass.value) {
			alert("수정 되었습니다.");
			return true;
		} else {
			alert("취소 되었습니다.");
			return false;
		}
	}
}

function payCheck() {

	if (document.order.addr1.value == "") {
		alert("주소를 입력해주세요.");
		return false;
	} else if (document.order.addr2.value == "") {
		alert("상세주소를 입력해주세요.");
	} else if (document.order.pay.value == "") {
		alert("결제 방법을 선택해주세요.");
		return false;
	} else {
		if (confirm("구매하시겠습니까?") == true) {
			return true;
		} else {
			return false;
		}
	}
}

function order_del() {
	var count = 0;
	if (document.order.result.length == undefined) {
		if (document.order.result.checked == true) {
			count++;
		}
	} else {
		for (var i = 0; i < document.order.result.length; i++) {
			if (document.order.result[i].checked == true) {
				count++;
			}
		}
	}
	if (count == 0) {
		alert("주문취소할 항목을 선택해 주세요.");
		return false;
	} else {
		if (confirm("주문취소 처리 하시겠습니까?") == true) {
			document.order.action = "order_del";
			document.order.submit();
			return true;
		} else {
			return false;
		}
	}
}

function admin_order_save() {
	var count = 0;
	if (document.order.result.length == undefined) {
		if (document.order.result.checked == true) {
			count++;
		}
	} else {
		for (var i = 0; i < document.order.result.length; i++) {
			if (document.order.result[i].checked == true) {
				count++;
			}
		}
	}
	
	if (count == 0) {
		alert("주문처리할 항목을 선택해 주세요.");
	} else {
		if (confirm("주문처리 하시겠습니까?") == true) {
			document.order.action = "admin_order_save";
			document.order.submit();
			return true;
		} else {
			return false;
		}
	}
}

function admin_order_del() {
	var count = 0;
	if (document.order.result.length == undefined) {
		if (document.order.result.checked == true) {
			count++;
		}
	} else {
		for (var i = 0; i < document.order.result.length; i++) {
			if (document.order.result[i].checked == true) {
				count++;
			}
		}
	}
	if (count == 0) {
		alert("주문취소할 항목을 선택해 주세요.");
	} else {
		if (confirm("주문취소 처리 하시겠습니까?") == true) {
			document.order.action = "admin_order_del";
			document.order.submit();
			return true;
		} else {
			return false;
		}
	}
}

function check_all() {
	var all = document.order.checkAll;
	var result = document.order.result;
	if (all.checked) {
		if (result.length == null) {
			result.checked = true;
		} else {
			for (var i = 0; i < result.length; i++) {
				result[i].checked = true;
			}
		}
	} else {
		if (result.length == null) {
			result.checked = false;
		} else {
			for (var i = 0; i < result.length; i++) {
				result[i].checked = false;
			}
		}
	}

}

function result_check() {
	var all = document.order.checkAll;
	var result = document.order.result;
	if (result.length == null) {
		if (result.checked == false) {
			all.checked = false;
		}
	} else {
		for (var i = 0; i < result.length; i++) {
			if (result[i].checked == false) {
				all.checked = false;
			}
		}
	}
}

function admin_reserve_save() {
	var count = 0;
	if (document.book.result.length == undefined) {
		if (document.book.result.checked == true) {
			count++;
		}
	} else {
		for (var i = 0; i < document.book.result.length; i++) {
			if (document.book.result[i].checked == true) {
				count++;
			}
		}
	}
	if (count == 0) {
		alert("예약처리할 항목을 선택해 주세요.");
	} else {
		if (confirm("예약처리 하시겠습니까?") == true) {
			document.book.action = "admin_book_save";
			document.book.submit();
		}
	}
}

function admin_reserve_del() {
	var count = 0;
	if (document.book.result.length == undefined) {
		if (document.book.result.checked == true) {
			count++;
		}
	} else {
		for (var i = 0; i < document.book.result.length; i++) {
			if (document.book.result[i].checked == true) {
				count++;
			}
		}
	}
	if (count == 0) {
		alert("예약취소할 항목을 선택해 주세요.");
	} else {
		if (confirm("예약취소 하시겠습니까?") == true) {
			document.book.action = "admin_book_del";
			document.book.submit();
			return true;
		} else {
			return false;
		}
	}
}

function reserve_check_all() {
	var all = document.book.checkAll;
	var result = document.book.result;
	if (all.checked) {
		if (result.length == null) {
			result.checked = true;
		} else {
			for (var i = 0; i < result.length; i++) {
				result[i].checked = true;
			}
		}
	} else {
		if (result.length == null) {
			result.checked = false;
		} else {
			for (var i = 0; i < result.length; i++) {
				result[i].checked = false;
			}
		}
	}

}

function reserve_result_check() {
	var all = document.book.checkAll;
	var result = document.book.result;
	if (result.length == null) {
		if (result.checked == false) {
			all.checked = false;
		}
	} else {
		for (var i = 0; i < result.length; i++) {
			if (result[i].checked == false) {
				all.checked = false;
			}
		}
	}
}

function reserve_del() {
	var count = 0;
	if (document.book.result.length == undefined) {
		if (document.book.result.checked == true) {
			count++;
		}
	} else {
		for (var i = 0; i < document.book.result.length; i++) {
			if (document.book.result[i].checked == true) {
				count++;
			}
		}
	}
	if (count == 0) {
		alert("예약취소할 항목을 선택해 주세요.");
		return false;
	} else {
		if (confirm("예약취소 하시겠습니까?") == true) {
			return true;
		} else {
			return false;
		}
	}
}

function deleteMember() {
	if (confirm("탈퇴하시겠습니까?") == true) {
		document.sign.action = "delete_member";
		document.sign.submit();
	} else {
		return false;
	}
}

function deleteCheck() {
	var pwd = prompt("비밀번호를 입력해주세요.");

	if (pwd == document.sign.pass.value) {
		if (confirm("정말 탈퇴 하시겠습니까?") == true) {
			alert("탈퇴되었습니다.");
			document.sign.action = "delete_member";
			document.sign.submit();
		} else {
			alert("취소되었습니다.");
		}
	} else {
		alert("비밀번호가 다릅니다.");
	}
}
