<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<title>好食光市場</title>
</head>
<body>
<div class="container">
<div class="row justify-content-center">

<div class="btn-group btn-group-toggle" data-toggle="buttons" style="width: 50rem;">
   <c:forEach var="productcategorytakeon" items="${productcategorytakeon}">
  <label class="btn btn-secondary ">
  <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=${productcategorytakeon.productcategoryname}">
    <input type="radio" name="options" id="option1" >${productcategorytakeon.productcategoryname}
    </a>
  </label>
  </c:forEach>

  
  
</div>
</div>
</div>


</body>
</html>