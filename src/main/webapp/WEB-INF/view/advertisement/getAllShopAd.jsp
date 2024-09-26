<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/adminNavbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有商城活動</title>
<style>
/* img { */
/* 	width: 50px; */
/* } */

/* table { */
/* 	border-collapse: collapse; */
/* 	border: 1px solid black; */
/* } */

/* th { */
/* 	border-collapse: collapse; */
/* 	border: 1px solid orange; */
/* 	text-align: center; */
/* } */

/* td { */
/* 	border-collapse: collapse; */
/* 	border: 1px solid orange; */
/* 	text-align: center; */
.table {
	width: 65%;
	margin: 20px auto;
}

tr {
	text-align: center;
}

th {
	padding: 10px;
}

table tbody tr:nth-child(odd) {
	background-color: #eee
}

table thead {
	background-color: blue;
	color: white;
}

table thead th:first-child {
	border-radius: 5px 0 0 0;
	border: 1px solid blue;
}

table thead th:last-child {
	border-radius: 0 5px 0 0;
	border-right: 1px solid blue;
}

table tbody tr:last-child td:first-child {
	border-radius: 0 0 0 5px;
}

table tbody tr:last-child td:last-child {
	border-radius: 0 0 5px 0;
}
</style>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
</head>
<body>
	<div align="center">
		<br>
		<h2>商城活動資料</h2>


		<p>
			<a href="${contextRoot}/shopad/insert">
				<button type="button" class="btn btn-outline-success">新增活動</button>
			</a><br>
			<form:form action="${contextRoot}/shopad/upload" method="get"
				class="search">
				<div class="div1">
					<label for="id" class="id">單筆活動查詢 : </label> <input type="text"
						id="myInput" name="id" autocomplete="off"
						class="light-table-filter" data-table="order-table"
						placeholder="請輸入關鍵字" />
				</div>
			</form:form>
		<div>
			<table class="table">

				<thead class="thead-dark">
					<tr>
						<th scope="col">活動編號
						<th scope="col">活動名稱
						<th scope="col">活動圖片
						<th scope="col">開始時間
						<th scope="col">結束時間
						<th scope="col">商品編號
						<th scope="col">上架狀態
						<th scope="col">修改
						<th scope="col">刪除
					</tr>
				</thead>

				<c:forEach items="${ad}" var="ad" varStatus="s">
					<tbody id="myBody">
						<tr id="${ad.shopAdId}">
							<th scope="row">${ad.shopAdId}
							<td><a
								href="${contextRoot}/shopad/queryById?id=${ad.shopAdId}">${ad.shopAdName}</a>
							<td><img src="data:image/*;base64, ${ad.picture}"
								alt="image" width="150px" />
							<td>${ad.beginDate}
							<td>${ad.endDate}
							<td>${ad.productId}
							<td>${ad.onboard}
							<td><a href="${contextRoot}/shopad/update?id=${ad.shopAdId}">
									<button type="button" class="btn btn-outline-info">修改</button>
							</a>
							<td><a onclick="return confirm('確定刪除?')"
								href="${contextRoot}/shopad/delete?id=${ad.shopAdId}">
									<button type="button" class="btn btn-outline-danger">刪除</button>
							</a>
						</tr>
					</tbody>
				</c:forEach>


			</table>
		</div>

<!-- 		<div class="row justify-content-center"> -->
<!-- 			<div class="col-9"> -->
<%-- 				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${page.number != pageNumber-1}"> --%>
<%-- 							<a href="${contextRoot}/shopad/getAll?p=${pageNumber}"><c:out --%>
<%-- 									value="${pageNumber}" /></a> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<c:out value="${pageNumber}"></c:out> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 					<c:if test="${pageNumber != page.totalPages}"> --%>

<%-- 					</c:if> --%>
<%-- 				</c:forEach> --%>

<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	<script type="text/javascript">
		// 		(function(document) {
		// 			'use strict';

		// 			// 建立 LightTableFilter
		// 			var LightTableFilter = (function(Arr) {

		// 				var _input;

		// 				// 資料輸入事件處理函數
		// 				function _onInputEvent(e) {
		// 					_input = e.target;
		// 					var tables = document.getElementsByClassName(_input
		// 							.getAttribute('data-table'));
		// 					Arr.forEach.call(tables, function(table) {
		// 						Arr.forEach.call(table.tBodies, function(tbody) {
		// 							Arr.forEach.call(tbody.rows, _filter);
		// 						});
		// 					});
		// 				}

		// 				// 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
		// 				function _filter(row) {
		// 					var text = row.textContent.toLowerCase(), val = _input.value
		// 							.toLowerCase();
		// 					row.style.display = text.indexOf(val) === -1 ? 'none'
		// 							: 'table-row';
		// 				}

		// 				return {
		// 					// 初始化函數
		// 					init : function() {
		// 						var inputs = document
		// 								.getElementsByClassName('light-table-filter');
		// 						Arr.forEach.call(inputs, function(input) {
		// 							input.oninput = _onInputEvent;
		// 						});
		// 					}
		// 				};
		// 			})(Array.prototype);

		// 			// 網頁載入完成後，啟動 LightTableFilter
		// 			document.addEventListener('readystatechange', function() {
		// 				if (document.readyState === 'complete') {
		// 					LightTableFilter.init();
		// 				}
		// 			});

		// 		})(document);

		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												// 抓 搜尋的關鍵詞
												var value = $(this).val()
														.toLowerCase();
												// 抓Table裡頭有沒有符合
												$("#myBody tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});

		//         $("#myInput").on("keyup", function() {

		//                         // 抓使用者輸入的值
		//                         var value = $(this).val().toLowerCase();

		//                         // ///////////// Highlight 功能/////////////////////

		//                         // 找到一樣的值，然後highlight 
		//                         // .text() 找所有指定的文字，.indexOf() 文字位置, RegExp() 檢查一致，replace() 變色
		//                         $("#myBody").find('td').each(function() {

		//                             // 找所有指定的文字
		//                             var text = $(this).text();
		//                             // 文字位置
		//                             var postition = text.indexOf(value);

		//                             // 檢查一致
		//                             var check = new RegExp(value, "ig");

		//                             // 變色
		//                             text = text.replace(check, (match, $1) => {

		//                                 return "<mark style='background-color:yellow;color:blue;font-size:40px'>" + match + "</mark>"
		//                             });

		//                             // 顯示在網頁上
		//                             $(this).html(text);

		//                         });

		//                         //////////////// 過濾 filter功能 EP02 //////////////////

		//                         // 抓Table裡頭有沒有符合 
		//                         $("#myBody tr").filter(function() {
		//                             $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		//                         });

		//                     })
	</script>
</body>
</html>