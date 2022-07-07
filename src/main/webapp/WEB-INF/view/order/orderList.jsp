<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/navbar.jsp" /> 
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextRoot}/css/orderList.css" rel="stylesheet" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>完成訂單</h1>

<div class="container">
	<c:forEach var="item" items="${orderItems}" begin="0" end="0">
		訂單時間：<input class="orderInput" type="text" value="${item.createDateStr}" disabled>
	</c:forEach>
	<hr style=" border-top: 1px solid white;">
<table class="table table-bordered border-primary">
	<thead>
		<tr class="table-secondary">
			<th class="prod_item">產品名稱</th>
			<th class="prod_name">價錢</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="item" items="${orderItems}">
		<tr >
			<td><input type="text" value="${item.productName}" disabled><input type="hidden" value="${item.id}"></td>
			<td><input type="text" value="${item.totalAmount}" disabled></td>
		</tr>
	</c:forEach>
	
	</tbody>
	</table>
	<br>
<div style="text-align:center">	
 <a href="${contextRoot}/HOME"><button type="button" class="btn btn-primary mr-sm-2">
 繼續購物
</button></a>
</div>
</div>

</body>
</html>