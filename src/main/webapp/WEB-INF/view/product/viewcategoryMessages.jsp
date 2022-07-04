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
<title>前台查詢商品種類</title>
</head>
<body>
	<!-- <div class="div1"> -->
	<!-- 				<label for="id" class="id">單筆商品查詢 : </label> <input type="text" -->
	<!-- 					id="id" name="id" autocomplete="off" required /><input -->
	<!-- 					type="submit" value="查詢"> -->
	<!-- 			</div> -->
	<br />
	<div class="container">

		<div class="row justify-content-center text-center">
			<%-- 			<c:out  value="${workProduct.productcategory}" /> --%>

			<div class="col-18">

				<div class="album py-3 bg-light">
					<div class="container">

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 50c184045b7e08bc635c3632a806f68f70a45d05
						<div class="row">


							<c:forEach var="workProduct" items="${workProduct}">
								<div class="col-md-4">
									<div class="card mb-4 shadow-sm text-center">
										<div class="card-body ">
											<a
												href="${contextRoot}/product/product?productid=${workProduct.productid}">
												<img style="width: 100%; height: 100%;"
												src="data:image/image/*;base64,${workProduct.productimg}"
												alt="image" />
											</a>
											</div>
											<div class="card-body">
												<%-- 					<form:form action="${contextRoot}/product/productname" method="get"> --%>
												<h5 class="card-title">${workProduct.productname}</h5>
												<p class="card-text">$${workProduct.productprice}</p>
												<div class="card-footer">
													<input type="hidden"
														id="productId_${workProduct.productid}"
														value="${workProduct.productid}"> <input
														class="insertProductBtn btn btn-success" type="button"
														value="加入購物車"
														onclick="insertProduct(${workProduct.productid},${loginUserId})">
												</div>
												<%-- 					</form:form> --%>
												<!-- 									</div> -->
										</div>
									</div>
<<<<<<< HEAD
=======
      <div class="row">
					
						
						<c:forEach var="workProduct" items="${workProduct}">
						<div class="col-md-4">
          <div class="card mb-4 shadow-sm">
						<img style="width: 100%; height: 100%;"
										src="data:image/image/*;base64,${workProduct.productimg}"
										alt="image" />
									<div class="card-body">
										<%-- 					<form:form action="${contextRoot}/product/productname" method="get"> --%>
										<h5 class="card-title">${workProduct.productname}</h5>
										<p class="card-text">$${workProduct.productprice}</p>
							
										<input type="hidden" id="productId_${workProduct.productid}" value="${workProduct.productid}">
										<input class="insertProductBtn btn btn-success" type="button" value="加入購物車" onclick="insertProduct('${workProduct.productid}')">	
										
<!-- 										<a -->
<%-- 											href="${contextRoot}/product/productname?productname=${workProduct.productname}" --%>
<!-- 											id="frontdesk" class="btn btn-primary stretched-link">加入購物車</a> -->
										<%-- 					</form:form> --%>
<!-- 									</div> -->
>>>>>>> 6b71fbac6b3439a5e9a36f53c3e89ec4d5c6a745
=======

>>>>>>> 50c184045b7e08bc635c3632a806f68f70a45d05
								</div>
							</c:forEach>
							<!-- 					<div class="col-12 "> -->
							<%-- 						<a href="${contextRoot}/message/editMessage?id=${workMessage.id}"><button --%>
							<!-- 								class="btn btn-info">編輯</button></a> <a -->
							<!-- 							onclick="return confirm('真的要刪除嗎?')" -->
							<%-- 							href="${contextRoot}/message/delete?id=${workMessage.id}"><button --%>
							<!-- 								class="btn btn-danger" class=".check_pid">刪除</button></a> -->
							<!-- 					</div> -->

						</div>

					</div>
				</div>
			</div>
		</div>

		<br />

		<div class="row justify-content-center">

			<div class="col-9">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
					<c:choose>
						<c:when test="${page.number != pageNumber-1}">
							<a href="${contextRoot}/product/all?p=${pageNumber}"><c:out
									value="${pageNumber}" /></a>
						</c:when>

						<c:otherwise>
							<c:out value="${pageNumber}" />
						</c:otherwise>

					</c:choose>

					<c:if test="${pageNumber != page.totalPages}">
							|
							</c:if>
				</c:forEach>


			</div>
			<br />
		</div>
	</div>
	
</body>
<<<<<<< HEAD
<<<<<<< HEAD
<script type="text/javascript">
=======
<!-- 07/01shopcar修改 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
>>>>>>> 6b71fbac6b3439a5e9a36f53c3e89ec4d5c6a745
function insertProduct(pId) {
	var id =document.getElementById('productId_'+pId).value;
		axios({
			method : 'post',
<<<<<<< HEAD
			url : '${contextRoot}/lock/shopcart/insert' ,
=======
			url : '${contextRoot}/shopcart/insert' ,
>>>>>>> 6b71fbac6b3439a5e9a36f53c3e89ec4d5c6a745
			data : {
				 "productNumber" : 1,
				 "customerId" : 1 ,
				 "productId" :id
			}
		}).then(function(res) {
			alert("已加入購物車");
		})
=======

<!-- 07/01shopcar修改 -->
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

>>>>>>> 50c184045b7e08bc635c3632a806f68f70a45d05

		}
</script>
</html>