<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/adminNavbar.jsp" />

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
<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
 <div class="container">
  <h1>後台訂單列表</h1>
 
<div><input id="searchInput" oninput="inputText()" type="search" class="light-table-filter" data-table="order-table" placeholder="請輸入..."></div>

<table class="order-table">
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
	<c:forEach var="records" items="${orderRecords}">
		<tr id="${records.id}" >
			<th><input type="text" id="recordsId" value="${records.id}" readonly size="5"></th>
			<th><input type="text" id="recordDate_${records.createDateStr}" value="${records.createDateStr}" readonly></th>
			<td><input type="text" value="${records.customerName}" readonly readonly size="10"></td>
			<td><input type="text" value="${records.mobile}" readonly></td>
			<td><input type="text" value="${records.address}" readonly size="50"></td>
			<td><input type="text" value="${records.totalAmount}" readonly></td>
			<td><a href="${contextRoot}/listItem/${records.id}">
			<input class="insertOrderBtn btn btn-success" type="button" value="訂單明細"></a></td>
		</tr>
			
	</c:forEach>
</tbody>	
	</table>
	</div>
	</div>
</body>
<script>


var searchInput = document.getElementById('searchInput')

var trArray = document.querySelectorAll('tbody tr')



function inputText(){
	var inputVal = document.getElementById("searchInput").value; //抓到輸入框裡面的值
	
	for (let tr of trArray) {
		
		var trId = tr.getAttribute("id");
// 		var date = document.getElementById('recordDate')
		if(inputVal == ''){ //沒輸入ID則顯示全部
			tr.style.display = '' 
		} else {
			if(trId.includes(inputVal)){
				tr.style.display = '' //ID相同則顯示
			} else {
				tr.style.display = 'none'  //隱藏
			}
		}
	}


	
}



</script>
</html>