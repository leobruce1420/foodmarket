<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<%-- <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet"> --%>
<title>好食光市場</title>
</head>
<body>
<div class="container">
<div class="row justify-content-center">
<!-- <div  class="btn-group btn-group-toggle" role="group" aria-label="Basic example" style="width: 50rem;"> -->
<%--   <a class="dropdown-item" href="${contextRoot}/product/category?productcategory=蔬菜類"><button type="button" class="btn btn-secondary ">蔬菜類</button></a> --%>
<%--   <a class="dropdown-item" href="${contextRoot}/product/category?productcategory=水果類"><button type="button" class="btn btn-secondary ">水果類</button></a> --%>
<%--   <a class="dropdown-item" href="${contextRoot}/product/category?productcategory=肉品"><button type="button" class="btn btn-secondary ">肉品</button></a> --%>
<%--   <a class="dropdown-item" href="${contextRoot}/product/category?productcategory=海鮮"><button type="button" class="btn btn-secondary ">海鮮</button></a> --%>
<!-- </div> -->
<div class="btn-group btn-group-toggle" data-toggle="buttons" style="width: 50rem;">
  <label class="btn btn-secondary ">
  <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=蔬菜類">
    <input type="radio" name="options" id="option1" >蔬菜類
    </a>
  </label>
  <label class="btn btn-secondary">
  <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=水果類">
    <input type="radio" name="options" id="option2">水果類
  </a>
  </label>
  <label class="btn btn-secondary">
  <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=肉品">
    <input type="radio" name="options" id="option3">肉品
 </a>
  </label>
  <label class="btn btn-secondary">
  <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=海鮮">
    <input type="radio" name="options" id="option4">海鮮
  </a>
  </label>
  
  
</div>
</div>
</div>
<%-- <script src="${contextRoot}/js/jquery-3.6.0.js"></script> --%>
<%-- <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script> --%>

</body>
</html>