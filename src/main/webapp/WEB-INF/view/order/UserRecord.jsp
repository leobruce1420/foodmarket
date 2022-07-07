<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/memberNavbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet"> --%>
<link href="${contextRoot}/css/shopcar.css" rel="stylesheet" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單明細</title>
<style>
#cc{
 margin-left:16%;
 margin-right:5%;
}

</style>
</head>
<body>

<div id="cc" class="row justify-content-center">
<div class="col-8">
<!-- <div class="container3"> -->

<table class="table table-bordered">
<thead>
<h1>我的歷史訂單紀錄</h1>
<tr>
<th>訂單編號</th>
<th>時間</th>
<th>總金額</th>
<th></th>
</tr>
</thead>

<c:forEach var="userRecord" items="${userRecords}">
	<tbody>
	<tr>
	<td><c:out value="${userRecord.id}" /></td>
	<td><c:out value="${userRecord.createDateStr}" /></td>	
	<td><c:out value="${userRecord.totalAmount}"/></td>
	<td><a href="${contextRoot}/userRecordItem/${userRecord.id}">
	<input class="insertOrderBtn btn btn-success" type="button" value="訂單明細"></a></td>
	</tr>
	</tbody>
</c:forEach>

</table>
</div>
</div>
<!-- </div> -->
</body>
</html>