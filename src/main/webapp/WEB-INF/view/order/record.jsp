<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <jsp:include page="../layout/navbar.jsp" />  --%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextRoot}/css/shopcar.css" rel="stylesheet" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>後台訂單列表</h1>
<div><input type="search" class="light-table-filter" data-table="order-table" placeholder="請輸入..."></div>
<table class="order-table">
<thead>
<tr>
<th>訂單編號</th>
<th>收件人</th>
<th>電話</th>
<th>收件人地址</th>
<th>訂單金額</th>
<th>訂單明細</th>
</tr>
</thead>
	<c:forEach var="records" items="${orderRecords}">
		<tbody><tr>
			<th><input type="text" value="${records.id}" readonly></th>
			<td><input type="text" value="${records.customerName}" readonly></td>
			<td><input type="text" value="${records.mobile}" readonly></td>
			<td><input type="text" value="${records.address}" readonly></td>
			<td><input type="text" value="${records.totalAmount}" readonly></td>
			<td><a href="${contextRoot}/listItem/${records.id}">
			<input class="insertOrderBtn btn btn-success" type="button" value="訂單明細"></a></td>
		</tr>
		</tbody>	
	</c:forEach>
	
	</table>
</body>
<script>
(function(document) {
	  'use strict';

	  // 建立 LightTableFilter
	  var LightTableFilter = (function(Arr) {

	    var _input;

	    // 資料輸入事件處理函數
	    function _onInputEvent(e) {
	      _input = e.target;
	      var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
	      Arr.forEach.call(tables, function(table) {
	        Arr.forEach.call(table.tBodies, function(tbody) {
	          Arr.forEach.call(tbody.rows, _filter);
	        });
	      });
	    }

	    // 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
	    function _filter(row) {
	      var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
	      row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
	    }

	    return {
	      // 初始化函數
	      init: function() {
	        var inputs = document.getElementsByClassName('light-table-filter');
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
</html>