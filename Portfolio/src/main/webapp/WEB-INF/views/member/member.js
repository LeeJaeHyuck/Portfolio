function loginCheck() {
	var form = document.log;

	if (form.id.value == "") {
		alert("아이디를 입력해주세요.");
		form.id.focus();
		return false;
	} else if (form.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		form.pwd.focus();
		return false;
	} else {
		return true;
	}
}

function idCheck() {

	if (document.sign.id.value == "") {
		alert("아이디를 입력해주세요.");
		form.id.focus();
		return;
	}

	// 중복된 아이디를 확인하는 윈도우를 띄운다.
	var url = "id_check_form?id=" + document.sign.id.value;

	window
			.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=500, height=200");
}

function join_member() {
	if (document.sign.id.value == "") {
		alert("아이디를 입력하세요.");
		document.sign.id.focus();
		return false;
	} else if (document.sign.reid.value != document.sign.id.value) {
		alert("아이디체크를 해주세요.");
		document.sign.id.focus();
		return false;
	} else if (document.sign.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.sign.pwd.focus();
		return false;
	} else if (document.sign.pwdCheck.value == "") {
		alert("비밀번호체크를 입력해주세요.");
		document.sign.pwdCheck.focus();
		return false;
	} else if (document.sign.pwd.value != document.sign.pwdCheck.value) {
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
		alert("회원가입이 완료되었습니다.");
		return true;
	}
}

function idok() {
	var form = document.check;
	form.action = "id_check_confirm";
	form.submit();
}

function find_addr() {
	var url = "find_addr";
	window.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=550, height=500");
}

function find_id() {
	var url = "find_id";
	window.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=500, height=350");
}

function find_pwd() {
	var url = "find_pwd";
	window.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=500, height=400");
}

function change_info(){
	if(confirm("수정하시겠습니까?") == true) return true;
	else return false;
}

function go_next() {
	if (document.formm.okon1[0].checked == true) {
		document.formm.action = "sign_up_form";
		document.formm.submit();
	} else if (document.formm.okon1[1].checked == true) {
		alert("약관의 동의를 해야합니다.");
	}
}


function onlyNumber(event){
    event = event || window.event;
    var length1 = document.sign.regNum1.value.length;
    var length2 = document.sign.regNum2.value.length;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9){
    	return true;
	}else{
        return false;
	}
}

function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}