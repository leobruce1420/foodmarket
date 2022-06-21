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
<title>Insert title here</title>
</head>
<body>
	<br />
	<div class="container">

		
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
								<th scope="col">商品ID</th>
								<th scope="col">商品名稱</th>
								<th scope="col">商品類別</th>
								<th scope="col">價格</th>
								<th scope="col">圖</th>
								<th scope="col">圖檔名</th>
								<th scope="col">新增日期</th>
								<th scope="col">商品介紹</th>
								<th scope="col">庫存數量</th>
								<th scope="col">上下架</th>
								<th scope="col">修改</th>
							</tr>
						</thead>
						<c:forEach var="workProduct" items="${page.content}">
						<tbody>
							<tr>
								<th scope="row"><c:out value="${workMessage.productid}" /></th>
								<td><c:out value="${workProduct.productname}" /></td>
								<td><c:out value="${workProduct.productcategory}" /></td>
								<td><c:out value="${workProduct.productprice}" /></td>
								<td>
<%-- 								<c:out value="${workProduct.productimg}" /> --%>
								<img style="width: 100px; height: 100px;" src= "data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image"/></td>
								<td><c:out value="${workProduct.imgtype}" /></td>
								<td><fmt:formatDate
										pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE"
										value="${workProduct.added}" /></td>

								<td><c:out value="${workProduct.productdesciption}" /></td>
								<td><c:out value="${workProduct.inventoryquantity}" /></td>
								<td><c:out value="${workProduct.takedown}" /></td>
								<td><div>
										<a
											href="${contextRoot}/product/editProduct?productid=${workProduct.productid}"><button
												class="btn btn-info">編輯</button></a>
									</div> <br />
									<div>
										<a onclick="return confirm('真的要下架嗎?')"
											href="${contextRoot}/product/delete?productid=${workProduct.productid}"><button
												class="btn btn-danger" class=".check_pid">下架</button></a>
									</div></td>
							</tr>
						</tbody>
						</c:forEach>
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
		
</div>
		<div class="row justify-content-center container" >

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
				<div class="card container" style="width: 20rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><c:out value="${workProduct.productname}" /></h5>
						<p class="card-text"><c:out value="${workProduct.productprice}" /></p>
						<a href="#" class="btn btn-primary stretched-link">加入購物車</a>
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


<div id="carouselExampleIndicator" class="carousel slide container"
		data-ride="carousel"data-interval="false" >
<!-- 		data-interval="false" -->
		<ol class="carousel-indicators">
<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
			<li data-target="#carouselExampleIndicator" data-slide-to="${page.totalPages}"
				class="active"></li>
<!-- 			<li data-target="#carouselExampleIndicator" data-slide-to="1"></li> -->
<!-- 			<li data-target="#carouselExampleIndicator" data-slide-to="2"></li> -->
		</c:forEach>
		</ol>
		<br/>
		<div class="carousel-inner container">
		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
			<div class="carousel-item active">
			<table class="table table-dark">
			<tr>
			<c:forEach var="workProduct" items="${page.content}">
			<td>
			
				<div class="card container" style="width: 18rem;">
<%-- 				<img style="width: 100px; height: 100px;" src= "data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image"/> --%>
					<img style="width: 200px; height: 200px;" src="data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image" class="card-img-top" >
					<div class="card-body">
						<h5 class="card-title">Card with stretched link</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary stretched-link">加入購物車</a>
					</div>
				</div>
				</td>
				</c:forEach>
<!-- 				<td> -->
<!-- 				<div class="card" style="width: 18rem;"> -->
<!-- 					<img src="..." class="card-img-top" alt="..."> -->
<!-- 					<div class="card-body"> -->
<!-- 						<h5 class="card-title">Card with stretched link</h5> -->
<!-- 						<p class="card-text">Some quick example text to build on the -->
<!-- 							card title and make up the bulk of the card's content.</p> -->
<!-- 						<a href="#" class="btn btn-primary stretched-link">Go -->
<!-- 							somewhere</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				</td> -->
<!-- 				<td> -->
<!-- 				<div class="card" style="width: 18rem;"> -->
<!-- 					<img src="..." class="card-img-top" alt="..."> -->
<!-- 					<div class="card-body"> -->
<!-- 						<h5 class="card-title">Card with stretched link</h5> -->
<!-- 						<p class="card-text">Some quick example text to build on the -->
<!-- 							card title and make up the bulk of the card's content.</p> -->
<!-- 						<a href="#" class="btn btn-primary stretched-link">Go -->
<!-- 							somewhere</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				</td> -->
			
			</tr>
			</table>
			</div>
			</c:forEach>
			
<!-- 			<div class="carousel-item"> -->
<!-- 				<table class="table table-dark"> -->
<!-- 			<tr> -->
<!-- 			<td> -->
			
<!-- 				<div class="card" style="width: 18rem;"> -->
<!-- 					<img src="..." class="card-img-top" alt="..."> -->
<!-- 					<div class="card-body"> -->
<!-- 						<h5 class="card-title">Card with stretched link</h5> -->
<!-- 						<p class="card-text">Some quick example text to build on the -->
<!-- 							card title and make up the bulk of the card's content.</p> -->
<!-- 						<a href="#" class="btn btn-primary stretched-link">Go -->
<!-- 							somewhere</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				</td> -->
<!-- 				<td> -->
<!-- 				<div class="card" style="width: 18rem;"> -->
<!-- 					<img src="..." class="card-img-top" alt="..."> -->
<!-- 					<div class="card-body"> -->
<!-- 						<h5 class="card-title">Card with stretched link</h5> -->
<!-- 						<p class="card-text">Some quick example text to build on the -->
<!-- 							card title and make up the bulk of the card's content.</p> -->
<!-- 						<a href="#" class="btn btn-primary stretched-link">Go -->
<!-- 							somewhere</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				</td> -->
<!-- 				<td> -->
<!-- 				<div class="card" style="width: 18rem;"> -->
<!-- 					<img src="..." class="card-img-top" alt="..."> -->
<!-- 					<div class="card-body"> -->
<!-- 						<h5 class="card-title">Card with stretched link</h5> -->
<!-- 						<p class="card-text">Some quick example text to build on the -->
<!-- 							card title and make up the bulk of the card's content.</p> -->
<!-- 						<a href="#" class="btn btn-primary stretched-link">Go -->
<!-- 							somewhere</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			</table> -->
<!-- 			</div> -->
			
			
<!-- 			<div class="carousel-item"> -->
<!-- 				<table class="table table-dark"> -->
<!-- 			<tr> -->
<!-- 			<td> -->
			
<!-- 				<div class="card" style="width: 18rem;"> -->
<!-- 					<img src="..." class="card-img-top" alt="..."> -->
<!-- 					<div class="card-body"> -->
<!-- 						<h5 class="card-title">Card with stretched link</h5> -->
<!-- 						<p class="card-text">Some quick example text to build on the -->
<!-- 							card title and make up the bulk of the card's content.</p> -->
<!-- 						<a href="#" class="btn btn-primary stretched-link">Go -->
<!-- 							somewhere</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				</td> -->
<!-- 				<td> -->
<!-- 				<div class="card" style="width: 18rem;"> -->
<!-- 					<img src="..." class="card-img-top" alt="..."> -->
<!-- 					<div class="card-body"> -->
<!-- 						<h5 class="card-title">Card with stretched link</h5> -->
<!-- 						<p class="card-text">Some quick example text to build on the -->
<!-- 							card title and make up the bulk of the card's content.</p> -->
<!-- 						<a href="#" class="btn btn-primary stretched-link">Go -->
<!-- 							somewhere</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				</td> -->
<!-- 				<td> -->
<!-- 				<div class="card" style="width: 18rem;"> -->
<!-- 					<img src="..." class="card-img-top" alt="..."> -->
<!-- 					<div class="card-body"> -->
<!-- 						<h5 class="card-title">Card with stretched link</h5> -->
<!-- 						<p class="card-text">Some quick example text to build on the -->
<!-- 							card title and make up the bulk of the card's content.</p> -->
<!-- 						<a href="#" class="btn btn-primary stretched-link">Go -->
<!-- 							somewhere</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			</table> -->
<!-- 			</div> -->
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
	
	
	
	<div id="carouselExampleControlsNoTouching" class="carousel slide container" data-touch="true" data-interval="false">
  <div class="carousel-inner">
	<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
    <div class="carousel-item active">
    <table>
  <tr>
  <c:forEach var="workProduct" items="${page.content}">
  <td>
      <div class="card" style="width: 18rem;">
<%-- 				<img style="width: 100px; height: 100px;" src= "data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image"/> --%>
					<img style="width: 200px; height: 200px;" src="data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image" class="card-img-top" >
					<div class="card-body">
						<h5 class="card-title">Card with stretched link</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary stretched-link">加入購物車</a>
					</div>
				</div>
				</td>
  </c:forEach>
				</tr>
				</table>
    </div>
    
<!--     <div class="carousel-item"> -->
<!--       <img src="..." class="d-block w-100" alt="..."> -->
<!--     </div> -->
<!--     <div class="carousel-item"> -->
<!--       <img src="..." class="d-block w-100" alt="..."> -->
<!--     </div> -->
  </c:forEach>
  </div>
  <button class="carousel-control-prev" type="button" data-target="#carouselExampleControlsNoTouching" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleControlsNoTouching" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>


<div id="carouselExampleControlsNoTouching" class="carousel slide" data-touch="true" data-interval="false">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="carousel-item"> -->
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
    
  <button class="carousel-control-prev" type="button" data-target="#carouselExampleControlsNoTouching" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleControlsNoTouching" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>

</body>

</html>