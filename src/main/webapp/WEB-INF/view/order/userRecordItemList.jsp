<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/memberNavbar.jsp" />

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

<%-- <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" /> --%>
<link href="${contextRoot}/css/shopcar.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>訂單明細</h1>
<div class="row justify-content-center">
<div class="col-7">
	<table class="table table-bordered border-primary">
		<thead>
			<tr class="table-secondary">
				<th class="prod_item">產品名稱</th>
				<th class="prod_name">數量</th>
				<th class="prod_name">單價</th>
				<th class="prod_name">小計</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="items" items="${orderItems}">
			<tr>
				<td><input type="text" value="${items.productName}" disabled></td>
				<td><input type="text" value="${items.quantity}" disabled></td>
				<td><input type="text" value="${items.productPrice}" disabled></td>
				<td><input type="text" value="${items.totalAmount}" disabled></td>
			</tr>
				
		</c:forEach>
		
		
		</tbody>
	</table>
	</div>
</div>
	
</body>
</html>