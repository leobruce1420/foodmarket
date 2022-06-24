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
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel" >
<!-- 		data-interval="false" -->
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<br/>
		<div class="carousel-inner">
			<div class="carousel-item active">
			<table class="table table-dark">
			<tr>
			<td>
			
				<div class="card" style="width: 18rem;">
					<img src="a01.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Card with stretched link</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-target="#carouselExampleIndicators" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
		</button>
	</div>
	<br/>
	<div id="carouselExampleIndicator" class="carousel slide"
		data-ride="carousel"data-interval="false" >
<!-- 		data-interval="false" -->
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicator" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicator" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicator" data-slide-to="2"></li>
		</ol>
		<br/>
		<div class="carousel-inner">
			<div class="carousel-item active">
			<table class="table table-dark">
			<tr>
			<td>
			
				<div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Card with stretched link</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
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
			data-target="#carouselExampleIndicator" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-target="#carouselExampleIndicator" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
		</button>
	</div>
	<br/>
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
	<br/>
	<div>
	<iframe
    width="350"
    height="430"
    src="https://console.dialogflow.com/api-client/demo/embedded/6cb987b6-9f11-453d-b85c-2173857e1f55">
</iframe>
	</div>
	<br />
	<div class="container">

		<c:forEach var="workMessage" items="${page.content}">
			<div class="row justify-content-center">

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
								<th scope="col">productid</th>
								<th scope="col">productname</th>
								<th scope="col">productcategory</th>
								<th scope="col">productprice</th>
								<th scope="col">productimg</th>
								<th scope="col">ImgType</th>
								<th scope="col">added</th>
								<th scope="col">productdesciption</th>
								<th scope="col">Inventoryquantity</th>
								<th scope="col">takedown</th>
								<th scope="col">修改</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>青蔥：1包(200g ±10%)</td>
								<td>蔬菜類</td>
								<td>139</td>
								<td>a01.jpg</td>
								<td><fmt:formatDate
										pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE"
										value="${workMessage.added}" /></td>

								<td>青蔥：1包(200g ±10%)</td>
								<td><c:out value="${workMessage.text}" /></td>
								<td>上架中</td>
								<td><div>
										<a
											href="${contextRoot}/message/editMessage?id=${workMessage.id}"><button
												class="btn btn-info">編輯</button></a>
									</div> <br />
									<div>
										<a onclick="return confirm('真的要下架嗎?')"
											href="${contextRoot}/message/delete?id=${workMessage.id}"><button
												class="btn btn-danger" class=".check_pid">下架</button></a>
									</div></td>
							</tr>
						</tbody>
					</table>
					<!-- 					<div class="col-12 "> -->
					<%-- 						<a href="${contextRoot}/message/editMessage?id=${workMessage.id}"><button --%>
					<!-- 								class="btn btn-info">編輯</button></a> <a -->
					<!-- 							onclick="return confirm('真的要刪除嗎?')" -->
					<%-- 							href="${contextRoot}/message/delete?id=${workMessage.id}"><button --%>
					<!-- 								class="btn btn-danger" class=".check_pid">刪除</button></a> -->
					<!-- 					</div> -->

				</div>

			</div>


			<br />
		</c:forEach>

		<div class="row justify-content-center">

			<div class="col-9">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
					<c:choose>
						<c:when test="${page.number != pageNumber-1}">
							<a href="${contextRoot}/message/all?p=${pageNumber}"><c:out
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

</html>