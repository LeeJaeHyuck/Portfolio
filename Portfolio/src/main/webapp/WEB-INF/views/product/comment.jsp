<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body>
    <form id="commentForm" name="commentForm" method="post">
        <div>
    <br><br>
            <div>
                <h3><span>상품평</span></h3>
            </div>
            <hr>
           <div class="input-group mb-3">
			  <textarea  class="form-control" placeholder="상품평을 입력하세요" id="content" name="content"></textarea>
			  <div class="input-group-append">
			    <button class="btn btn-success" type="button" id="button-addon2" onClick="save_comment('${product.pseq }')">&nbsp;&nbsp;등록&nbsp;&nbsp;</button>
			  </div>
			</div>
        </div>
        <input type="hidden" id="pseq" name="pseq" value="${product.pseq }" />   
    </form>
    <hr>
<div>
    <form id="commentListForm" name="commentListForm" method="post">
        <input type="hidden" id="userId" name="userid" value="${loginUser.id}">
        <input type="hidden" name="authority" value="${loginUser.authority }">
        <div id="commentList">
        </div>
    </form>
</div>


</body>
</html>

<script>
// 작성일 출력 함수
function displayTime(timeValue) {
	var today = new Date();
	
	// 24시간 이내인지 계산하기 위함
	var gap = today.getTime() - timeValue;
	
	var dateObj = new Date(timeValue);
	var str = "";
	
	// 24시간 이내일 경우 시,분,초만 표시
	if (gap < (1000 * 60 * 60 * 24)) {
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		
		return [ (hh>9 ? '' : '0') + hh, ':', (mi>9 ? '' : '0') + mi, ':',
				(ss>9 ? '' : '0') + ss].join('');
	} else {
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		
		return [ yy, '/', (mm>9 ? '':'0') + mm, '/',
				(dd>9 ? '':'0') + dd].join('');
	}
}

// 초기로딩시 상품평 목록 불러오기
$(function(){
	getCommentList();
});

// 상품평 등록
function save_comment(pseq){
	if(document.commentListForm.userid.value == ""){
		alert("로그인을 해주세요.");
	} else if(document.commentForm.content.value == ""){
		alert("내용을 입력해주세요.");
	} else {
	$.ajax({
		type: 'POST',
		url: 'save_product_comment',
		data: $("#commentForm").serialize(),  // form 내의 입력 데이터 전송
		success: function(data){
			if(data="success"){   // 상품평 등록 성공
				getCommentList(); // 상품평 목록 요청함수 호출
				$("#content").val("");
			} else {
				
			}
		},
			
		error: function(request, status, error){
			alert("error:" + error);
		}
	});
	}
}

// 상품평 목록 불러오기
function getCommentList(){
	$.ajax({
		type: 'GET',
		url: 'comment_product_list',
		dataType: "json",
		data: $("#commentForm").serialize(),
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data){
			var html="";
			var cCnt=data.length;
			console.log(data.length);
			if(cCnt > 0){
				for (i=0; i<data.length; i++){
					
					if(document.commentListForm.authority.value == 2){
						html += "<table id=\"cotable\"><tr>";
						html += "<th>" + data[i].writer + "</th>";
						html += "<td style=\"text-align:right\">" + displayTime(data[i].regDate) +"</td></tr>";
						html += "<tr><td>" + data[i].content + "</td>"
						html += "<td style=\"text-align:right\"><a href=\"delete_product_comment?coseq=" + data[i].coseq + "&pseq="+ data[i].pseq +"\">삭제</a></td></tr></table>";
						html += "<hr>";
					} else {
					if(document.commentListForm.userid.value == data[i].writer){
						html += "<table id=\"cotable\"><tr>";
						html += "<th>" + data[i].writer + "</th>";
						html += "<td style=\"text-align:right\">" + displayTime(data[i].regDate) +"</td></tr>";
						html += "<tr><td>" + data[i].content + "</td>"
						html += "<td style=\"text-align:right\"><a href=\"delete_product_comment?coseq=" + data[i].coseq + "&pseq="+ data[i].pseq +"\">삭제</a></td></tr></table>";
						html += "<hr>";
					} else {
						html += "<table id=\"cotable\"><tr>";
						html += "<th>" + data[i].writer + "</th>";
						html += "<td style=\"text-align:right\">" + displayTime(data[i].regDate) +"</td></tr>";
						html += "<tr><td>" + data[i].content + "</td>"
						html += "</tr></table>";
						html += "<hr>";
					}
				}
				}
			} else {
				html += "<div>";
				html += "<div><h6>등록된 상품평이 없습니다.</h6></div>";
				html == "</div>";
			}
			
			$("#cCnt").html(cCnt);  // 상품평의 갯수 출력
			$("#commentList").html(html);
		},
		error: function(request, status, error){
			alert("상품평 목록을 조회하지 못했습니다.");
		}
	});
}
</script>
