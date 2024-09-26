<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/memberNavbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單明細</title>
</head>
<body>
<h1>訂單明細</h1>
<div class="container">
<div>訂購日期:<c:out  value ="${lastestRecord.createDateStr}" /></div>
<table class="table table-bordered border-primary">

	<thead>
		<tr class="table-secondary">
			<th >產品名稱</th>
			<th >數量</th>
			<th >單價</th>
			<th >小計</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="items" items="${orderItems}">
		<tr>
			<th><input type="text" value="${items.productName}" disabled size="40"></th>
			<td><input type="text" value="${items.quantity}" disabled></td>
			<td><input type="text" value="${items.productPrice}" disabled></td>
			<td><input type="text" value="${items.totalAmount}" disabled></td>
		</tr>
		<br>
	</c:forEach>
	</tbody>
	</table>
	<div class="carTotal">總金額:$<c:out  value ="${lastestRecord.totalAmount}" />元</div>
</div>


</body>
</html>