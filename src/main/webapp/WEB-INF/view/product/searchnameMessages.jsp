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
table, td {
	border: 3px rgb(66, 170, 218) solid;
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
					<div class="card mb-4 shadow-sm text-center">
						<div class="card-body">
							<!--           <div class="card" style="width: 18rem; height: 23rem;"> -->
							<a
								href="${contextRoot}/product/productname?productname=${workProduct.productname}">
								<img style="width: 100%; height: 100%;"
								class="rounded mx-auto d-block img-thumbnail card-img-top"
								src="data:image/image/*;base64,${workProduct.productimg}"
								alt="image" />
							</a>
							<div class="card-body">
								<%-- 					<form:form action="${contextRoot}/product/productname" method="get"> --%>
								<h5 class="card-title">
									<a
										href="${contextRoot}/product/productname?productname=${workProduct.productname}">${workProduct.productname}</a>
								</h5>
								<p class="card-text">$${workProduct.productprice}</p>
								<div class="card-footer">
										<input type="hidden" id="productId_${workProduct.productid}" value="${workProduct.productid}">
										<input class="insertProductBtn btn btn-success" type="button" value="加入購物車" onclick="insertProduct(${workProduct.productid},${loginUserId})">		
										</div>
							</div>
						</div>
					</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<hr />
</body>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">
function insertProduct(pId,cId) {
	if(cId!=null){	
		var id =document.getElementById('productId_'+pId).value;
			axios({
				method : 'post',
				url : '${contextRoot}/lock/shopcart/insert' ,
				data : {
					 "productNumber" : 1,
					 "customerId" : cId ,
					 "productId" :id
				}
			}).then(function(res) {
				alert("已加入購物車");
			})	
	}else{
		alert("請先登入")	
	}


		}
</script>

</html>