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

<br/>
<%--  <c:forEach var="productcategory" items="${productcategory}"> --%>
<!--   <label class="btn btn-secondary "> -->
<%--   <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=${productcategory.productcategoryname}"> --%>
<%--     <input type="radio" name="options" id="option1" >${productcategory.productcategoryname} --%>
<!--     </a> -->
<!--   </label> -->
<%--   </c:forEach> --%>
<!--  <label class="btn btn-secondary "> -->
<%--   <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=蔬菜類"> --%>
<!--     <input type="radio" name="options" id="option1" >蔬菜類 -->
<!--     </a> -->
<!--   </label> -->
<!--   <label class="btn btn-secondary"> -->
<%--   <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=水果類"> --%>
<!--     <input type="radio" name="options" id="option2">水果類 -->
<!--   </a> -->
<!--   </label> -->
<!--   <label class="btn btn-secondary"> -->
<%--   <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=肉品"> --%>
<!--     <input type="radio" name="options" id="option3">肉品 -->
<!--  </a> -->
<!--   </label> -->
<!--   <label class="btn btn-secondary"> -->
<%--   <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=海鮮"> --%>
<!--     <input type="radio" name="options" id="option4">海鮮 -->
<!--   </a> -->
<!--   </label> -->
	<!-- <div class="div1"> -->
	<!-- 				<label for="id" class="id">單筆商品查詢 : </label> <input type="text" -->
	<!-- 					id="id" name="id" autocomplete="off" required /><input -->
	<!-- 					type="submit" value="查詢"> -->
	<!-- 			</div> -->
	<br />
	<div class="container">

		<div class="row justify-content-center text-center">
			<%-- 			<c:out  value="${workProduct.productcategory}" /> --%>

			<div class="col-12">

				<div class="album py-3 bg-light">
					<div class="container">

						<div class="row">


							<c:forEach var="workProduct" items="${workProduct}">
								<div class="col-md-4">
									<div class="card-group mb-4 shadow-sm text-center  h-100">
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


		}
</script>
</html>