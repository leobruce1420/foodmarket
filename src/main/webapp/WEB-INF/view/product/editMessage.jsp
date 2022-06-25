<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改商品</title>
</head>
<body>
	<div class="container">


		<div class="row justify-content-center">
			<div class="col-9">
				<h1>修改商品頁面</h1>
				<div class="card">
					<div class="card-header">修改商品</div>
					<div class="card-body">

						<form:form class="form" method="post" modelAttribute="pMsg" 
						enctype='multipart/form-data'>

							<form:input path="productid" type="hidden" />
							<form:input path="added" type="hidden" />
							<div class="form-group">
								<div>
									<%--   <form:textarea path="text" class="form-control"/> --%>
									商品名稱
									<form:input path="productname" class="form-control" />
<!-- 									商品類別編號 -->
<%-- 									<form:input path="productcategory" class="form-control" /> --%>
									<div>
									
									<br/>
									
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">商品類別</label>
									</div>
									<form:select class="custom-select" id="inputGroupSelect01"
										path="productcategory">
										<option value="蔬菜類">蔬菜類</option>
										<option value="水果類">水果類</option>
										<option value="肉品">肉品</option>
										<option value="海鮮">海鮮</option>
									</form:select>
								</div>
							</div>
									價格
									<form:input path="productprice" class="form-control" />
									
					</div> 
									<br />
									
									
									 商品介紹
									<form:input path="productdesciption" class="form-control" />
									庫存數量
									<form:input path="inventoryquantity" class="form-control" />
									<br />

							<div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">上下架</label>
									</div>
									<form:select class="custom-select" id="inputGroupSelect01"
										path="takedown">
										<option value="上">上</option>
										<option value="下">下</option>
										</form:select>
								</div>
							</div>
							
							<br/>
										<div>
								<label class="input-group-text" for="inputGroupSelect01">商品介紹</label>
								<form:textarea path="productdesciption" class="form-control" />
							</div>

							<br />

							<div>
								<label class="input-group-text" for="inputGroupSelect01">庫存數量</label>
								<form:input path="inventoryquantity" class="form-control" />
							</div>
							
							<br/>
							
							
<!-- 							<div> -->
<!-- 								<label class="input-group-text" for="inputGroupSelect01">商品介紹</label> -->
<%-- 								<form:textarea path="productdesciption" class="form-control" /> --%>
<!-- 							</div> -->

<!-- 							<br /> -->

<!-- 							<div> -->
<!-- 								<label class="input-group-text" for="inputGroupSelect01">庫存數量</label> -->
<%-- 								<form:input path="inventoryquantity" class="form-control" /> --%>
<!-- 							</div> -->
							
<!-- 							<br/> -->
							
							

									<form:input path="administrator" class="form-control"
										type="hidden" />
										
										
										圖
									<%--   <form:input path="productimg" class="form-control"/> --%>

									<div>
										<form:input path="productimg" type="file" accept="image/*"
											onchange="loadFile(event)" />
									</div>
									<br />
									修改後圖片
									 <img id="output" style="width: 100px; height: 100px;" />
									
									原始圖片
									<img id="output" style="width: 100px; height: 100px;"
										src="data:image/*;base64,${pMsg.productimg}"
										alt="image" />
									<!-- 										<input type="file" id="productimg" -->
									<!-- 										name="productimg" accept=".jpg,.jpeg,.gif" required /> -->
									<script>
										var loadFile = function(event) {
											var reader = new FileReader();
											reader.onload = function() {
												var output = document
														.getElementById('output');
												output.src = reader.result;
											};
											reader.readAsDataURL(event.target.files[0]);
													
										};
																			
// 										$(function() {
// 											$('#prodimg').hide();
// 										});

// 										function preview() {
// 											logo.src = URL
// 													.createObjectURL(event.target.files[0]);
// 											if ((event.target.files[0].type)
// 													.startsWith("image")) {
// 												$('#prodimg').show();
// 											}
// 										}
									</script>
								</div>
								<!-- 								<div> -->
								<!-- 									<a onclick="return confirm('真的要刪除嗎?')" -->
								<%-- 										href="${contextRoot}/product/delete?productid=${lastestpMsg.productid}"><button --%>
								<!-- 											class="btn btn-danger" class=".check_pid">刪除</button></a> -->
								<!-- 								</div> -->
						</form:form>
							</div>
							
							<div>
							<input type="submit" name="submit" value="修改訊息" onclick="return confirm('真的要修改嗎?')">
							<input class="btn btn-outline-danger" type="button" name="back" value="返回"onClick="javascript:history.back()">
							</div>



					</div>
				</div>

			</div>

		</div>
	</div>
</body>
</html>