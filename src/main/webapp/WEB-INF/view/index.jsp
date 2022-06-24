<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="layout/navbar.jsp" />
<jsp:include page="layout/navbarProduct.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
</head>
<body>
	<div class="container">


		<div class=" justify-content-center">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<!-- 		data-interval="false" -->
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<br />
				<div class="carousel-inner">
					<div class="carousel-item active">
						<table class="table table-dark">
							<tr>
								<td>
									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">Card with stretched link</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary stretched-link">Go
												somewhere</a>
										</div>
									</div>
								<td>
									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">Card with stretched link</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary stretched-link">Go
												somewhere</a>
										</div>
									</div>
								</td>
								<td>
									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">Card with stretched link</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary stretched-link">Go
												somewhere</a>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="carousel-item">
						<table class="table table-dark">
							<tr>
								<td>

									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">Card with stretched link</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary stretched-link">Go
												somewhere</a>
										</div>
									</div>
								</td>
								<td>
									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">Card with stretched link</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary stretched-link">Go
												somewhere</a>
										</div>
									</div>
								</td>
								<td>
									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">Card with stretched link</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary stretched-link">Go
												somewhere</a>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="carousel-item">
						<table class="table table-dark">
							<tr>
								<td>

									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">Card with stretched link</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary stretched-link">Go
												somewhere</a>
										</div>
									</div>
								</td>
								<td>
									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">Card with stretched link</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary stretched-link">Go
												somewhere</a>
										</div>
									</div>
								</td>
								<td>
									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">Card with stretched link</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary stretched-link">Go
												somewhere</a>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>

				<button class="carousel-control-prev" type="button"
					data-target="#carouselExampleIndicators" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-target="#carouselExampleIndicators" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</button>
			</div>

			<br />
			<hr />

			<div>
				<ul class="responsive">
					<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
						<c:forEach var="workProduct" items="${page.content}">
							<li>
								<div class="card"
									style="width: 18rem; height: 23rem; background: ">
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
									</div>
								</div>
							</li>
							<%--     <li><img style="width: 100px; height: 100px;" src= "data:image/image/*;base64,${workProduct.productimg}" alt="image"/></li> --%>
							<%--     <li><img style="width: 100px; height: 100px;" src= "data:image/image/*;base64,${workProduct.productimg}" alt="image"/></li> --%>
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
			
			
			
			<br />
			
			<div class="album py-5 bg-light">
    <div class="container">

      <div class="row">
      <c:forEach var="workProduct" items="${page.content}">
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
			





			<div>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active" aria-current="page">Home</li>
					</ol>
				</nav>

				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Library</li>
					</ol>
				</nav>

				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item"><a href="#">Library</a></li>
						<li class="breadcrumb-item active" aria-current="page">Data</li>
					</ol>
				</nav>
			</div>

			<br />

			<hr />

			<div class="container">


				<div class="row justify-content-center">

					<div class="col-12">

<!-- 						<table class="table"> -->
							
							<c:forEach var="workProduct" items="${page.content}">
								<tbody>
<!-- 									<tr> -->
<!-- 									<th> -->
										<div class="card" style="width: 18rem; height: 23rem;">
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
									</div>
								</div>
<!-- 									</th> -->
<!-- 									</tr> -->
								</tbody>
							</c:forEach>
<!-- 						</table> -->

					</div>

				</div>
			</div>

			<div class="row justify-content-center container">

				<div class="col-9">
					<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
						<c:choose>
							<c:when test="${page.number != pageNumber-1}">
								<a href="${contextRoot}/HOME?p=${pageNumber}"><c:out
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

			<div>
				<iframe width="350" height="430"
					src="https://console.dialogflow.com/api-client/demo/embedded/6cb987b6-9f11-453d-b85c-2173857e1f55">
				</iframe>
			</div>
			<br />

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

</html>