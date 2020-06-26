function goRoomInsert() {
	var theForm = document.write;
	var a = theForm.price.value;

	if (theForm.roomNum.value == "") {
		alert("방번호를 입력해주세요.");
		theForm.roomNum.focus();
		return false;
	} else if(theForm.reRoomNum.value==""){
		alert("중복확인을 해주세요.");
		theForm.roomNum.focus();
		return false;
	} else if (theForm.price.value == "") {
		alert("가격을 입력해주세요.");
		theForm.price.focus();
		return false;
	} else if (theForm.person.value == "") {
		alert("사용가능인원을 입력해주세요.");
		theForm.person.focus();
		return false;
	} else if (theForm.images.value == "") {
		alert("이미지를 삽입해주세요.");
		return false;
	} else if (theForm.price.value != "") {
		var b = a.replace(/,/g, '');
		theForm.price.value = parseInt(b);
		return true;
	}

}

function goUpdate() {
	var theForm = document.update;
	var a = theForm.price.value;

	if (theForm.price.value == "") {
		alert("가격을 입력해주세요.");
		theForm.price.focus();
		return false;
	} else if (theForm.person.value == "") {
		alert("사용가능인원을 입력해주세요.");
		theForm.person.focus();
		return false;
	} else if (theForm.images.value == "" && theForm.image.value == "") {
		alert("이미지를 삽입해주세요.");
		return false;
	} else {
		a = a.replace(/,/g, '');
		theForm.price.value = parseInt(a);
		return true;
	}
}

function opendate() {
	var url = "calendar?roomNum=" + document.form.roomNum.value;

	window
			.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=800, height=730");
}

function roomNum_check() {
	if (document.write.roomNum.value == "") {
		alert("방번호를 입력해주세요.")
	} else {
		var url = "roomNum_check_form?roomNum=" + document.write.roomNum.value;

		window
				.open(url, "_blank_1",
						"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=500, height=200");
	}
}

function deleteRoom() {
	if (confirm("정말 삭제하시겠습니까?") == true) {
		document.form.action = "delete_room";
		document.form.submit();
		return true;
	} else {
		return false;
	}
}

function reserveCheck() {
	if (document.form.format.value == "") {
		alert("날짜를 선택해주세요.");
		return false;
	} else if (document.form.pay.value == "") {
		alert("결제방법을 선택해주세요.");
		return false;
	}
}