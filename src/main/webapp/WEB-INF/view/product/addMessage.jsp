<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<div class="container">


	<div class="row justify-content-center">
		<div class="col-9">
			<h1>新增商品頁面</h1>
			<div class="card">
				<div class="card-header">請輸入新商品資訊</div>
				<div class="card-body">

					<%--   <form:form class="form" method="post" action="${contextRoot}/postMessage" modelAttribute="workMessages"> --%>
					<form:form class="form" method="post"
						action="${contextRoot}/postProduct" modelAttribute="workProduct"
						enctype="multipart/form-data">

						<div class="form-group">
							商品名稱
							<%--   <form:textarea path="text" class="form-control"/> --%>
							<%--   <form:textarea path="productname" class="form-control"/> --%>
							<form:input path="productname" class="form-control" />
							商品類別編號
							<form:input path="productcategory" class="form-control" />
							價格
							<form:input path="productprice" class="form-control" />
							<br /> 圖
							<%--   <form action=""> --%>
							<%--   <form:input path="productimg" class="form-control" /> --%>
							<!--   <input type="file" id="productimg" name="productimg" accept=".jpg,.jpeg,.gif" required/><br/> -->
							<%--   </form> --%>
							<div class="mb-4">
<!-- 								<label for="productimg" class="form-label">Logo</label> -->
								<form:input path="productimg" class="form-control" type="file"
									id="productimg" onchange="preview()" />
								<span id=productimgSp><c:out value="${errors.productimg}" /></span>
							</div>

							<div class="mb-3" style="text-align: center;">
								<img id="product" src="" width="100px" height="100px" />
							</div>
							圖檔名
							<form:input path="imgtype" class="form-control" />
							商品介紹
							<form:input path="productdesciption" class="form-control" />
							庫存數量
							<form:input path="inventoryquantity" class="form-control" />
							上下架
							<form:input path="takedown" class="form-control" />
						</div>

						<input type="submit" name="submit" value="新增商品">

					</form:form>

				</div>
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th scope="col">#</th>
							<th scope="col">First</th>
							<th scope="col">Last</th>
							<th scope="col">Handle</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>

	</div>

	<p />

	<div class="row justify-content-center">
		<div class="col-9">

			<div class="card">
				<div class="card-header">
					最新新增商品資訊
					<fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE"
						value="${lastestpMsg.added}" />
				</div>
				<div class="card-body">
					<div>
						<c:out value="${lastestpMsg.productname}" />
					</div>
					<div>
						<c:out value="${lastestpMsg.productcategory}" />
					</div>
					<div>
						<c:out value="${lastestpMsg.productprice}" />
					</div>
					<div>
						<c:out value='${lastestpMsg.productimg}' />
						<img
								src="<c:url value="${lastestpMsg.productimg}"/>"
								style="width: 100px; height: 100px;">
						<%--       <c:out value="${lastestpMsg.productimg}" /> --%>
						<%--       <img src= "data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image"/> --%>
					</div>
					<div>
						<c:out value="${lastestpMsg.imgtype}" />
					</div>
					<div>
						<c:out value="${lastestpMsg.productdesciption}" />
					</div>
					<div>
						<c:out value="${lastestpMsg.inventoryquantity}" />
					</div>
					<div>
						<c:out value="${lastestpMsg.takedown}" />
					</div>

				</div>
			</div>



		</div>

	</div>


</div>

