<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有商城活動</title>
<style>
img {
	width: 50px;
}

table {
	border-collapse: collapse;
	border: 1px solid black;
}

th {
	border-collapse: collapse;
	border: 1px solid orange;
	text-align: center;
}

td {
	border-collapse: collapse;
	border: 1px solid orange;
	text-align: center;
}
</style>
</head>
<body>
	<div align="center">
		<br>
		<h2>商城活動資料</h2>
		<br>
		<form:form action="${contextRoot}/shopad/queryById" method="get">
			<div class="div1">
				<label for="id" class="id">單筆活動查詢 : </label> <input type="text"
					id="id" name="id" autocomplete="off" class="light-table-filter"
					data-table="order-table" placeholder="請輸入關鍵字" />
			</div>
			<br>
		</form:form>
		<table class="order-table">
			<thead><tr style="background-color: #D68B00">
				<th>活動編號
				<th>活動名稱
				<th>活動圖片
				<th>開始時間
				<th>結束時間
				<th>備註
				<th>商品編號
				<th>修改
				<th>刪除 </tr></thead><c:forEach items="${ad}" var="ad" varStatus="s">
						<tbody><tr id="${ad.shopAdId}">
							<td>${ad.shopAdId}
							<td><a
								href="${contextRoot}/shopad/queryById?id=${ad.shopAdId}">${ad.shopAdName}</a>
							<td><img src="data:image/*;base64, ${ad.picture}"
								alt="image" />
							<td>${ad.beginDate}
							<td>${ad.endDate}
							<td>${ad.remark}
							<td>${ad.productId}
							<td><a href="${contextRoot}/shopad/update?id=${ad.shopAdId}">
									<button type="button" class="btn btn-outline-info">修改</button>
							</a>
							<td><a onclick="return confirm('確定刪除?')"
								href="${contextRoot}/shopad/delete?id=${ad.shopAdId}">
									<button type="button" class="btn btn-outline-danger">刪除</button>
							</a></tr></tbody>
					</c:forEach>
		</table>

		<br> <a href="${contextRoot}/shopad/insert">
			<button type="button" class="btn btn-outline-info">新增活動</button>
		</a>
	</div>
	<script>
		(function(document) {
			'use strict';

			// 建立 LightTableFilter
			var LightTableFilter = (function(Arr) {

				var _input;

				// 資料輸入事件處理函數
				function _onInputEvent(e) {
					_input = e.target;
					var tables = document.getElementsByClassName(_input
							.getAttribute('data-table'));
					Arr.forEach.call(tables, function(table) {
						Arr.forEach.call(table.tBodies, function(tbody) {
							Arr.forEach.call(tbody.rows, _filter);
						});
					});
				}

				// 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
				function _filter(row) {
					var text = row.textContent.toLowerCase(), val = _input.value
							.toLowerCase();
					row.style.display = text.indexOf(val) === -1 ? 'none'
							: 'table-row';
				}

				return {
					// 初始化函數
					init : function() {
						var inputs = document
								.getElementsByClassName('light-table-filter');
						Arr.forEach.call(inputs, function(input) {
							input.oninput = _onInputEvent;
						});
					}
				};
			})(Array.prototype);

			// 網頁載入完成後，啟動 LightTableFilter
			document.addEventListener('readystatechange', function() {
				if (document.readyState === 'complete') {
					LightTableFilter.init();
				}
			});

		})(document);
	</script>
</body>
</html>