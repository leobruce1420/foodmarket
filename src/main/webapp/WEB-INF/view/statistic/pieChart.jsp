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
	<div>
		<div>
			<div id="chart1"
				style="min-width: 450px; height: 550px; margin: 0 auto"></div>
		</div>
	</div>
	<button type="button" onclick="download()">Click Me!!</button>

	<script>
		var rtnMapLabels = [];
		var rtnMapData = [];
		var rtnMapQQQ = [];
		var download
		var myPieChart;
		$.get("${contextRoot}/productCount", function(rtnMap) {
			console.log(rtnMap)

			var array = [];
			for ( var key in rtnMap) {
				array.push({
					name : key,
					value : rtnMap[key]
				});
			}
			var sorted1 = array.sort(function(a, b) {
				return (a.value < b.value) ? 1 : ((b.value < a.value) ? -1 : 0)
			});
			console.log(sorted1)
			console.log(sorted1[0].value)
			
			for(var i = 0; i < sorted1.length; i++){
				rtnMapQQQ.push([sorted1[i].name, sorted1[i].value])
			}
				console.log(rtnMapQQQ)

			// 			var ctxP = document.getElementById("pieChart").getContext('2d');

// 			Highcharts.setOptions({
// 				chart : {
// 					style : {
// 						fontFamily: 'serif',
// // 						fontFamily : 'Times New Roman',
// 						fontSize : '20em',
// 						color : '#f00'
// 					}
// 				}
// 			});
			
			Highcharts.setOptions({
			    chart: {
			        style: {
			            fontFamily: 'Times New Roman'
			        }
			    }
			});
			$('#chart1').highcharts(
					{
						chart : {
							type : 'pie'
						},
						colors : [ '#ED5565', '#5D9CEC', '#A0D468', '#FFCE54',
								'#48CFAD', '#AC92EC', '#AAB2BD', '#D770AD',
								'#c42525', '#a6c96a' ],
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
// 						xAxis : {
// 							categories : [ '2006', '2007', '2008', '2009',
// 									'2010', '2011' ]
// 						},
// 						yAxis : {
// 							title : {
// 								text : ''
// 							}
// 						},
						tooltip : {
							shared : false,
							valueSuffix : '件'
						},
						credits : {
							enabled : false
						},
						plotOptions : {
							areaspline : {
								fillOpacity : 0.1
							},
							series : {
								groupPadding : .15
							}
						},
						series : [ {
							type : 'pie',
							data : rtnMapQQQ
						} ]

					});

			//]]> 

			// 			myPieChart = new Chart(ctxP, {
			// 				type : 'pie',
			// 				data : data,
			// 				options : {
			// 					responsive : true
			// 				}

			// 			});
			// 			var image = myPieChart.toBase64Image();
			// 			console.log(image);

			// 			download = function(){
			// 			var a = document.createElement('a');
			// 			a.href = myPieChart.toBase64Image();
			// 			a.download = 'my_file_name.png';
			// 			console.log("AAAA");
			// 			a.click();
			// 			}	

			// Trigger the download

		});


		
		const data = {
			labels : rtnMapLabels,
			datasets : rtnMapData
		};

		// 		const data = {
		// 			labels : rtnMapLabels,
		// 			datasets : [ {
		// 				data : rtnMapData,
		// 				backgroundColor : [ "#F7464A", "#46BFBD", "#FDB45C", "#00000" ],
		// 			} ]
		// 		};
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