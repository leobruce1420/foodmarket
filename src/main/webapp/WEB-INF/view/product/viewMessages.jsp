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

.slick-slide img{
    margin: auto;
}
.card-text{
margin-bottom: 10pt;
}
.stretched-link{
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
	<form:form action="${contextRoot}/product/productname" method="get">
	<div class="div1">
				<label for="id" class="id">商品名稱查詢 : </label> 
				<input type="text" id="name" name="productname" autocomplete="off" required />
				<input type="submit" value="查詢">
			</div>
			</form:form>
	<form:form action="${contextRoot}/product/productcategory" method="get">
	<div class="div1">
				<label for="id" class="id">商品類別查詢 : </label> 
				<input type="text" id="name" name="productcategory" autocomplete="off" required />
				<input type="submit" value="查詢">
			</div>
			</form:form>
	<form:form action="${contextRoot}/product/productid" method="get">
	<div class="div1">
				<label for="id" class="id">商品ID查詢 : </label> 
				<input type="text" id="name" name="productid" autocomplete="off" required />
				<input type="submit" value="查詢">
			</div>
			</form:form>
			
			<hr/>
			
			<br/>

			<hr/>

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
								<th scope="col">新增日期</th>
								<th scope="col">商品介紹</th>
								<th scope="col">庫存數量</th>
								<th scope="col">上下架</th>
								<th scope="col">修改人員</th>
								<th scope="col">修改</th>
							</tr>
						</thead>
						<c:forEach var="workProduct" items="${page.content}">
						<tbody>
							<tr>
								<th scope="row"><c:out value="${workProduct.productid}" /></th>
								<td><c:out value="${workProduct.productname}" /></td>
								<td><c:out value="${workProduct.productcategory}" /></td>
								<td><c:out value="${workProduct.productprice}" /></td>
								<td>
<%-- 								<c:out value="${workProduct.productimg}" /> --%>
								<img style="width: 100px; height: 100px;" src= "data:image/image/*;base64,${workProduct.productimg}" alt="image"/></td>
								<td><fmt:formatDate
										pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE"
										value="${workProduct.added}" /></td>

								<td><c:out value="${workProduct.productdesciption}" /></td>
								<td><c:out value="${workProduct.inventoryquantity}" /></td>
								<td><c:out value="${workProduct.takedown}" /></td>
								<td><c:out value="${workProduct.administrator}" /></td>
								<td><div>
										<a
											href="${contextRoot}/product/editProduct?productid=${workProduct.productid}"><button
												class="btn btn-info">編輯</button></a>
									</div> <br />
									<div>
										<a onclick="return confirm('真的要刪除嗎?')"
											href="${contextRoot}/product/delete?productid=${workProduct.productid}"><button
												class="btn btn-danger" class=".check_pid">刪除</button></a>
									</div></td>
							</tr>
						</tbody>
						</c:forEach>
					</table>

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

				<hr/>



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
			<div class="carousel-item active">
			<table class="table table-dark">
			<tr>
		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
			<c:forEach var="workProduct" items="${page.content}">
			<td>
			
				<div class="card container" style="width: 18rem;">
<%-- 				<img style="width: 100px; height: 100px;" src= "data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image"/> --%>
					<img style="width: 200px; height: 200px;" src="data:image/image/*;base64,${workProduct.productimg}" alt="image" class="card-img-top" >
					<div class="card-body">
						<h5 class="card-title">${workProduct.productname}</h5>
						<p class="card-text">${workProduct.productprice}</p>
						<a href="#" class="btn btn-primary stretched-link">加入購物車</a>
					</div>
				</div>
				</td>
				</c:forEach>
			
			</c:forEach>
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
	
	<hr/>
	
	<br/>
	
	<hr/>
	
	
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
					<img style="width: 200px; height: 200px;" src="data:image/image/*;base64,${workProduct.productimg}" alt="image" class="card-img-top" >
					<div class="card-body">
						<h5 class="card-title">${workProduct.productname}</h5>
						<p class="card-text">${workProduct.productprice}</p>
						<a href="#" class="btn btn-primary stretched-link">加入購物車</a>
					</div>
				</div>
				</td>
  </c:forEach>
				</tr>
				</table>
    </div>
    
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

<hr/>

<br/>

<hr/>

<div>
<ul class="responsive">
<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
<c:forEach var="workProduct" items="${page.content}">
    <li>
    <div class="card" style="width: 18rem ;height: 23rem; background: #B5FFB5" >
					<img style="width: 200px; height: 200px;" src= "data:image/image/*;base64,${workProduct.productimg}" alt="image"/>
					<div class="card-body">
						<h5 class="card-title">${workProduct.productname}</h5>
						<p class="card-text">${workProduct.productprice}</p>
						<a href="#" id="frontdesk" class="btn btn-primary stretched-link">Go
							somewhere</a>
					</div>
				</div>
    </li>
<%--     <li><img style="width: 100px; height: 100px;" src= "data:image/image/*;base64,${workProduct.productimg}" alt="image"/></li> --%>
<%--     <li><img style="width: 100px; height: 100px;" src= "data:image/image/*;base64,${workProduct.productimg}" alt="image"/></li> --%>
</c:forEach>
    </c:forEach>
  </ul>
</div>
<%--   <c:forEach var="pageNumber" begin="1" end="${page.totalPages}"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${page.number != pageNumber-1}"> --%>
<%-- 							<a href="${contextRoot}/product/all?p=${pageNumber}"><c:out --%>
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
<%-- <script type="text/javascript" src="${contextRoot}/js/slick.js"></script> --%>
<script type="text/javascript">
// 需要左右兩邊可滑動的箭頭
// arrows: true,
// prevArrow: '<button type="button" class="slick-prev Btn-prev">Previous</button>',
// nextArrow: '<button type="button" class="slick-next Btn-next">Next</button>',
$(document).ready(function(){
$('.responsive').slick({
	  dots: false,
	  infinite: false,
	  speed: 300,
	  slidesToShow: 4,
	  slidesToScroll: 2,
	  responsive: [
	    {
	      breakpoint: 1024,
	      settings: {
// 	    	  畫面中一次輪播的幾張圖片
	        slidesToShow: 3,
// 	        左右滑動時，一次更新幾張圖片
	        slidesToScroll: 2,
// 	        照片播完時，再重新播放
	        infinite: false,
	        dots: false
	      }
	    },
	    {
	      breakpoint: 600,
	      settings: {
	        slidesToShow: 2,
	        slidesToScroll: 2
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
	        slidesToShow: 1,
	        slidesToScroll: 1
	      }
	    }
	    // You can unslick at a given breakpoint now by adding:
	    // settings: "unslick"
	    // instead of a settings object
	  ]
	});
	});
</script>

<div class="col-md-4 order-md-2 mb-4">
      <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted">Your cart</span>
        <span class="badge badge-secondary badge-pill">3</span>
      </h4>
      <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0">Product name</h6>
            <small class="text-muted">Brief description</small>
          </div>
          <span class="text-muted">$12</span>
        </li>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0">Second product</h6>
            <small class="text-muted">Brief description</small>
          </div>
          <span class="text-muted">$8</span>
        </li>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0">Third item</h6>
            <small class="text-muted">Brief description</small>
          </div>
          <span class="text-muted">$5</span>
        </li>
        <li class="list-group-item d-flex justify-content-between bg-light">
          <div class="text-success">
            <h6 class="my-0">Promo code</h6>
            <small>EXAMPLECODE</small>
          </div>
          <span class="text-success">-$5</span>
        </li>
        <li class="list-group-item d-flex justify-content-between">
          <span>Total (USD)</span>
          <strong>$20</strong>
        </li>
      </ul>

      <form class="card p-2">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Promo code">
          <div class="input-group-append">
            <button type="submit" class="btn btn-secondary">Redeem</button>
          </div>
        </div>
      </form>
    </div>

</body>

</html>