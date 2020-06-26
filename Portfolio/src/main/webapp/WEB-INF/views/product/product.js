function addCart() {
	document.form.action = "add_cart";
	document.form.submit();
}

function change(cnt, price) {
	var x = document.form;
	var y = Number(x.quantity.value) + cnt;
	if (y < 1) {
		alert("최소 1개 이상은 주문 하셔야 합니다.");
		y = 1;
	}
	x.quantity.value = y;
	x.count.value = y;
	x.totalPrice.value = y * price;
}

function buy_check(){
	var x = document.form;
	
	if(x.quantity.value == ""){
		alert("수량을 입력해주세요.");
		return false;
	} else if(Number(x.quantity.value)<1){
		alert("최소 1개 이상은 주문 하셔야 합니다.");
		return false;
	}
}

function deleteProduct() {
	if (confirm("정말 삭제하시겠습니까?") == true) {
		document.form.action="delete_product";
		document.form.submit();
		return true;
	} else {
		return false;
	}
}

function NumFormat(t) // 원 단위, 찍어주기
{
	s = t.value;
	s = s.replace(/\D/g, '');
	l = s.length - 3;
	while (l > 0) {
		s = s.substr(0, l) + ',' + s.substr(l);
		l -= 3;
	}
	t.value = s;
	return t;
}

function writeMargin() // 판매가-원가=순매출을 replace해서 계산해 준다.
{
	var theForm = document.write;
	var a = theForm.price2.value.replace(/,/g, '');		// 판매가
	var b = theForm.price1.value.replace(/,/g, '');		// 원가
	var ab = parseInt(a) - parseInt(b);					// 순매출
	theForm.price3.value = ab;
}


function goInsert(){
	var theForm = document.write;
	var a = theForm.price1.value;
	var b = theForm.price2.value;
	
	if(theForm.kind.value == "0"){
		alert("구분을 선택해주세요.");
		theForm.kind.focus();
		return false;
	}else if(theForm.name.value == ""){
		alert("상품명을 입력해주세요.");
		theForm.name.focus();
		return false;
	} else if(theForm.price1.value == ""){
		alert("원가를 입력해주세요.");
		theForm.price1.focus();
		return false;
	} else if(theForm.price2.value == ""){
		alert("판매가를 입력해주세요.");
		theForm.price2.focus();
		return false;
	} else if(theForm.content.value == ""){
		alert("설명을 입력해주세요.");
		theForm.content.focus();
		return false;
	} else if(theForm.images.value == ""){
		alert("이미지를 삽입해주세요.");
		return false;
	} else if(theForm.price1.value != "" && theForm.price2.value != ""){
		a = a.replace(/,/g, '');
		b = b.replace(/,/g, '');
		if(parseInt(a) > parseInt(b)){
		alert("판매가보다 원가가 더 비쌉니다.");
		theForm.price2.focus();
		return false;
		} else {
			theForm.price1.value = parseInt(a);
			theForm.price2.value = parseInt(b);
			return true;
		}
	}
	
}


function updateMargin() // 판매가-원가=순매출을 replace해서 계산해 준다.
{
	var theForm = document.update;
	var a = theForm.price2.value.replace(/,/g, '');		// 판매가
	var b = theForm.price1.value.replace(/,/g, '');		// 원가
	var ab = parseInt(a) - parseInt(b);					// 순매출
	theForm.price3.value = ab;
}

function go_update(){
	var theForm = document.update;
	var a = theForm.price1.value;
	var b = theForm.price2.value;
	
	if(theForm.name.value == ""){
		alert("상품명을 입력해주세요.");
		theForm.name.focus();
		return false;
	} else if(theForm.price1.value == ""){
		alert("원가를 입력해주세요.");
		theForm.price1.focus();
		return false;
	} else if(theForm.price2.value == ""){
		alert("판매가를 입력해주세요.");
		theForm.price2.focus();
		return false;
	} else if(theForm.content.value == ""){
		alert("설명을 입력해주세요.");
		theForm.content.focus();
		return false;
	} else if(theForm.images.value == "" && theForm.image.value == ""){
		alert("이미지를 삽입해주세요.");
		return false;
	} else if(theForm.price1.value != "" && theForm.price2.value != ""){
		a = a.replace(/,/g, '');
		b = b.replace(/,/g, '');
		if(parseInt(a) > parseInt(b)){
		alert("판매가보다 원가가 더 비쌉니다.");
		theForm.price2.focus();
		return false;
		} else {
			theForm.price1.value = parseInt(a);
			theForm.price2.value = parseInt(b);
			return true;
		}
	}
}
