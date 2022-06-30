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
	
		<div class="carousel slide" data-ride="carousel" id="carousel-demo">
			<ol class="carousel-indicators">
				<li data-target="#carousel-demo" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-demo" data-slide-to="1"></li>
				<li data-target="#carousel-demo" data-slide-to="2"></li>
			</ol>
			
				
				<div class="carousel-inner">
										
					<div class="carousel-item active">
					<c:forEach items="${ad}" step="4" begin="0" end="2"  var="ad" varStatus="s">
						<div>
						<a href="${ad.shopUrl}">
							<img class="d-block w-100"
								src="data:image/*;base64, ${ad.picture}" alt="" >
						</a>
						</div>
					</c:forEach>
					</div>
					
					<div class="carousel-item">
					<c:forEach items="${ad}" step="3" begin="1" end="2"  var="ad" varStatus="s">
						<img class="d-block w-100"
							src="data:image/*;base64, ${ad.picture}" alt="">
					</c:forEach>	
					</div>
					<c:forEach items="${ad}" step="1" begin="2" end="2"  var="ad" varStatus="s">
					<div class="carousel-item">
						<img class="d-block w-100"
							src="data:image/*;base64, ${ad.picture}" alt="">
					</div>
					</c:forEach>					
				</div>
				
			<a href="#carousel-demo" class="carousel-control-prev"
				data-slide="prev"> <span class="carousel-control-prev-icon"></span>
			</a> <a href="#carousel-demo" class="carousel-control-next"
				data-slide="next"> <span class="carousel-control-next-icon"></span>
			</a>

		</div>
		
	</div>
	


	<div class="container">
		<hr />

		<div class=" justify-content-center">


	
	<br/>
	<hr/>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class=""></li>
      <li data-target="#myCarousel" data-slide-to="1" class=""></li>
      <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="：  " preserveAspectRatio="xMidYMid slice" focusable="false"><title> </title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em"> </text></svg>

        <div class="container">
          <div class="carousel-caption text-left">
            <h1><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">示例標題。</font></font></h1>
            <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">輪播的第一張幻燈片的一些具有代表性的佔位符內容。</font></font></p>
            <p><a class="btn btn-lg btn-primary" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">今天註冊</font></font></a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="：  " preserveAspectRatio="xMidYMid slice" focusable="false"><title> </title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em"> </text></svg>

        <div class="container">
          <div class="carousel-caption">
            <h1><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">另一個示例標題。</font></font></h1>
            <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">輪播第二張幻燈片的一些代表性佔位符內容。</font></font></p>
            <p><a class="btn btn-lg btn-primary" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">學到更多</font></font></a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item active">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="：  " preserveAspectRatio="xMidYMid slice" focusable="false"><title> </title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em"> </text></svg>

        <div class="container">
          <div class="carousel-caption text-right">
            <h1><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一個更好的措施。</font></font></h1>
            <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">此輪播第三張幻燈片的一些代表性佔位符內容。</font></font></p>
            <p><a class="btn btn-lg btn-primary" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">瀏覽圖庫</font></font></a></p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-target="#myCarousel" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">以前的</font></font></span>
    </button>
    <button class="carousel-control-next" type="button" data-target="#myCarousel" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">下一個</font></font></span>
    </button>
  </div>
<div class="container">
<hr/>

		<div class=" justify-content-center">


			<br />

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
									style="width: 18rem; height: 23rem; background:">
									<img style="width: 200px; height: 200px;"
										src="data:image/image/*;base64,${workProduct.productimg}"
										alt="image" />
									<div class="card-body">
										<h5 class="card-title">${workProduct.productname}</h5>
										<p class="card-text">$${workProduct.productprice}</p>
										<a
											href="${contextRoot}/product/productname?productname=${workProduct.productname}"
											id="frontdesk" class="btn btn-primary stretched-link">加入購物車</a>
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
				
				function playImg(){
					for(var i=0; i<=2; i++){
						if(i>3){
							i=0;
						}
					}
				}
				
				$(document).ready(() => {
					  $('.carousel').carousel({
					     interval: 2000
					  })
					})
			
		</script>
			<br />

			<div class="album py-5 bg-light">
				<div class="container">

					<div class="row">
						<c:forEach var="workProduct" items="${page.content}">
							<div class="col-md-4">
								<div class="card mb-4 shadow-sm">
									<img style="width: 200px; height: 200px;"
										src="data:image/image/*;base64,${workProduct.productimg}"
										alt="image" />
									<div class="card-body">
										<h5 class="card-title">${workProduct.productname}</h5>
										<p class="card-text">$${workProduct.productprice}</p>
										<a
											href="${contextRoot}/product/productname?productname=${workProduct.productname}"
											id="frontdesk" class="btn btn-primary stretched-link">加入購物車</a>

									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>


			<hr />

			<div>
				<ul class="responsive">
					<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
						<c:forEach var="workProduct" items="${page.content}">
							<li>
				<div class="card-deck">

								<div class="card">
									<img style="width: 100%;" class="rounded mx-auto d-block img-thumbnail card-img-top"
										src="data:image/image/*;base64,${workProduct.productimg}"
										alt="image" />

									<div class="card-body">

										<h5 class="card-title">${workProduct.productname}</h5>
										<p class="card-text">$${workProduct.productprice}</p>
									</div>
									<div class="card-footer">
										<a
											href="${contextRoot}/product/productname?productname=${workProduct.productname}"
											id="frontdesk" class="btn btn-primary stretched-link ">加入購物車</a>

									</div>

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
			
			
			
			<br />
			
			<div class="album py-5 bg-light">
    <div class="container">

      <div class="row">
      <c:forEach var="workProduct" items="${page.content}">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm text-center">
									<img style="width: 100%; height: 100%;" class="rounded mx-auto d-block img-thumbnail"
										src="data:image/image/*;base64,${workProduct.productimg}"
										alt="image" />
									<div class="card-body ">
										<%-- 					<form:form action="${contextRoot}/product/productname" method="get"> --%>
										<h5 class="card-title">${workProduct.productname}</h5>
										<p class="card-text">$${workProduct.productprice}</p>
										<div class="card-footer">
										<a
											href="${contextRoot}/product/productname?productname=${workProduct.productname}"
											id="frontdesk" class="btn btn-primary stretched-link">加入購物車</a>
										</div>

								</div>
          </div>
        </div>
        </c:forEach>
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


		</div>
	</div>
</body>

</html>