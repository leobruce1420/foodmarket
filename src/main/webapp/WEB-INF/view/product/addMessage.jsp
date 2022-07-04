<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../layout/adminNavbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<main role="main" class="col-md-6  ml-sm-auto  ">
 <h1 class="h1">新增商品頁面</h1>
</main>

<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
 <div class="container">

	<div class="row justify-content-center">
		<div class="col-9">
			<div class="card">
				<div class="card-header">請輸入新商品資訊</div>
				<div class="card-body">

					<%--   <form:form class="form" method="post" action="${contextRoot}/postMessage" modelAttribute="workMessages"> --%>
					<form:form class="form" method="post"
						action="${contextRoot}/postProduct" modelAttribute="workProduct"
						enctype="multipart/form-data">

						<div class="form-group">
							<div>
								<div class="input-group-prepend">
									<label class="input-group-text" for="inputGroupSelect01">商品名稱</label>
									<%--   <form:textarea path="text" class="form-control"/> --%>
									<%--   <form:textarea path="productname" class="form-control"/> --%>
									<form:input path="productname" class="form-control" />
								</div>
							</div>
							<br />
							<div>
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
							
							<br/>
							
<!-- 							<div> -->
<!-- 								<div class="input-group mb-3"> -->
<!-- 									<div class="input-group-prepend"> -->
<!-- 										<label class="input-group-text" for="inputGroupSelect01">商品類別</label> -->
<!-- 									</div> -->
<%-- 									<form:select class="custom-select" id="inputGroupSelect01" --%>
<%-- 										path="productcategoryid"> --%>
<!-- 										<option value="1">蔬菜類</option> -->
<!-- 										<option value="2">水果類</option> -->
<!-- 										<option value="3">肉品</option> -->
<!-- 										<option value="4">海鮮</option> -->
<%-- 									</form:select> --%>
<!-- 								</div> -->
<!-- 							</div> -->

							<br />

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<label class="input-group-text" for="inputGroupSelect01">價格</label>
								</div>
								<form:input path="productprice" class="form-control" />
							</div>
							<!-- 							價格 -->
							<%-- 							<form:input path="productprice" class="form-control" /> --%>

							

							<br />

							<div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">上下架</label>
									</div>
									<form:select class="custom-select" id="inputGroupSelect01"
										path="takedown">
										<option value="上架中">上架</option>
										<option value="已下架">下架</option>
									</form:select>
								</div>
							</div>
							
							<br/>
							
<!-- 							<div class="input-group mb-3"> -->
<!-- 									<div class="input-group-prepend"> -->
<!-- 										<label class="input-group-text" for="inputGroupSelect01">修改人員</label> -->
<!-- 									</div> -->
							<form:hidden path="administrator" class="form-control" />
<!-- 						</div> -->

						<br />

						<%--   <form action=""> --%>
						<%--   <form:input path="productimg" class="form-control" /> --%>

						<!--   <input type="file" name="file" id="img_upload_file" multiple="multiple" accept=".jpg,.jpeg,.gif" required/><br/> -->
						<!-- <input type="hidden" name="img_upload_base" id="img_upload_base" /> -->
						<!-- <label>圖片預覽</label>  -->
						<%-- <img id="img_upload_show"  style="width: 100px; height: 100px;" src= "data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image" /> --%>
						<%--   </form> --%>
						
						
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
							
<!-- 							<label for="productcategoryBean">商品種類</label> -->
<!-- 				<select  id="select" name="select"> -->
<%-- 				<c:forEach var="productcategoryBean" items="${productcategory1}"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${product.productCategoryBean.productCategoryId == productCategoryBean.productCategoryId}"> --%>
<%-- 					<option  selected="selected" value="${productcategoryBean.categoryId}">${productcategoryBean.productcategoryName}</option> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 					<option value="${productCategoryBean.productCategoryId}">${productCategoryBean.productCategoryName}</option> --%>
<%-- 				</c:otherwise></c:choose> --%>
<%-- 				</c:forEach> --%>
<!-- 				</select> -->
							
							<br/>
						
						<div>
							<label class="input-group-text" for="inputGroupSelect01">商品圖片</label>
						</div>
						<div class="custom-file">
							<form:input path="productimg" type="file" accept="image/* "
								onchange="loadFile(event)" class="custom-file-input"
								id="customFileLang" lang="es" />
							<label class="custom-file-label" for="customFileLang">請選擇圖片</label>
						</div>

						<br />
						
						<br />

							

						<br />


						<div>
							<img id="output" style="width: 100px; height: 100px;" />
						</div>
						<script>
							// function preview() {
							//     frame.src=URL.createObjectURL(event.target.files[0]);
							// }
							// $("#img_upload_file").change(function() {
							//         var file = this.files[0];
							//         var reader = new FileReader();
							//         reader.readAsDataURL(file);//呼叫自帶方法進行轉換
							//         reader.onload = function(e) {
							//             $("#img_upload_show").attr("src", this.result);//將轉換後的編碼存入src完成預覽
							//             $("#img_upload_base").val(this.result);//將轉換後的編碼儲存到input供後臺使用
							//         }; 
							//     });

							var loadFile = function(event) {
								var reader = new FileReader();
								reader.onload = function() {
									var output = document
											.getElementById('output');
									output.src = reader.result;
								};
								reader.readAsDataURL(event.target.files[0]);
							};
						</script>



						<!-- <div> -->
						<%--      <img id="frame" class="rounded-sm" alt="productImg" src="data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image" width="100px" height="100px"> --%>
						<!--      </div> -->

</div>
				<br/>
						<input type="submit" name="submit" value="新增商品">

					</form:form>

				</div>
<!-- 				<table class="table"> -->
<!-- 					<thead class="thead-light"> -->
<!-- 						<tr> -->
<!-- 							<th scope="col">#</th> -->
<!-- 							<th scope="col">First</th> -->
<!-- 							<th scope="col">Last</th> -->
<!-- 							<th scope="col">Handle</th> -->
<!-- 						</tr> -->
<!-- 					</thead> -->
<!-- 					<tbody> -->
<!-- 						<tr> -->
<!-- 							<th scope="row">1</th> -->
<!-- 							<td>Mark</td> -->
<!-- 							<td>Otto</td> -->
<!-- 							<td>@mdo</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th scope="row">2</th> -->
<!-- 							<td>Jacob</td> -->
<!-- 							<td>Thornton</td> -->
<!-- 							<td>@fat</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th scope="row">3</th> -->
<!-- 							<td>Larry</td> -->
<!-- 							<td>the Bird</td> -->
<!-- 							<td>@twitter</td> -->
<!-- 						</tr> -->
<!-- 					</tbody> -->
<!-- 				</table> -->
			</div>

		</div>

	</div>

	<p />

	<div class="row justify-content-center">
		<div class="col-9">

			<div class="card">
				<div class="card-header">最新新增商品資訊</div>
				<div class="card-body">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">商品名稱</th>
								<th scope="col">商品類別</th>
								<th scope="col">價格</th>
								<th scope="col">商品圖片</th>
								<th scope="col">新增日期</th>
								<th scope="col">商品介紹</th>
								<th scope="col">庫存數量</th>
								<th scope="col">上下架</th>
<!-- 								<th scope="col">修改人員</th> -->
							</tr>
						</thead>
						<tr>
							<td><c:out value="${lastestpMsg.productname}" /></td>
							<td><c:out value="${lastestpMsg.productcategory}" /></td>
							<td><c:out value="${lastestpMsg.productprice}" /></td>
							<td>
								<%--       <c:out value="${lastestpMsg.productimg}" /> --%> <img
								style="width: 100px; height: 100px;"
								src="data:image/image/*;base64,${lastestpMsg.productimg}"
								alt="image" />
							</td>
							<td><fmt:formatDate
									pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE"
									value="${lastestpMsg.added}" /></td>
<%-- 							<td><c:out value="${lastestpMsg.administrator}" /></td> --%>
							<td><c:out value="${lastestpMsg.productdesciption}" /></td>
							<td><c:out value="${lastestpMsg.inventoryquantity}" /></td>
							<td><c:out value="${lastestpMsg.takedown}" /></td>
						</tr>
					</table>
				</div>
			</div>



		</div>

	</div>


</div>
</div>

