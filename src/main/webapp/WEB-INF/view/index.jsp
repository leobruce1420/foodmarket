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
footer {
  background: #16222A;
  background: -webkit-linear-gradient(59deg, #3A6073, #16222A);
  background: linear-gradient(59deg, #3A6073, #16222A);
  color: white;
  margin-top:100px;
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

.social-network a.icoFacebook:hover i,
.social-network a.icoLinkedin:hover i {
  color: #fff;
}

.social-network a.socialIcon:hover,
.socialHoverClass {
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

.social-circle li a:hover i,
.triggeredHover {
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

</style>
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
					<c:forEach items="${ad}" step="4" begin="0" end="2" var="ad"
						varStatus="s">
						<div>
							<a href="${ad.shopUrl}"> <img class="d-block w-100"
								src="data:image/*;base64, ${ad.picture}" alt="">
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



	<hr />
	<div class="container">

		
		<hr />
		<div>
			<img src="${contextRoot}/img/hot.png" style="width: 1110px">
		</div>

		<div
			style="background-color: rgb(255, 145, 129); border-bottom-left-radius: 30px; border-bottom-right-radius: 30px">
			<table style="width: 1100px; height: 275px; margin: 0px auto;">
				<tr style="background-color: rgb(250, 250, 250);">
					<td style="text-align: center; padding: 2px; width: 225px">
						<div id="img_data0" style="position: relative">
							<img src="${contextRoot}/img/top1.png"
								style="position: absolute; top: -15; left: -15; width: 35%">
						</div>
						<div id="name_data0"
							style="text-align: center; font-size: 18px; padding-top: 12px"></div>
					</td>
					<td style="text-align: center; padding-left: 2px; width: 225px">
						<div id="img_data1" style="position: relative">
							<img src="${contextRoot}/img/top2.png"
								style="position: absolute; top: -15; left: -15; width: 35%">
						</div>
						<div id="name_data1"
							style="text-align: center; font-size: 18px; padding-top: 12px"></div>
					</td>
					<td style="text-align: center; padding: 2px; width: 225px">
						<div id="img_data2" style="position: relative">
							<img src="${contextRoot}/img/top3.png"
								style="position: absolute; top: -15; left: -15; width: 35%">
						</div>
						<div id="name_data2"
							style="text-align: center; font-size: 18px; padding-top: 12px"></div>
					</td>
					<td style="text-align: center; padding: 2px; width: 225px">
						<div id="img_data3"></div>
						<div id="name_data3"
							style="text-align: center; font-size: 18px; padding-top: 12px"></div>
					</td>
					<td style="text-align: center; padding: 2px; width: 225px">
						<div id="img_data4"></div>
						<div id="name_data4"
							style="text-align: center; font-size: 18px; padding-top: 12px"></div>
					</td>
				</tr>
			</table>
			<br/>
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
			<li class="page-item disabled">
			 	<a class="page-link" href="#" aria-label="Previous">
        		<span aria-hidden="true">&laquo;</span>
      			</a>
      		</li>
			</c:when>
			
			<c:otherwise>
			<li class="page-item">
			 	<a class="page-link" href="${contextRoot}/HOME?p=${page.number+1 -1}" aria-label="Previous">
        		<span aria-hidden="true">&laquo;</span>
      			</a>
      		</li>
			</c:otherwise>		
		</c:choose>

    	
  		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   		<c:choose>
   		
			<c:when test="${pageNumber == page.number+1}">
			 <li class="page-item disabled"><a class="page-link" href="${contextRoot}/HOME?p=${pageNumber}"><c:out value="${pageNumber}" /></a></li>
			</c:when>
			
			<c:otherwise>
			<li class="page-item"><a class="page-link" href="${contextRoot}/HOME?p=${pageNumber}"><c:out value="${pageNumber}" /></a></li>
			</c:otherwise>
			
		</c:choose>
   		</c:forEach>
   		
   		<c:choose>
			<c:when test="${page.number == page.totalPages-1}">
			 <li class="page-item disabled">
     		 	<a class="page-link" href="#" aria-label="Next">
        	 	<span aria-hidden="true">&raquo;</span>
      		 	</a>
    		 </li>
			</c:when>
			
			<c:otherwise>
			<li class="page-item">
     		 	<a class="page-link" href="${contextRoot}/HOME?p=${page.number +2}" aria-label="Next">
        	 	<span aria-hidden="true">&raquo;</span>
      		 	</a>
    		</li>
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
            <li><a href="${contextRoot}/product/category?productcategory=蔬菜類">蔬菜類</a></li>
            <li><a href="${contextRoot}/product/category?productcategory=水果類">水果類</a></li>
            <li><a href="${contextRoot}/product/category?productcategory=肉品">肉品</a></li>
            <li><a href="${contextRoot}/product/category?productcategory=海鮮">海鮮</a></li>
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
            <li><a href="#">常見問題</a></li>
            <li><a href="#">客服時間：週一至週日 08：00-21：00</a></li>
            <li><a href="#">客服電話：0800-092-000</a></li>
          </ul>
        </div>
      </div>
    	
    </div>
	<div class="row">
		<div class="col-md-12 copy">
			<p class="text-center">&copy; 版權所有好食光市場 Copyright 2022 - GoodTime Market 版權所有，轉載必究</p>
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
															img_data0 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
															img_data0 += img_obj0.name
															img_data0 += '">'
															img_data0 += '</a>'
															$('#img_data0').append(img_data0)
															name_data1 = ''
															img_data1 = ''
															var img_obj1 = img_sorted[1]
															var name_obj1 = name_sorted[1]
															img_data1 += '<a href="${contextRoot}/product/productname?productname='
															img_data1 += name_obj1.name
															img_data1 += '">'
															img_data1 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
															img_data1 += img_obj1.name
															img_data1 += '">'
															img_data1 += '</a>'
															$('#img_data1').append(img_data1)
															
															name_data2 = ''
															img_data2 = ''
															var img_obj2 = img_sorted[2]
															var name_obj2 = name_sorted[2]
															img_data2 += '<a href="${contextRoot}/product/productname?productname='
															img_data2 += name_obj2.name
															img_data2 += '">'
															img_data2 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
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
															img_data3 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
															img_data3 += img_obj3.name
															img_data3 += '"alt="image">'
															img_data3 += '</a>'
															$('#img_data3').append(img_data3)
															
															name_data4 = ''
															img_data4 = ''
															var img_obj4 = img_sorted[4]
															var name_obj4 = name_sorted[4]
															img_data4 += '<a href="${contextRoot}/product/productname?productname='
															img_data4 += name_obj4.name
															img_data4 += '">'
															img_data4 += '<img style="width: 200px; margin: 0, 10px" src="data:image/image/*;base64,' 
															img_data4 += img_obj4.name
															img_data4 += '"alt="image">'
															img_data4 += '</a>'
															$('#img_data4').append(img_data4)
															
															
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
														}
													})
												})	
									}
								})
							})			
							
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