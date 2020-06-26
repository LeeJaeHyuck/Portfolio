<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp" %>
<title>Sales Graph</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		type: 'GET',
		headers: { 
			Accept: "application/json; charset=utf-8",
			"Content-type": "application/json; charset=utf-8"
		},
		url: 'sales_graph',
		success: function(result) {
			google.charts.load('current', {'packages' : ['corechart']});
			google.charts.setOnLoadCallback(function() {
				drawChart(result);
			})
		},
		error: function() {
			alert("Chart drawing error!");
		}
	});
	
	function drawChart(result) {
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'pname');
		data.addColumn('number', 'quantity');
		var dataArray = [];
		$.each(result, function(i, obj) {
			dataArray.push([obj.pname, obj.quantity]);
		});
		
		data.addRows(dataArray);
		
		// 파이 차트 그리기
		var piechart_options = {
			title: '제품별 판매 실적',
			width: 400,
			height: 300
		};
		
		var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
		
		piechart.draw(data, piechart_options);
		
		// 바차트 그리기
		var barchart_options = {
			title: 'BarChart: 제품별 판매 실적',
			width: 400,
			height: 300,
			legend: 'none'
		};
		
		var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
	
		barchart.draw(data, barchart_options);
	}
});
</script>

		<div align="center">
		<h1>제품별 판매 실적</h1><hr>
			<table>
				<tr>
					<td><div id="piechart_div" style="border:1px solid #ccc"></div></td>
					<td><div id="barchart_div" style="border:1px solid #ccc"></div></td>
				</tr>
			</table>
		</div>




<%@ include file="../../footer.jsp" %>