<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShoppingCar</title>
<style>
.tb1{
width:800px;
height:50px;
border:3px solid green;
border-collapse:collapse;
}
td,th{
border:1px solid gray;
text-align:center;
}

</style>
</head>
<body>

<h1>購物清單</h1><hr>
<table class="tb1">
<thead>
<tr>
<th>商品名稱</th>
<th>數量</th>
<th>單價</th>
<th>小計</th>
<th>取消</th>
</tr>
</thead>

<tbody>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>

</tr>
</tbody>
</table>


 <form>
  <div id="buylist">
  <div id="items_list"></div>
</div>
<a class="insertOrderBtn" type="button" href="${contextRoot}/shopcar/add/2">123</a>
</form>
</body>
<script>

</script>
</html>