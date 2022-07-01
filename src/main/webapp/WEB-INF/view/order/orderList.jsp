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
	<h1>訂單明細</h1>
	<%-- <c:forEach var="item" items="${orderItems}" > --%>


	<c:forEach var="item" items="${orderItems}">
		<tr>
			<th>產品名稱 :<input type="text" value="${item.productName}" disabled></th>
			<td>價錢 :<input type="text" value="${item.totalAmount}" disabled></td>
		</tr>
		<br>
		
			<td><input type="hidden" value="${item.id}">
			
	</c:forEach>
	<br>
	<c:forEach var="item" items="${orderItems}" begin="0" end="0">
		訂單時間:<input type="text" value="${item.createDate}">
	</c:forEach>

	<br />

	<%-- </c:forEach> --%>


</body>
</html>