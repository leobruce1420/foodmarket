<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<style>
table, td {
/* 	border: 3px SOLID; */
	/*     BACKGROUND-COLOR: RGB(187, 229, 235); */
	/*     COLOR: RED; */
	/*     BORDER-COLLAPSE: COLLAPSE; */
/* 	margin: 10px auto; */
/* 	font-size: 125%; */
/* 	padding: 10px; */
	/*     box-shadow: 5px 5px 2px gray; */
}

h5 {
	text-align: center;
}

.banner {
	width: 80%;
	margin: auto;
}

img {
	width: 200px;
}

.slick-slide {
	height: 45%;
}

.Btn-prev, .Btn-next {
	background: #6994B9;
}

.slick-slide img {
	margin: auto;
}

.card-text {
	margin-bottom: 10pt;
}

.stretched-link {
	
}
/* li{ */
/* border:3px rgb(66, 170, 218) solid ; */
/*     background-color: rgb(187, 229, 235); */
/*     color: red; */
/*     border-collapse: collapse; */
/*     margin: 10px auto; */
/*     font-size: 70%; */
/*     padding: 10px; */
/*     box-shadow: 5px 5px 2px gray; */
/* } */
</style>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
<%-- <link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick.css"/> --%>
<!-- // Add the new slick-theme.css if you want the default styling -->
<%-- <link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick-theme.css"/> --%>
</head>
<body>
	<br />


	<div class="container">


		<div class="row justify-content-center">
		<div class="col-8">
			<form class="form-inline my-2 my-lg-0"
				action="${contextRoot}/product/name" method="get">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search" id="name" name="productname" autocomplete="off"
					required>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜尋</button>
			</form>
			<%-- 	<form:form action="${contextRoot}/product/name" method="get"> --%>
			<!-- 	<div class="div1"> -->
			<!-- 				<label for="id" class="id">商品名稱查詢 : </label>  -->
			<!-- 				<input type="text" id="name" name="productname" autocomplete="off" required /> -->
			<!-- 				<input type="submit" value="查詢"> -->
			<!-- 			</div> -->
			<%-- 			</form:form> --%>
			</div>
			<div class="col-4">
			<form:form action="${contextRoot}/product/productcategory"
				method="get">
				<div class="div1">

					<!-- 				<label for="id" class="id">商品類別查詢 : </label>  -->
					<!-- 				<input type="text" id="name" name="productcategory" autocomplete="off" required /> -->
					<!-- 				<input type="submit" value="查詢"> -->


					<!-- 			</div> -->
					<!-- 			<div class="dropdown"> -->
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-expanded="false">商品類別</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="${contextRoot}/product/all">所有商品訊息</a>
						<a class="dropdown-item"
							href="${contextRoot}/product/productcategory?productcategory=蔬菜類">蔬菜類</a>
						<a class="dropdown-item"
							href="${contextRoot}/product/productcategory?productcategory=水果類">水果類</a>
						<a class="dropdown-item"
							href="${contextRoot}/product/productcategory?productcategory=肉品">肉品</a>
						<a class="dropdown-item"
							href="${contextRoot}/product/productcategory?productcategory=海鮮">海鮮</a>
					</div>
				</div>
			</form:form>
</div>
			<%-- 	<form:form action="${contextRoot}/product/productid" method="get"> --%>
			<!-- 	<div class="div1"> -->
			<!-- 				<label for="id" class="id">商品ID查詢 : </label>  -->
			<!-- 				<input type="text" id="name" name="productid" autocomplete="off" required /> -->
			<!-- 				<input type="submit" value="查詢"> -->
			<!-- 			</div> -->
			<%-- 			</form:form> --%>
			
			<hr />

			<br />

			<hr />

			<div class="col-18">

				<!-- 					<div class="card"> -->
				<!-- 						<div class="card-header"> -->
				<!-- 							最新訊息(時間) -->
				<%-- 							<fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE" --%>
				<%-- 								value="${workMessage.added}" /> --%>
				<!-- 						</div> -->
				<!-- 						<div class="card-body"> -->
				<%-- 							<c:out value="${workMessage.text}" /> --%>

				<!-- 						</div> -->
				<!-- 					</div> -->
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th scope="col">商品ID</th>
							<th scope="col">商品名稱</th>
							<th scope="col">商品類別</th>
							<th scope="col">價格</th>
							<th scope="col">商品圖片</th>
							<th scope="col">新增日期</th>
							<th scope="col">商品介紹</th>
							<th scope="col">庫存數量</th>
							<th scope="col">上下架</th>
<!-- 							<th scope="col">修改人員</th> -->
							<th scope="col">修改</th>
						</tr>
					</thead>
					<c:forEach var="workProduct" items="${page.content}">
						<tbody>
							<tr>
								<th scope="row"><c:out value="${workProduct.productid}" /></th>
								<td ><c:out value="${workProduct.productname}" /></td>
								<td><c:out value="${workProduct.productcategory}" /></td>
								<td><c:out value="${workProduct.productprice}" /></td>
								<td>
									<img
									style="width: 100px; height: 100px;"
									src="data:image/image/*;base64,${workProduct.productimg}"
									alt="image" />
								</td>
								<td><fmt:formatDate
										pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE"
										value="${workProduct.added}" /></td>

								<td><c:out value="${workProduct.productdesciption}" /></td>
								<td><c:out value="${workProduct.inventoryquantity}" /></td>
								<td><c:out value="${workProduct.takedown}" /></td>
<%-- 								<td><c:out value="${workProduct.administrator}" /></td> --%>
								<td><div>
										<a
											href="${contextRoot}/product/editProduct?productid=${workProduct.productid}"><button
												class="btn btn-info">編輯</button></a>
									</div> <br />
									<div>
										<a onclick="return confirm('真的要刪除嗎?')"
											href="${contextRoot}/product/delete?productid=${workProduct.productid}"><button
												class="btn btn-danger" class=".check_pid">刪除</button></a>
									</div>
									</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>

			</div>

		</div>






		<br />

	</div>
	
	<div class="row justify-content-center container">

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
		</div>
	

		<br />

		<hr />



		

	<br />

	<hr />

	<div>
		<ul class="responsive">
			<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				<c:forEach var="workProduct" items="${page.content}">
					<li>
						<div class="card"
							style="width: 18rem; height: 23rem; background: #B5FFB5">
							<img style="width: 200px; height: 200px;"
								src="data:image/image/*;base64,${workProduct.productimg}"
								alt="image" />
							<div class="card-body">
								<h5 class="card-title">${workProduct.productname}</h5>
								<p class="card-text">${workProduct.productprice}</p>
								<a href="#" id="frontdesk"
									class="btn btn-primary stretched-link">Go somewhere</a>
							</div>
						</div>
					</li>
				</c:forEach>
			</c:forEach>
		</ul>
	</div>
	<script type="text/javascript">
		// 需要左右兩邊可滑動的箭頭
		// arrows: true,
		// prevArrow: '<button type="button" class="slick-prev Btn-prev">Previous</button>',
		// nextArrow: '<button type="button" class="slick-next Btn-next">Next</button>',
		$(document).ready(function() {
			$('.responsive').slick({
				dots : false,
				infinite : false,
				speed : 300,
				slidesToShow : 4,
				slidesToScroll : 2,
				responsive : [ {
					breakpoint : 1024,
					settings : {
						// 	    	  畫面中一次輪播的幾張圖片
						slidesToShow : 3,
						// 	        左右滑動時，一次更新幾張圖片
						slidesToScroll : 2,
						// 	        照片播完時，再重新播放
						infinite : false,
						dots : false
					}
				}, {
					breakpoint : 600,
					settings : {
						slidesToShow : 2,
						slidesToScroll : 2
					}
				}, {
					breakpoint : 480,
					settings : {
						slidesToShow : 1,
						slidesToScroll : 1
					}
				}
				// You can unslick at a given breakpoint now by adding:
				// settings: "unslick"
				// instead of a settings object
				]
			});
		});
	</script>

<!-- 	<div class="col-md-4 order-md-2 mb-4"> -->
<!-- 		<h4 class="d-flex justify-content-between align-items-center mb-3"> -->
<!-- 			<span class="text-muted">Your cart</span> <span -->
<!-- 				class="badge badge-secondary badge-pill">3</span> -->
<!-- 		</h4> -->
<!-- 		<ul class="list-group mb-3"> -->
<!-- 			<li -->
<!-- 				class="list-group-item d-flex justify-content-between lh-condensed"> -->
<!-- 				<div> -->
<!-- 					<h6 class="my-0">Product name</h6> -->
<!-- 					<small class="text-muted">Brief description</small> -->
<!-- 				</div> <span class="text-muted">$12</span> -->
<!-- 			</li> -->
<!-- 			<li -->
<!-- 				class="list-group-item d-flex justify-content-between lh-condensed"> -->
<!-- 				<div> -->
<!-- 					<h6 class="my-0">Second product</h6> -->
<!-- 					<small class="text-muted">Brief description</small> -->
<!-- 				</div> <span class="text-muted">$8</span> -->
<!-- 			</li> -->
<!-- 			<li -->
<!-- 				class="list-group-item d-flex justify-content-between lh-condensed"> -->
<!-- 				<div> -->
<!-- 					<h6 class="my-0">Third item</h6> -->
<!-- 					<small class="text-muted">Brief description</small> -->
<!-- 				</div> <span class="text-muted">$5</span> -->
<!-- 			</li> -->
<!-- 			<li class="list-group-item d-flex justify-content-between bg-light"> -->
<!-- 				<div class="text-success"> -->
<!-- 					<h6 class="my-0">Promo code</h6> -->
<!-- 					<small>EXAMPLECODE</small> -->
<!-- 				</div> <span class="text-success">-$5</span> -->
<!-- 			</li> -->
<!-- 			<li class="list-group-item d-flex justify-content-between"><span>Total -->
<!-- 					(USD)</span> <strong>$20</strong></li> -->
<!-- 		</ul> -->

<%-- 		<form class="card p-2"> --%>
<!-- 			<div class="input-group"> -->
<!-- 				<input type="text" class="form-control" placeholder="Promo code"> -->
<!-- 				<div class="input-group-append"> -->
<!-- 					<button type="submit" class="btn btn-secondary">Redeem</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<%-- 		</form> --%>
<!-- 	</div> -->

</body>

</html>