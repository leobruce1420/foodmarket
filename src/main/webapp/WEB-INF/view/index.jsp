<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
	


		<hr />
	<div class="container">

		<div class=" justify-content-center">


	
	<br/>
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



			
					<br />
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<!-- data-interval="false" -->
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
						</ol>
						<br />
						<div class="carousel-inner">
							<div class="carousel-item active">
								<table class="table table-dark">
									<tr>
										<td>
											<div class="card" style="width: 15rem; height: 12rem">
												<div class="card-body" id="img_data0">

												</div>
											</div>
										<td>
											<div class="card" style="width: 15rem; height: 12rem">
												<div class="card-body" id="img_data1"></div>
											</div>
										</td>
										<td>
											<div class="card" style="width: 15rem; height: 12rem">
												<div class="card-body" id="img_data2">
												</div>
											</div>
										</td>
										<td>
											<div class="card" style="width: 15rem; height: 12rem">
												<div class="card-body" id="img_data3">
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
		
		
			<br />
</div>

			<hr />

			<div>
				<ul class="responsive">
					<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
						<c:forEach var="workProduct" items="${page.content}">
							<li>
				<div class="card-deck text-center">
<!-- 								<div class="card-deck mb-4 shadow-sm"> -->
								<div class="card">
								<div class="card-body">
								<a	href="${contextRoot}/product/productname?productname=${workProduct.productname}">
									<img style="width: 100%; height: 100%;" class="rounded mx-auto d-block img-thumbnail card-img-top"
										src="data:image/image/*;base64,${workProduct.productimg}"
										alt="image" /></a>
										</div>
									<div class="card-body">
										<%-- 					<form:form action="${contextRoot}/product/productname" method="get"> --%>
										
										<h5 class="card-title"><a href="${contextRoot}/product/productname?productname=${workProduct.productname}">${workProduct.productname}</a></h5>
										<p class="card-text">$${workProduct.productprice}</p>
									</div>
									<div class="card-footer">
										<input type="hidden" id="productId_${workProduct.productid}" value="${workProduct.productid}">
										<input class="insertProductBtn btn btn-success" type="button" value="加入購物車" onclick="insertProduct('${workProduct.productid}')">
<%-- 										<a	href="${contextRoot}/product/productname?productname=${workProduct.productname}" --%>
<!-- 											id="frontdesk" class="btn btn-primary stretched-link ">加入購物車</a> -->
										<%-- 					</form:form> --%>
									</div>
								</div>
					</div>
							</li>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
			
			
			
			
			<br />
			
			
			<div class="album py-5 bg-light">
    <div class="container">

      <div class="row">
      <c:forEach var="workProduct" items="${page.content}">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm text-center">
          <div class="card-body ">
          							<a
											href="${contextRoot}/product/productname?productname=${workProduct.productname}">
									<img style="width: 100%; height: 100%;" class="rounded mx-auto d-block img-thumbnail"
										src="data:image/image/*;base64,${workProduct.productimg}" alt="image" /></a>
										</div>
									<div class="card-body ">
										<%-- 					<form:form action="${contextRoot}/product/productname" method="get"> --%>
										<h5 class="card-title"><a href="${contextRoot}/product/productname?productname=${workProduct.productname}">${workProduct.productname}</a></h5>
										<p class="card-text">$${workProduct.productprice}</p>
										<div class="card-footer">
										<input type="hidden" id="productId_${workProduct.productid}" value="${workProduct.productid}">
										<input class="insertProductBtn btn btn-success" type="button" value="加入購物車" onclick="insertProduct('${workProduct.productid}')">		
<!-- 										<a -->
<%-- 											href="${contextRoot}/product/productname?productname=${workProduct.productname}" --%>
<!-- 											id="frontdesk" class="btn btn-primary stretched-link">加入購物車</a> -->
										</div>
										<%-- 					</form:form> --%>
<!-- 									</div> -->
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
			</div>
			</div>
<hr/>
			
</body>
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

							
							$(document).ready(
							function() {
								$.ajax({
									url : '${contextRoot}/productCount',
									success : function(
											rtnMap) {
										var array = [];
										for ( var key in rtnMap) {
											array.push({
												name : key,
												value : rtnMap[key]
										});
										}
										var name_sorted = array.sort(function(a, b) {
											return (a.value < b.value) ? 1 : ((b.value < a.value) ? -1 : 0)
										});
										
										name_data0 = ''
// 										var name_obj0 = name_sorted[0]
// 										name_data0 += '<tr style="color:rgb(0, 0, 0)">'
// 										name_data0 += '<td style="color:rgb(0, 0, 0)">' + name_obj0.name + '<td>'
// 										name_data0 += '<td style="color:rgb(0, 0, 0)">' + name_obj0.value + '<td>'

	
										$(document).ready(
												function() {
													$.ajax({
														url : '${contextRoot}/productImg',
														success : function(
																rtnMap) {
															var array = [];
															for ( var key in rtnMap) {
																array.push({
																	name : key,
																	value : rtnMap[key]
															});
															}
															console.log(name_sorted)
															var img_sorted = array.sort(function(a, b) {
																return (a.value < b.value) ? 1 : ((b.value < a.value) ? -1 : 0)
															});
															name_data0 = ''
															img_data0 = ''
															var img_obj0 = img_sorted[0]
															var name_obj0 = name_sorted[0]
															img_data0 += '<a href="${contextRoot}/product/productname?productname='
															img_data0 += name_obj0.name
															img_data0 += '">'
															img_data0 += '<img style="width: 80%;" class="rounded mx-auto d-block img-thumbnail card-img-top" src="data:image/image/*;base64,' 
															img_data0 += img_obj0.name
															img_data0 += '"alt="image">'
															img_data0 += '</a>'
															$('#img_data0').append(img_data0)

															name_data1 = ''
															img_data1 = ''
															var img_obj1 = img_sorted[1]
															var name_obj1 = name_sorted[1]
															img_data1 += '<a href="${contextRoot}/product/productname?productname='
															img_data1 += name_obj1.name
															img_data1 += '">'
															img_data1 += '<img style="width: 80%;" class="rounded mx-auto d-block img-thumbnail card-img-top" src="data:image/image/*;base64,' 
															img_data1 += img_obj1.name
															img_data1 += '"alt="image">'
															img_data1 += '</a>'
															$('#img_data1').append(img_data1)
															
															name_data2 = ''
															img_data2 = ''
															var img_obj2 = img_sorted[2]
															var name_obj2 = name_sorted[2]
															img_data2 += '<a href="${contextRoot}/product/productname?productname='
															img_data2 += name_obj2.name
															img_data2 += '">'
															img_data2 += '<img style="width: 80%;" class="rounded mx-auto d-block img-thumbnail card-img-top" src="data:image/image/*;base64,' 
															img_data2 += img_obj2.name
															img_data2 += '"alt="image">'
															img_data2 += '</a>'
															$('#img_data2').append(img_data2)
															
															name_data3 = ''
															img_data3 = ''
															var img_obj3 = img_sorted[3]
															var name_obj3 = name_sorted[3]
															img_data3 += '<a href="${contextRoot}/product/productname?productname='
															img_data3 += name_obj3.name
															img_data3 += '">'
															img_data3 += '<img style="width: 80%;" class="rounded mx-auto d-block img-thumbnail card-img-top" src="data:image/image/*;base64,' 
															img_data3 += img_obj3.name
															img_data3 += '"alt="image">'
															img_data3 += '</a>'
															$('#img_data3').append(img_data3)
														}
													})
												})
									}
								})
							})

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
			
		})

		}
</script>
</html>