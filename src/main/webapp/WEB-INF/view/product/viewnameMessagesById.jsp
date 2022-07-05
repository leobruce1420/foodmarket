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
table, td {
	border: 3px rgb(66, 170, 218) solid;
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
<title>前台點擊商品查詢商品</title>
</head>
<body>

	<br />
	<div class="row">
		<div class="container">

			<div class="row justify-content">
				<div class="col-12">

					<div class="album py-3 bg-light">
						<div class="container">

							<div class="card-group">
								<div class="card">
									<div class="card-body">
										<a
											href="${contextRoot}/product/product?productid=${workProduct.productid}">
											<img style="width: 400px; height: 400px;"
											src="data:image/image/*;base64,${workProduct.productimg}"
											alt="image" />
										</a>
										<hr />
										<a href="${contextRoot}/product/product?productid=${workProduct.productid}">
										<h5 class="card-title">${workProduct.productname}</h5></a>
										<p class="card-text">$${workProduct.productprice}</p>
										<div class="card-footer" style="background-color: rgba(0,0,0,0);">
										<div class="card-group text-center" >
										<div class="card"  style="border: 0px;" >
									<div class="card-body" >
											<input type="hidden" id="productId_${workProduct.productid}"
												value="${workProduct.productid}"> <input
												class="insertProductBtn btn btn-success" type="button"
												value="加入購物車"
												onclick="insertProduct(${workProduct.productid},${loginUserId})">
												</div>
												</div>
											<div class="card"  style="border: 0px;">
											<div class="card-body">
												<c:choose>
													<c:when test="${listCheck == false}">
														<button type="button"
															class="btn btn-danger stretched-link "
															id="list${workProduct.productid}"
															onclick="listSwich(${workProduct.productid},${loginUserId})">收藏商品</button>
													</c:when>
													<c:otherwise>
														<button type="button"
															class="btn btn-secondary stretched-link"
															id="list${workProduct.productid}"
															onclick="listSwich(${workProduct.productid},${loginUserId})">取消收藏</button>
													</c:otherwise>
												</c:choose>

											</div>
											</div>
											</div>
										</div>

									</div>

								</div>


								<div class="card">
									<div class="card-body">

										<h4>商品詳情</h4>
										<hr />
										<p class="card-text">${workProduct.productdesciption}</p>


										<hr />
										<h5 class="card-title">請詳閱以下注意事項</h5>
										<p class="card-text">
											※下單即為消費者同意進行無接觸配送方式。<br /> 無接觸配送為貨運司機於指定時間內放置警衛<br />
											室或電聯客戶於一樓門口取貨（不送上樓不與）<br /> 客人接觸<br /> ※經聯繫收件者三次以上皆無法配送時，視為<br />
											配送失敗。配送失敗後僅補送一次，若補送失<br /> 敗則回收貨物且不退款<br />
											※依照消費者保護法的規定，生鮮食品不適用<br /> 7天無條件退貨條款。<br />
											※若您收到的貨品有問題請於24小時內連繫客<br /> 服處理，如收到商品有瑕疵或缺件問題，將採<br />
											用部分退款。<br /> ※生鮮農產品易受天候因素影響，如品質不佳<br />
											況產生缺貨狀，將更換等值商品，恕不另行通<br /> 知，敬請見諒。
										</p>
										<br />
									</div>


								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
	<script type="text/javascript">

function listSwich(Pid,Cid){
	
	if(Cid != null){
		
		var productId = Pid;
		
		var userId = Cid;
		
		var id = '#list'+productId;
		
		var params = {"productId":''+productId,"userId":''+ userId};
		
		console.log(params)

	    $.ajax({
	      type: "post"
	      , url: "http://localhost:8080/foodmarket/wishList/addOrCancel"
	      ,	contentType:'application/json'
	      , data: JSON.stringify(params)
	      , success: function(res){
	    	  
	    	  if(res == "取消收藏"){
	    		  $(id).addClass("btn-danger").removeClass("btn-secondary");
	    		  $(id)[0].innerHTML="收藏商品"
	    	  }else{
	    		  $(id).addClass("btn-secondary").removeClass("btn-danger");
	    		  $(id)[0].innerHTML="取消收藏"
	    	  }
	      }
	    });
			
	}else{
		alert("請先登入")	
	}
}

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
</body>


</html>