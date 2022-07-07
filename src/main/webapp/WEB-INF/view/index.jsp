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
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<meta charset="UTF-8">
<title>HOME</title>
</head>
<style>
html { 
            			height: 100%; 
     					} 
                    body {
                        background-image: url("<c:url value="/img/image4.jpg"/>");
                        background-repeat: no-repeat;
                        background-attachment:fixed;
                        background-position: 50% 50%;
                        background-size: 100% 100%;
                    }
/*                背景滿版    */

                    .swiper-container {
                        width: 830px;
                        height: 370px;
                    }
footer {
	background: #16222A;
	background: -webkit-linear-gradient(59deg, #3A6073, #16222A);
	background: linear-gradient(59deg, #3A6073, #16222A);
	color: white;
	margin-top: 100px;
}

footer a {
	color: #fff;
	font-size: 14px;
	transition-duration: 0.2s;
}

footer a:hover {
	color: #FA944B;
	text-decoration: none;
}

.copy {
	font-size: 12px;
	padding: 10px;
	border-top: 1px solid #FFFFFF;
}

.footer-middle {
	padding-top: 2em;
	color: white;
}

/*SOCİAL İCONS*/

/* footer social icons */
ul.social-network {
	list-style: none;
	display: inline;
	margin-left: 0 !important;
	padding: 0;
}

ul.social-network li {
	display: inline;
	margin: 0 5px;
}

/* footer social icons */
.social-network a.icoFacebook:hover {
	background-color: #3B5998;
}

.social-network a.icoLinkedin:hover {
	background-color: #007bb7;
}

.social-network a.icoFacebook:hover i, .social-network a.icoLinkedin:hover i
	{
	color: #fff;
}

.social-network a.socialIcon:hover, .socialHoverClass {
	color: #44BCDD;
}

.social-circle li a {
	display: inline-block;
	position: relative;
	margin: 0 auto 0 auto;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	text-align: center;
	width: 30px;
	height: 30px;
	font-size: 15px;
}

.social-circle li i {
	margin: 0;
	line-height: 30px;
	text-align: center;
}

.social-circle li a:hover i, .triggeredHover {
	-moz-transform: rotate(360deg);
	-webkit-transform: rotate(360deg);
	-ms--transform: rotate(360deg);
	transform: rotate(360deg);
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	-o-transition: all 0.2s;
	-ms-transition: all 0.2s;
	transition: all 0.2s;
}

.social-circle i {
	color: #595959;
	-webkit-transition: all 0.8s;
	-moz-transition: all 0.8s;
	-o-transition: all 0.8s;
	-ms-transition: all 0.8s;
	transition: all 0.8s;
}

.social-network a {
	background-color: #F9F9F9;
}

.topbtn {
	width: 80px;
	display: none;
	cursor: pointer;
	position: fixed;
	bottom: 250px;
	right: 30px;
}
</style>
<body>
	<br />
	<div class="container">
		<div class="carousel slide" data-ride="carousel" id="carousel-demo">
			<ol class="carousel-indicators">
				<li data-target="#carousel-demo" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-demo" data-slide-to="1"></li>
				<li data-target="#carousel-demo" data-slide-to="2"></li>
			</ol>


			<div class="carousel-inner">

				<div class="carousel-item active">
					<c:forEach items="${ad}" step="4" begin="0" end="2" var="ad"
						varStatus="s">
						<div>
							<a href="${ad.shopUrl}"> <img class="d-block w-100"
								src="data:image/*;base64, ${ad.picture}"  alt="">
							</a>
						</div>
					</c:forEach>
				</div>

				<div class="carousel-item">
					<c:forEach items="${ad}" step="3" begin="1" end="2" var="ad"
						varStatus="s">
						<img class="d-block w-100"
							src="data:image/*;base64, ${ad.picture}" alt="">
					</c:forEach>
				</div>
				<c:forEach items="${ad}" step="1" begin="2" end="2" var="ad"
					varStatus="s">
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


	<img src="${contextRoot}/img/topbtn.png" class="topbtn" id="topbtn"
		onclick="topFunction()">

	<br />
	<div class="container">

		<div>
					<img src="${contextRoot}/img/hot.png" style="width:1110px">
				</div>
					<div style="background-color: rgb(255, 145, 129);  border-bottom-left-radius: 30px; border-bottom-right-radius: 30px"> 
						<div style="width:1100px; height: 285px; margin: 0px auto;">
						<ul class="responsive_topsale" style="list-style-type: none; padding-left:15px">
						
							<li style="text-align: center; width:225px">								
								<div id="img_data0" style="position: relative"><img src="${contextRoot}/img/top1.png" style="position: absolute; top:0; left:-10; width:28%"></div>
								<div id="name_data0" style="text-align: center; font-size:18px;font-weight: bold; padding-top:12px"></div>								
							</li>	
							<li style="text-align: center; width:225px">
								<div id="img_data1" style="position: relative"><img src="${contextRoot}/img/top2.png" style="position: absolute; top:0; left:-10; width:28%"></div>
								<div id="name_data1" style="text-align: center; font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data2" style="position: relative"><img src="${contextRoot}/img/top3.png" style="position: absolute; top:0; left:-10; width:28%"></div>
								<div id="name_data2" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>											
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data3"></div>
								<div id="name_data3" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data4"></div>
								<div id="name_data4" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data5"></div>
								<div id="name_data5" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data6"></div>
								<div id="name_data6" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data7"></div>
								<div id="name_data7" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data8"></div>
								<div id="name_data8" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data9"></div>
								<div id="name_data9" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data10"></div>
								<div id="name_data10" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data11"></div>
								<div id="name_data11" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data12"></div>
								<div id="name_data12" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data13"></div>
								<div id="name_data13" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li>
							<li style="text-align: center; width:225px">
								<div id="img_data14"></div>
								<div id="name_data14" style="text-align: center;font-size:18px;font-weight: bold; padding-top:12px"></div>
							</li> 
						</ul>
					</div>
				</div>


		<hr />
		<div>
			<h1 class="text-center">最新商品</h1>
			<ul class="responsive">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
					<c:forEach var="workProduct" items="${page.content}">
						<li>
							<div class="card-deck text-center">
								<!-- 								<div class="card-deck mb-4 shadow-sm"> -->
								<div class="card">
									<div class="card-body">
										<a
											href="${contextRoot}/product/product?productid=${workProduct.productid}">
											<img style="width: 100%; height: 100%;"
											class="rounded mx-auto d-block img-thumbnail card-img-top"
											src="data:image/image/*;base64,${workProduct.productimg}"
											alt="image" />
										</a>
									</div>
									<div class="card-body">
										<%-- 					<form:form action="${contextRoot}/product/productname" method="get"> --%>

										<h5 class="card-title">
											<a
												href="${contextRoot}/product/product?productid=${workProduct.productid}">${workProduct.productname}</a>
										</h5>
										<p class="card-text">$${workProduct.productprice}</p>
									</div>
									<div class="card-footer">
										<input type="hidden" id="productId_${workProduct.productid}"
											value="${workProduct.productid}"> <input
											class="insertProductBtn btn btn-success" type="button"
											value="加入購物車"
											onclick="insertProduct(${workProduct.productid},${loginUserId})">
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
										href="${contextRoot}/product/product?productid=${workProduct.productid}">
										<img style="width: 100%; height: 100%;"
										class="rounded mx-auto d-block img-thumbnail"
										src="data:image/image/*;base64,${workProduct.productimg}"
										alt="image" />
									</a>
								</div>
								<div class="card-body ">
									<%-- 					<form:form action="${contextRoot}/product/productname" method="get"> --%>
									<h5 class="card-title">
										<a
											href="${contextRoot}/product/product?productid=${workProduct.productid}">${workProduct.productname}</a>
									</h5>
									<p class="card-text">$${workProduct.productprice}</p>
									<div class="card-footer">
										<input type="hidden" id="productId_${workProduct.productid}"
											value="${workProduct.productid}"> <input
											class="insertProductBtn btn btn-success" type="button"
											value="加入購物車"
											onclick="insertProduct(${workProduct.productid},${loginUserId})">
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<!-- 		<div class="row justify-content-center container"> -->

		<!-- 			<div class="col-9"> -->
		<%-- 				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}"> --%>
		<%-- 					<c:choose> --%>
		<%-- 						<c:when test="${page.number != pageNumber-1}"> --%>
		<%-- 							<a href="${contextRoot}/HOME?p=${pageNumber}"><c:out --%>
		<%-- 									value="${pageNumber}" /></a> --%>
		<%-- 						</c:when> --%>

		<%-- 						<c:otherwise> --%>
		<%-- 							<c:out value="${pageNumber}" /> --%>
		<%-- 						</c:otherwise> --%>

		<%-- 					</c:choose> --%>

		<%-- 					<c:if test="${pageNumber != page.totalPages}"> --%>
		<!-- 							| -->
		<%-- 							</c:if> --%>
		<%-- 				</c:forEach> --%>


		<!-- 			</div> -->
		<!-- 		</div> -->

		<br />

		<!-- 	頁數顯示 -->
		<div class="w-100"></div>


		<ul class="pagination justify-content-center">

			<c:choose>
				<c:when test="${page.number == 0}">
					<li class="page-item disabled"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:when>

				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="${contextRoot}/HOME?p=${page.number+1 -1}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:otherwise>
			</c:choose>


			<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				<c:choose>

					<c:when test="${pageNumber == page.number+1}">
						<li class="page-item disabled"><a class="page-link"
							href="${contextRoot}/HOME?p=${pageNumber}"><c:out
									value="${pageNumber}" /></a></li>
					</c:when>

					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="${contextRoot}/HOME?p=${pageNumber}"><c:out
									value="${pageNumber}" /></a></li>
					</c:otherwise>

				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${page.number == page.totalPages-1}">
					<li class="page-item disabled"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:when>

				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="${contextRoot}/HOME?p=${page.number +2}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:otherwise>
			</c:choose>

		</ul>


		

		<br>

	</div>
	<hr />

	<footer class="mainfooter" role="contentinfo">
		<div class="footer-middle">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-6">
						<!--Column1-->
						<div class="footer-pad">
							<h4>商品專區</h4>
							<ul class="list-unstyled">
								<c:forEach var="productcategorytakeon"
									items="${productcategorytakeon}">
									<li><a
										href="${contextRoot}/product/category?categoryid=${productcategorytakeon.categoryid}">${productcategorytakeon.productcategoryname}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<!--Column1-->
						<div class="footer-pad">
							<h4>會員專區</h4>
							<ul class="list-unstyled">
								<li><a href="#">購物須知</a></li>
								<li><a href="#">退貨須知</a></li>
								<li><a href="#">隱私權政策</a></li>
								<li><a href="#">會員服務條款</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<!--Column1-->
						<div class="footer-pad">
							<h4>客服中心</h4>
							<ul class="list-unstyled">
								<li><a href="${contextRoot}/question/allQuestion">常見問題</a></li>
								<li><a href="#">客服時間：週一至週日 08：00-21：00</a></li>
								<li><a href="#">客服電話：0800-092-000</a></li>
							</ul>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="col-md-12 copy">
						<p class="text-center">&copy; 版權所有好食光市場 Copyright 2022 -
							GoodTime Market 版權所有，轉載必究</p>
					</div>
				</div>


			</div>
		</div>
	</footer>

</body>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
				
				$('.responsive_topsale').slick({
					  slidesToShow: 5,
					  slidesToScroll: 5,
					  autoplay: true,		
					  autoplaySpeed: 3000,
					});	
				
				$(document).ready(
						function() {
							$.ajax({
								url : '${contextRoot}/productCount',
								success : function(rtnMap) {
									var array = [];
									for ( var key in rtnMap) {
										array.push({
											name : key,
											value : rtnMap[key]
									});
									}
									var name_sorted = array.sort(function(a, b) {
										return +(b.value > a.value) || +(a.value === b.value) - 1
									});
									$(document).ready(
										function() {
											$.ajax({
												url : '${contextRoot}/productImg',
												success : function(rtnMap) {
													var array = [];
													for ( var key in rtnMap) {
														array.push({
															name : key,
															value : rtnMap[key]
													});
													}
													console.log(name_sorted)
													var img_sorted = array.sort(function(a, b) {
														return +(b.value > a.value) || +(a.value === b.value) - 1
													});
													$(document).ready(
															function() {
																$.ajax({
																	url : '${contextRoot}/productId',
																	success : function(rtnMap) {
																		var array = [];
																		for ( var key in rtnMap) {
																			array.push({
																				name : key,
																				value : rtnMap[key]
																		});
																		}
																		var id_sorted = array.sort(function(a, b) {
																			return +(b.value > a.value) || +(a.value === b.value) - 1
																		});
																		console.log(id_sorted)
																		console.log(id_sorted[0].name)

													name_data0 = ''
													img_data0 = ''
													id_data0 = ''
													var id_obj0 = id_sorted[0]
													var img_obj0 = img_sorted[0]
													var name_obj0 = name_sorted[0]
													img_data0 += '<a href="${contextRoot}/product/product?productid='
													img_data0 += id_obj0.name
													img_data0 += '">'
													img_data0 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data0 += img_obj0.name
													img_data0 += '">'
													img_data0 += '</a>'
													$('#img_data0').append(img_data0)
//	 												name_data0 += name_obj0.name
//	 												$('#name_data0').append(name_data0)	

													name_data1 = ''
													img_data1 = ''
													id_data1 = ''
													var id_obj1 = id_sorted[1]
													var img_obj1 = img_sorted[1]
													var name_obj1 = name_sorted[1]
													img_data1 += '<a href="${contextRoot}/product/product?productid='
													img_data1 += id_obj1.name
													img_data1 += '">'
													img_data1 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data1 += img_obj1.name
													img_data1 += '">'
													img_data1 += '</a>'
													$('#img_data1').append(img_data1)
//	 												name_data1 += name_obj1.name
//	 												$('#name_data1').append(name_data1)	
													
													name_data2 = ''
													img_data2 = ''
													id_data2 = ''
													var id_obj2 = id_sorted[2]
													var img_obj2 = img_sorted[2]
													var name_obj2 = name_sorted[2]
													img_data2 += '<a href="${contextRoot}/product/product?productid='
													img_data2 += id_obj2.name
													img_data2 += '">'
													img_data2 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data2 += img_obj2.name
													img_data2 += '"alt="image">'
													img_data2 += '</a>'
													$('#img_data2').append(img_data2)
//	 												name_data2 += name_obj2.name
//	 												$('#name_data2').append(name_data2)	
													
													name_data3 = ''
													img_data3 = ''
													id_data3 = ''
													var id_obj3 = id_sorted[3]
													var img_obj3 = img_sorted[3]
													var name_obj3 = name_sorted[3]
													img_data3 += '<a href="${contextRoot}/product/product?productid='
													img_data3 += id_obj3.name
													img_data3 += '">'
													img_data3 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data3 += img_obj3.name
													img_data3 += '"alt="image">'
													img_data3 += '</a>'
													$('#img_data3').append(img_data3)
//	 												name_data3 += name_obj3.name
//	 												$('#name_data3').append(name_data3)	
													
													name_data4 = ''
													img_data4 = ''
													id_data4 = ''
													var id_obj4 = id_sorted[4]
													var img_obj4 = img_sorted[4]
													var name_obj4 = name_sorted[4]
													img_data4 += '<a href="${contextRoot}/product/product?productid='
													img_data4 += id_obj4.name
													img_data4 += '">'
													img_data4 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data4 += img_obj4.name
													img_data4 += '"alt="image">'
													img_data4 += '</a>'
													$('#img_data4').append(img_data4)
//	 												name_data4 += name_obj4.name
//	 												$('#name_data4').append(name_data4)	
													
													name_data5 = ''
													img_data5 = ''
													id_data5 = ''
													var id_obj5 = id_sorted[5]
													var img_obj5 = img_sorted[5]
													var name_obj5 = name_sorted[5]
													img_data5 += '<a href="${contextRoot}/product/product?productid='
													img_data5 += id_obj5.name
													img_data5 += '">'
													img_data5 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data5 += img_obj5.name
													img_data5 += '"alt="image">'
													img_data5 += '</a>'
													$('#img_data5').append(img_data5)
//	 												name_data5 += name_obj5.name
//	 												$('#name_data5').append(name_data5)	
													
													name_data6 = ''
													img_data6 = ''
													id_data6 = ''
													var id_obj6 = id_sorted[6]
													var img_obj6 = img_sorted[6]
													var name_obj6 = name_sorted[6]
													img_data6 += '<a href="${contextRoot}/product/product?productid='
													img_data6 += id_obj6.name
													img_data6 += '">'
													img_data6 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data6 += img_obj6.name
													img_data6 += '"alt="image">'
													img_data6 += '</a>'
													$('#img_data6').append(img_data6)
//	 												name_data6 += name_obj6.name
//	 												$('#name_data6').append(name_data6)	
													
													name_data7 = ''
													img_data7 = ''
													id_data7 = ''
													var id_obj7 = id_sorted[7]
													var img_obj7 = img_sorted[7]
													var name_obj7 = name_sorted[7]
													img_data7 += '<a href="${contextRoot}/product/product?productid='
													img_data7 += id_obj7.name
													img_data7 += '">'
													img_data7 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data7 += img_obj7.name
													img_data7 += '"alt="image">'
													img_data7 += '</a>'
													$('#img_data7').append(img_data7)
//	 												name_data7 += name_obj7.name
//	 												$('#name_data7').append(name_data7)	
													
													name_data8 = ''
													img_data8 = ''
													id_data8 = ''
													var id_obj8 = id_sorted[8]
													var img_obj8 = img_sorted[8]
													var name_obj8 = name_sorted[8]
													img_data8 += '<a href="${contextRoot}/product/product?productid='
													img_data8 += id_obj8.name
													img_data8 += '">'
													img_data8 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data8 += img_obj8.name
													img_data8 += '"alt="image">'
													img_data8 += '</a>'
													$('#img_data8').append(img_data8)
//	 												name_data8 += name_obj8.name
//	 												$('#name_data8').append(name_data8)	
													
													name_data9 = ''
													img_data9 = ''
													id_data9 = ''
													var id_obj9 = id_sorted[9]
													var img_obj9 = img_sorted[9]
													var name_obj9 = name_sorted[9]
													img_data9 += '<a href="${contextRoot}/product/product?productid='
													img_data9 += id_obj9.name
													img_data9 += '">'
													img_data9 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data9 += img_obj9.name
													img_data9 += '"alt="image">'
													img_data9 += '</a>'
													$('#img_data9').append(img_data9)
//	 												name_data9 += name_obj9.name
//	 												$('#name_data9').append(name_data9)	
													
													name_data10 = ''
													img_data10 = ''
													id_data10 = ''
													var id_obj10 = id_sorted[10]
													var img_obj10 = img_sorted[10]
													var name_obj10 = name_sorted[10]
													img_data10 += '<a href="${contextRoot}/product/product?productid='
													img_data10 += id_obj10.name
													img_data10 += '">'
													img_data10 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data10 += img_obj10.name
													img_data10 += '"alt="image">'
													img_data10 += '</a>'
													$('#img_data10').append(img_data10)
//	 												name_data10 += name_obj10.name
//	 												$('#name_data10').append(name_data10)	
													
													name_data11 = ''
													img_data11 = ''
													id_data11 = ''
													var id_obj11 = id_sorted[11]
													var img_obj11 = img_sorted[11]
													var name_obj11 = name_sorted[11]
													img_data11 += '<a href="${contextRoot}/product/product?productid='
													img_data11 += id_obj11.name
													img_data11 += '">'
													img_data11 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data11 += img_obj11.name
													img_data11 += '"alt="image">'
													img_data11 += '</a>'
													$('#img_data11').append(img_data11)
//	 												name_data11 += name_obj11.name
//	 												$('#name_data11').append(name_data11)	
													
													name_data12 = ''
													img_data12 = ''
													id_data12 = ''
													var id_obj12 = id_sorted[12]
													var img_obj12 = img_sorted[12]
													var name_obj12 = name_sorted[12]
													img_data12 += '<a href="${contextRoot}/product/product?productid='
													img_data12 += id_obj12.name
													img_data12 += '">'
													img_data12 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data12 += img_obj12.name
													img_data12 += '"alt="image">'
													img_data12 += '</a>'
													$('#img_data12').append(img_data12)
//	 												name_data12 += name_obj12.name
//	 												$('#name_data12').append(name_data12)	
													
													name_data13 = ''
													img_data13 = ''
													id_data13 = ''
													var id_obj13 = id_sorted[13]
													var img_obj13 = img_sorted[13]
													var name_obj13 = name_sorted[13]
													img_data13 += '<a href="${contextRoot}/product/product?productid='
													img_data13 += id_obj13.name
													img_data13 += '">'
													img_data13 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data13 += img_obj13.name
													img_data13 += '"alt="image">'
													img_data13 += '</a>'
													$('#img_data13').append(img_data13)
//	 												name_data13 += name_obj13.name
//	 												$('#name_data13').append(name_data13)	
													
													name_data14 = ''
													img_data14 = ''
													id_data14 = ''
													var id_obj14 = id_sorted[14]
													var img_obj14 = img_sorted[14]
													var name_obj14 = name_sorted[14]
													img_data14 += '<a href="${contextRoot}/product/product?productid='
													img_data14 += id_obj14.name
													img_data14 += '">'
													img_data14 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
													img_data14 += img_obj14.name
													img_data14 += '"alt="image">'
													img_data14 += '</a>'
													$('#img_data14').append(img_data14)
//	 												name_data14 += name_obj14.name
//	 												$('#name_data14').append(name_data14)	
		
													name0 = ''
														var name_obj0 = name_sorted[0]
														name0 += name_obj0.name
														$('#name_data0').append(name0)	
														
													name1 = ''
														var name_obj1 = name_sorted[1]
														name1 += name_obj1.name
														$('#name_data1').append(name1)	
														
													name2 = ''
														var name_obj2 = name_sorted[2]
														name2 += name_obj2.name
														$('#name_data2').append(name2)	
														
													name3 = ''
														var name_obj3 = name_sorted[3]
														name3 += name_obj3.name
														$('#name_data3').append(name3)	
														
													name4 = ''
														var name_obj4 = name_sorted[4]
														name4 += name_obj4.name
														$('#name_data4').append(name4)	
														
													name5 = ''
														var name_obj5 = name_sorted[5]
														name5 += name_obj5.name
														$('#name_data5').append(name5)	
															
													name6 = ''
														var name_obj6 = name_sorted[6]
														name6 += name_obj6.name
														$('#name_data6').append(name6)	
														
													name7 = ''
														var name_obj7 = name_sorted[7]
														name7 += name_obj7.name
														$('#name_data7').append(name7)	
														
													name8 = ''
														var name_obj8 = name_sorted[8]
														name8 += name_obj8.name
														$('#name_data8').append(name8)	
														
													name9 = ''
														var name_obj9 = name_sorted[9]
														name9 += name_obj9.name
														$('#name_data9').append(name9)	
													
													name10 = ''
														var name_obj10 = name_sorted[10]
														name10 += name_obj10.name
														$('#name_data10').append(name10)	
														
													name11 = ''
														var name_obj11 = name_sorted[11]
														name11 += name_obj11.name
														$('#name_data11').append(name11)
													
													name12 = ''
														var name_obj12 = name_sorted[12]
														name12 += name_obj12.name
														$('#name_data12').append(name12)
													
													name13 = ''
														var name_obj13 = name_sorted[13]
														name13 += name_obj13.name
														$('#name_data13').append(name13)
													
													name14 = ''
														var name_obj14 = name_sorted[14]
														name14 += name_obj14.name
														$('#name_data14').append(name14)
												}
											})
										})	
									}
								})
							})
								}
							})
						})
							
function insertProduct(pId,cId) {
	
// 	var shopList = {};
// 	shopList.list =[];
//  	shoplist.list.push({"pId":pId })				
	
// 	console.log(shoplist.list.length);
	
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
// 				location.reload();
			})	
	}else{
		alert("請先登入");
		location.href='${contextRoot}/login';
	}
		}

</script>
<script>
window.onscroll = scrollFunction; //每當畫面捲動觸發一次

function scrollFunction() { 
  if (document.body.scrollTop > 800 || document.documentElement.scrollTop > 800) {
    document.getElementById("topbtn").style.display = "block";
  } else {
    document.getElementById("topbtn").style.display = "none";
  }
}//網頁捲動超過200pixel就會跑出來 display設定成block 跑回上面就隱藏。

// 重置scrollTop這個變數的值
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}
</script>
</html>