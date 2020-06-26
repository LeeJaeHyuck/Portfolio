<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">

<%@page import="java.text.SimpleDateFormat"%>

<%@ page import="com.port.biz.vo.BookVO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.stream.*" %>

<%@ page import="javax.servlet.http.HttpServletRequest" %>

<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Calendar cal = Calendar.getInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);

	if (strYear != null) {

		year = Integer.parseInt(strYear);

		month = Integer.parseInt(strMonth);

	} else {

	}

	//년도/월 셋팅

	cal.set(year, month, 1);

	int startday = cal.getMinimum(java.util.Calendar.DATE);

	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);

	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);

	int newLine = 0;

	//오늘 날짜 저장.

	Calendar todayCal = Calendar.getInstance();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");

	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>

<html lang="ko">

<head>

<title>캘린더</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javaScript" language="javascript"> 
function datecheck(date){
	 date = String(date);
	var year = date.substring(0,4);
	var month = date.substring(4,6);
	var day = date.substring(6,8);
	if(confirm(year + "년 " + month + "월 " + day + "일" + " 날짜가 맞으십니까?") == true){
	opener.document.form.format.value=year + "년 " + month + "월 " + day + "일";
	opener.document.form.date.value=date;
	self.close();
	return true;
	} else {
	return false;
}
}
       
       </script>
<style TYPE="text/css">
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}
</style>

</head>

<body>

	<form name="calendarFrm" id="calendarFrm" action="" method="post">
		<div id="content" style="width: 712px;">
		<input type="hidden" value="${roomNum}" name="roomNum">
			<table width="100%" border="0" cellspacing="1" cellpadding="1">
				<tr>
					<td align="right"><input type="button"
						onclick="location='calendar?roomNum=${roomNum}'"
						value="오늘" /></td>
				</tr>
			</table>

			<!--날짜 네비게이션  -->

			<table width="100%" border="0" cellspacing="1" cellpadding="1"
				id="KOO" bgcolor="#F3F9D7" style="border: 1px solid #CED99C">
				<tr>
					<td height="60">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td align="center">
								<a href="calendar?year=<%=year - 1%>&month=<%=month%>&roomNum=${roomNum}" target="_self"> 
								<b>&lt;&lt;</b> <!-- 이전해 --> </a> 
									
									
									
								<% if (month > 0) {  %> 	
 								<a href="calendar?year=<%=year%>&amp;month=<%=month - 1%>&roomNum=${roomNum}" target="_self"> 
 								<b>&lt;</b> <!-- 이전달 --> </a> 
									<% } else { %> <b>&lt;</b> <% } %> &nbsp;&nbsp; 
									<%=year%>년 <%=month + 1%>월 &nbsp;&nbsp;
									<% if (month < 11) { %> 
									<a href="calendar?year=<%=year%>&amp;month=<%=month + 1%>&roomNum=${roomNum}" target="_self">
									 <!-- 다음달 --> <b>&gt;</b> </a> 
									 <% } else {  %> <b>&gt;</b> <% }  %> 
									 <a href="calendar?year=<%=year + 1%>&amp;month=<%=month%>&roomNum=${roomNum}" target="_self"> 
									 <!-- 다음해 --> <b>&gt;&gt;</b>
								</a></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br>
			<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
				<thead>
					<tr bgcolor="#CECECE">
						<td width='100px'>
							<div align="center">
								<font color="red">일</font>
							</div>
						</td>
						<td width='100px'>
							<div align="center">월</div>
						</td>
						<td width='100px'>
							<div align="center">화</div>
						</td>
						<td width='100px'>
							<div align="center">수</div>
						</td>
						<td width='100px'>
							<div align="center">목</div>
						</td>
						<td width='100px'>
							<div align="center">금</div>
						</td>
						<td width='100px'>
							<div align="center">
								<font color="BLUE">토</font>
							</div>
						</td>
					</tr>
				</thead>

				<tbody>
					<tr>

						<%
							//처음 빈공란 표시

							for (int index = 1; index < start; index++) {

								out.println("<td>&nbsp;</td>");

								newLine++;

							}
							for (int index = 1; index <= endDay; index++) {

								String color = "";

								if (newLine == 0) {
									color = "RED";

								} else if (newLine == 6) {
									color = "BLUE";

								} else {
									color = "BLACK";
								}

								String sUseDate = Integer.toString(year);

								sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
										: Integer.toString(month + 1);

								sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
										: Integer.toString(index);

								int iUseDate = Integer.parseInt(sUseDate);

								String backColor = "#EFEFEF";
								
								
								ArrayList<BookVO> bookList = (ArrayList) request.getAttribute("bookList");
								int bookdate[] = new int[endDay+2];
								int cnt = 0;
								
								for (BookVO book : bookList){
									bookdate[cnt] = Integer.parseInt(sdf.format(book.getReserveDate()));
									
									if (iUseDate == bookdate[cnt]) {

										backColor = "#c9c9c9";

									}
									cnt++;
								}
								
								if (iUseDate < intToday) {

									backColor = "#c9c9c9";

								}


								out.println("<td valign='top' align='left' height='92px' bgcolor='" + backColor + "' nowrap>");
								out.println("<font color=" + color + ">" + index + "</font>");
								out.println("<br><br><br>");
								
								if(IntStream.of(bookdate).anyMatch(x -> x == iUseDate)){
									if (intToday > iUseDate){
										out.println("<label style='color:red'>예약종료</label>");
									} else {
									out.println("<label style='color:red'>예약중</label>");
									}
								} else {
									if (iUseDate < intToday){
										out.println("예약불가");
								} else {
									%><a href="#" onclick="return datecheck(<%=iUseDate%>)">예약가능</a><%
								}
								}

								//기능 제거 

								out.println("</td>");

								newLine++;

								if (newLine == 7) {
									out.println("</tr>");
									if (index <= endDay) {
										out.println("<tr>");
									}
									newLine = 0;
								}
							}

							//마지막 공란 LOOP
							while (newLine > 0 && newLine < 7) {
								out.println("<td>&nbsp;</td>");
								newLine++;
							}
							
						%>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>

</HTML>