<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>~~~~</title>

</head>
<body>
	<h1>hi</h1>
	<div>
		<table class="mytable" id="list_table_json">
			<thead>
				<tr>
					<th>前五大商品</th>
					<th>販賣數量</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="container my-4">
		<div>
			<canvas id="pieChart" style="display: block; height: 500px; width: 499.2px;"></canvas>
		</div>
	</div>


	<script>
		let rtnMapLabels = [];
		let rtnMapData = [];

		$.get("${contextRoot}/productCount", function(rtnMap) {
			console.log(rtnMap)
			for ( var key in rtnMap) {
				// 				  console.log("名稱:" + key);
				// 				  console.log("數字:" + rtnMap[key]);
				rtnMapLabels.push(key);
				rtnMapData.push(rtnMap[key]);
			}

			var ctxP = document.getElementById("pieChart").getContext('2d');

			var myPieChart = new Chart(ctxP, {
				type : 'pie',
				data : data,
				options : {
					responsive : true
				}
			});

		});

		const data = {
			labels : rtnMapLabels,
			datasets : [ {
				data : rtnMapData,
				backgroundColor : [ "#F7464A", "#46BFBD", "#FDB45C", "#00000" ],
			} ]
		};
	</script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$.ajax({
						url : '${contextRoot}/productCount',
						success : function(rtnMap) {
							var array = [];
							for ( var key in rtnMap) {
								array.push({
									name : key,
									value : rtnMap[key]
								});
							}
							var sorted = array.sort(function(a, b) {
								return (a.value < b.value) ? 1
										: ((b.value < a.value) ? -1 : 0)
							});
							console.log(sorted);
							sort_data = ''

							for (var key = 0; key < sorted.length; key++) {
								var obj = sorted[key]
								console.log(obj)
								sort_data += '<tr>'
								sort_data += '<td>' + obj.name + '<td>'
								sort_data += '<td>' + obj.value + '<td>'
								sort_data += '<tr>'

							}

							$('#list_table_json').append(sort_data)
						}
					})
				})
	</script>
</body>
</html>