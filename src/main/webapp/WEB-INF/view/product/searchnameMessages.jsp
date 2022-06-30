<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../layout/navbar.jsp" />
<jsp:include page="../layout/navbarProduct.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<style>
table,td{
    border:3px rgb(66, 170, 218) solid ;
    background-color: rgb(187, 229, 235);
    color: red;
    border-collapse: collapse;
    margin: 10px auto;
    font-size: 125%;
    padding: 10px;
    box-shadow: 5px 5px 2px gray;

}
</style>
<head>
<meta charset="UTF-8">
<title>前台查詢商品</title>
</head>
<body>
<!-- <div class="div1"> -->
<!-- 				<label for="id" class="id">單筆商品查詢 : </label> <input type="text" -->
<!-- 					id="id" name="id" autocomplete="off" required /><input -->
<!-- 					type="submit" value="查詢"> -->
<!-- 			</div> -->
	<br />
	
	<div class="album py-5 bg-light">
    <div class="container">

      <div class="row">
      <c:forEach var="workProduct" items="${workProduct}">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
<!--           <div class="card" style="width: 18rem; height: 23rem;"> -->
									<img style="width: 200px; height: 200px;"
										src="data:image/image/*;base64,${workProduct.productimg}"
										alt="image" />
									<div class="card-body">
										<%-- 					<form:form action="${contextRoot}/product/productname" method="get"> --%>
										<h5 class="card-title">${workProduct.productname}</h5>
										<p class="card-text">${workProduct.productprice}</p>
										<a
											href="${contextRoot}/product/productname?productname=${workProduct.productname}"
											id="frontdesk" class="btn btn-primary stretched-link">加入購物車</a>
										<%-- 					</form:form> --%>
<!-- 									</div> -->
								</div>
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
  </div>
	
	
	<hr/>
	


<!-- 			<br /> -->

<!-- 							標題對齊圖 -->
<!-- 						<figure class="figure"> -->
<!-- 							<img src="..." class="figure-img img-fluid rounded" alt="..."> -->
<!-- 							<figcaption class="figure-caption">A caption for the -->
<!-- 								above image.</figcaption> -->
<!-- 						</figure> -->
<!-- 								塗在中間 -->
<!-- 						<div class="text-center"> -->
<!-- 							<img src="..." class="rounded" alt="..."> -->
<!-- 						</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	</div> -->
</body>

</html>