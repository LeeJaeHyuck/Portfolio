function update_reply() {
	if (document.cont.reply.value == "") {
		alert("답변 내용을 입력해주세요.");
		document.cont.reply.focus();
		return false;
	} else if (confirm("답변을 등록하시겠습니까?") == true) {
		document.cont.action = "update_reply";
		document.cont.submit();
	} else {
		return false;
	}
}

function delete_contact() {
	if (confirm("삭제하시겠습니까?") == true) {
		document.cont.action = "delete_contact";
		document.cont.submit();
		return true;
	} else {
		return false;
	}
}

function add_reply(reply) {
	var replyForm = "";
	if(reply == null){
		replyForm = '<textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name="reply" style="resize:none;" placeholder="답변"></textarea>';
	} else {
		replyForm = '<textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name="reply" style="resize:none;" placeholder="답변">'+reply+'</textarea>';
	}
	replyForm += '<div align="right">';
	replyForm += '<input type="submit" value="답변" onclick="return update_reply()"> ';
	replyForm += '<input type="button" value="삭제" onclick="return delete_contact()">';
	replyForm += '</div>';
	document.getElementById("reply").innerHTML = replyForm;
}

function contact_check(){
	if(document.cont.title.value == ""){
		alert("제목을 입력해주세요.");
		document.cont.title.focus();
		return false;
	} else if(document.cont.content.value == ""){
		alert("내용을 입력해주세요.");
		document.cont.content.focus();
		return false;
	}
}