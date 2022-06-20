<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">


<div class="row justify-content-center">
<div class="col-9">
  <h1>修改留言頁面</h1>
<div class="card">
  <div class="card-header">
    請輸入要修改的留言
  </div>
  <div class="card-body">
  
  <form:form class="form" method="post"  modelAttribute="pMsg">
  
  <form:input path="productid" type="hidden" />
  <form:input path="added" type="hidden" />
  <div class="form-group">
<%--   <form:textarea path="text" class="form-control"/> --%>
  商品名稱
  <form:input path="productname" class="form-control"/>
  商品類別編號
  <form:input path="productcategory" class="form-control"/>
  價格
  <form:input path="productprice" class="form-control"/>
  圖
  <form:input path="productimg" class="form-control"/>
  <div>
  <figure>
	<img src= "data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image" />
</figure>
  <script>
  
// function preview() { 
 //     frame.src=URL.createObjectURL(event.target.files[0]);
 // } 
</script> 
 <div>
					<img id="frame" class="rounded-sm" alt="productImg" src="${product.pImg}" width="100px" height="100px">
					</div>
  圖檔名
  <form:input path="imgtype" class="form-control"/>
  商品介紹
  <form:input path="productdesciption" class="form-control"/>
  庫存數量
  <form:input path="inventoryquantity" class="form-control"/>
  上下架
  <form:input path="takedown" class="form-control"/>
  </div>
  
  <input type="submit" name="submit" value="修改訊息">
  </div>
  </form:form>
  
   
    
  </div>
</div>

</div>

</div>
</div>
</body>
</html>