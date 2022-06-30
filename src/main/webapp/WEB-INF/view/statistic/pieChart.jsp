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
<script src="${contextRoot}/js/highcharts.src.js"></script>
<script src="${contextRoot}/js/exporting.src.js"></script>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>PieChart</title>

</head>
<body>
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
	<div>AAAAAAAAAAAAAAA</div>
	<div>
		<table class="mytable" id="list_table_json1">
			<thead>
				<tr>
					<th>前五大商品</th>
					<th>販賣數量</th>
				</tr>
			</thead>
		</table>
	</div>
	<div>
		<div>
			<div id="chart1"
				style="min-width: 450px; height: 550px; margin: 0 auto"></div>
		</div>
	</div>

	<script>
		var rtnMapLabels = [];
		var rtnMapData = [];
		var rtnMapResult = [];
		var download
		var myPieChart;
		$
				.get(
						"${contextRoot}/productCount",
						function(rtnMap) {
							console.log(rtnMap)
							console.log(rtnMapLabels)
							console.log(rtnMapData)
							var array = [];
							for ( var key in rtnMap) {
								array.push({
									name : key,
									value : rtnMap[key]
								});
							}
							var sorted1 = array.sort(function(a, b) {
								return (a.value < b.value) ? 1
										: ((b.value < a.value) ? -1 : 0)
							});
							console.log(sorted1)
							console.log(sorted1[0].value)

							for (var i = 0; i < sorted1.length; i++) {
								rtnMapResult.push([ sorted1[i].name,
										sorted1[i].value ])
							}
							console.log(rtnMapResult)

							Highcharts.setOptions({
								chart : {
									style : {
										fontFamily : 'Times New Roman'
									}
								}
							});
							$('#chart1')
									.highcharts(
											{
												chart : {
													type : 'pie'
												},
												colors : [ '#ED5565',
														'#5D9CEC', '#A0D468',
														'#FFCE54', '#48CFAD',
														'#AC92EC', '#AAB2BD',
														'#D770AD', '#c42525',
														'#a6c96a' ],
												title : {
													text : '銷售圓餅圖',
													style : {
														color : '#555'
													}
												},
												legend : {
													layout : 'horizontal',
													align : 'center',
													verticalAlign : 'bottom',
													borderWidth : 0,
													backgroundColor : '#FFFFFF'

												},
												tooltip : {
													shared : false,
													valueSuffix : '件'
												},
												credits : {
													enabled : false
												},
												plotOptions : {
													pie : {
														allowPointSelect : true,
														cursor : 'pointer',
														dataLabels : {
															enabled : true,
															format : '<b>{point.name}</b> {point.percentage:.1f} %',
															style : {
																color : (Highcharts.theme && Highcharts.theme.contrastTextColor)
																		|| 'black',
																width : '60px'
															}
														}
													},
													areaspline : {
														fillOpacity : 0.1
													},
													series : {
														groupPadding : .15
													}
												},
												series : [ {
													type : 'pie',
													data : rtnMapResult
												} ]

											});

						});

		const data = {
			labels : rtnMapLabels,
			datasets : rtnMapData
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
							
							sort_data = ''

							// 							for (var key = 0; key < sorted.length; key++) {
							// 								var obj = sorted[key]
							// 								console.log(obj)
							// 								sort_data += '<tr>'
							// 								sort_data += '<td>' + obj.name + '<td>'
							// 								sort_data += '<td>' + obj.value + '<td>'
							// 								sort_data += '<tr>'

							// 							}

							// 							$('#list_table_json').append(sort_data)

							sort_data0 = ''
							sort_data1 = ''
							var obj0 = sorted[0]
							sort_data0 += '<tr>'
							sort_data0 += '<td>' + obj0.name + '<td>'
							sort_data0 += '<td>' + obj0.value + '<td>'
							sort_data0 += '<tr>'
							$('#list_table_json').append(sort_data0)

							var obj1 = sorted[1]
							sort_data1 += '<tr>'
							sort_data1 += '<td>' + obj1.name + '<td>'
							sort_data1 += '<td>' + obj1.value + '<td>'
							sort_data1 += '<tr>'
							$('#list_table_json1').append(sort_data1)

						}
					})
				})
	</script>
</body>
</html>