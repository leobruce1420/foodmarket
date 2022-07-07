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
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextRoot}/css/shopcar.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
 <div class="container">
<h1>後台訂單列表</h1>
搜尋：<input type="search" class="light-table-filter" data-table="table" placeholder="請輸入關鍵字"><br>
<!-- <div><input id="searchInput" oninput="inputText()" type="search" class="light-table-filter" data-table="order-table" placeholder="請輸入..."></div> -->
<table class="table">
<thead>
<tr>
<th>訂單編號</th>
<th>訂單日期</th>
<th>收件人</th>
<th>電話</th>
<th>收件人地址</th>
<th>訂單金額</th>
<th>訂單明細</th>
</tr>
</thead>
<tbody>
	<c:forEach var="records" items="${page.content}">
<%-- 		<tr id="${records.id}" > --%>
<tr>
			<td><c:out value="${records.id}" /></td>
			<td><c:out value="${records.createDateStr}" /></td>
			<td><c:out value="${records.customerName}" /></td>
			<td><c:out value="${records.mobile}"  /></td>
			<td><c:out value="${records.address}"/></td>
			<td><c:out value="${records.totalAmount}" /></td>
			

			<td><a href="${contextRoot}/listItem/${records.id}">
		
			<input class="insertOrderBtn btn btn-success" type="button" value="訂單明細"></a></td>
			</tr>
<%-- 			<input type="text" id="data" value="${records.createDateStr}" /> --%>
	</c:forEach>
	
</tbody>	
	</table>
	<div class="pageNumber">
		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
		<c:choose>
		<c:when test="${page.number != pageNumber-1}">
			<a href="${contextRoot}/record/page?p=${pageNumber}"><c:out value="${pageNumber}" /></a>
		</c:when>
		<c:otherwise>
		<c:out value="${pageNumber}" />
		</c:otherwise>
		</c:choose>
		<c:if test="${pageNumber != page.totalPages}">
		|
		</c:if>
		</c:forEach>
	</div>
		</div>
	</div>
</body>
<script>
// var showData = document.querySelector('#data');
// var dataDetal=showData.value;

// showData='';
// showData+=dataDetal;
// console.log(showData);

(function(document) {
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
//==========================================
// var searchInput = document.getElementById('searchInput')

// var trArray = document.querySelectorAll('tbody tr')



// function inputText(){
// 	var inputVal = document.getElementById("searchInput").value; //抓到輸入框裡面的值
	
// 	for (let tr of trArray) {
		
// 		var trId = tr.getAttribute("id");
//  		var date = document.getElementById('recordDate')
// 		if(inputVal == ''){ //沒輸入ID則顯示全部
// 			tr.style.display = '' 
// 		} else {
// 			if(trId.includes(inputVal)){
// 				tr.style.display = '' //ID相同則顯示
// 			} else {
// 				tr.style.display = 'none'  //隱藏
// 			}
// 		}
// 	}

// }

</script>
</html>