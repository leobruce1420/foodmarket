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
<title>後台查詢商品種類</title>
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
								</div>
								</div>
								</div>
<!-- 						<tbody> -->
<!-- 							<tr> -->
<%-- 								<th scope="row"><c:out value="${workProduct.productid}" /></th> --%>
<%-- 								<td><c:out value="${workProduct.productname}" /></td> --%>
<%-- 								<td><c:out value="${workProduct.productcategory}" /></td> --%>
<%-- 								<td><c:out value="${workProduct.productprice}" /></td> --%>
<!-- 								<td> -->
<%-- <%-- 								<c:out value="${workProduct.productimg}" /> --%> 
<%-- 								<img style="width: 100px; height: 100px;" src= "data:image/image/*;base64,${workProduct.productimg}" alt="image"/></td> --%>
<%-- 								<td><fmt:formatDate --%>
<%-- 										pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE" --%>
<%-- 										value="${workProduct.added}" /></td> --%>

<%-- 								<td><c:out value="${workProduct.productdesciption}" /></td> --%>
<%-- 								<td><c:out value="${workProduct.inventoryquantity}" /></td> --%>
<%-- 								<td><c:out value="${workProduct.takedown}" /></td> --%>
<%-- 								<td><c:out value="${workProduct.administrator}" /></td> --%>
<!-- 								<td><div> -->
<!-- 										<a -->
<%-- 											href="${contextRoot}/product/editProduct?productid=${workProduct.productid}"><button --%>
<!-- 												class="btn btn-info">編輯</button></a> -->
<!-- 									</div> <br /> -->
<!-- 									<div> -->
<!-- 										<a onclick="return confirm('真的要刪除嗎?')" -->
<%-- 											href="${contextRoot}/product/delete?productid=${workProduct.productid}"><button --%>
<!-- 												class="btn btn-danger" class=".check_pid">刪除</button></a> -->
<!-- 									</div></td> -->
<!-- 							</tr> -->
<!-- 						</tbody> -->
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
			<!-- 			<div> -->
			<!-- 				<table class="table"> -->
			<!-- 					<thead class="thead-light"> -->
			<!-- 						<tr> -->
			<!-- 							<th scope="col">productid</th> -->
			<!-- 							<th scope="col">productname</th> -->
			<!-- 							<th scope="col">productcategory</th> -->
			<!-- 							<th scope="col">productprice</th> -->
			<!-- 							<th scope="col">productimg</th> -->
			<!-- 							<th scope="col">added</th> -->
			<!-- 							<th scope="col">productdesciption</th> -->
			<!-- 							<th scope="col">Inventoryquantity</th> -->
			<!-- 							<th scope="col">takedown</th> -->

			<!-- 						</tr> -->
			<!-- 					</thead> -->
			<!-- 					<tbody> -->
			<!-- 						<tr> -->
			<!-- 							<th scope="row">1</th> -->
			<!-- 							<td>青蔥：1包(200g ±10%)</td> -->
			<!-- 							<td>蔬菜類</td> -->
			<!-- 							<td>139</td> -->
			<!-- 							<td>a01.jpg</td> -->
			<%-- 							<td><fmt:formatDate --%>
			<%-- 									pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE" --%>
			<%-- 									value="${workMessage.added}" /></td> --%>
			<!-- 							<td>青蔥：1包(200g ±10%)</td> -->
			<!-- 							<td>1000</td> -->
			<!-- 							<td>上架中</td> -->
			<!-- 						</tr> -->
			<!-- 						<tr> -->
			<!-- 							<th scope="row">2</th> -->
			<!-- 							<td>青蔥：1包(200g ±10%)</td> -->
			<!-- 							<td>蔬菜類</td> -->
			<!-- 							<td>139</td> -->
			<!-- 							<td>a01.jpg</td> -->
			<%-- 							<td><fmt:formatDate --%>
			<%-- 									pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE" --%>
			<%-- 									value="${workMessage.added}" /></td> --%>
			<!-- 							<td>青蔥：1包(200g ±10%)</td> -->
			<!-- 							<td>1000</td> -->
			<!-- 							<td>上架中</td> -->
			<!-- 						</tr> -->
			<!-- 						<tr> -->
			<!-- 							<th scope="row">3</th> -->
			<!-- 							<td>青蔥：1包(200g ±10%)</td> -->
			<!-- 							<td>蔬菜類</td> -->
			<!-- 							<td>139</td> -->
			<!-- 							<td>a01.jpg</td> -->
			<%-- 							<td><fmt:formatDate --%>
			<%-- 									pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE" --%>
			<%-- 									value="${workMessage.added}" /></td> --%>
			<!-- 							<td>青蔥：1包(200g ±10%)</td> -->
			<!-- 							<td>1000</td> -->
			<!-- 							<td>上架中</td> -->
			<!-- 						</tr> -->

			<!-- 					</tbody> -->
			<!-- 				</table> -->
			<!-- 			</div> -->

			<div>
				<br />
				<div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Card with stretched link</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary stretched-link">Go
							somewhere</a>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
<!-- 07/01shopcar修改 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
function insertProduct(pId) {
	var id =document.getElementById('productId_'+pId).value;
		axios({
			method : 'post',
			url : '${contextRoot}/shopcart/insert' ,
			data : {
				 "productNumber" : 1,
				 "customerId" : 1 ,
				 "productId" :id
			}
		}).then(function(res) {
			alert("已加入購物車");
		})

		}
</script>
</html>