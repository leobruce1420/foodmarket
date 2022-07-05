<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../layout/adminNavbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改商品類別</title>
</head>
<body>

<main role="main" class="col-md-6  ml-sm-auto  ">
 <h1 class="h1">修改商品類別頁面</h1>
</main>

<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
 <div class="container-fluid">


		<div class="row justify-content-center">
			<div class="col-9">
				<div class="card">
					<div class="card-header">修改商品類別</div>
					<div class="card-body">

						<form:form class="form" method="post" modelAttribute="pMsg" 
						enctype='multipart/form-data'>

							<form:input path="categoryid" type="hidden" />
							<div class="form-group">
								<div>
									<%--   <form:textarea path="text" class="form-control"/> --%>
									商品類別
									<form:input path="productcategoryname" class="form-control" />
<!-- 									商品類別編號 -->
<%-- 									<form:input path="productcategory" class="form-control" /> --%>
									<div>
									
									<br/>
									
<!-- 								<div class="input-group mb-3"> -->
<!-- 									<div class="input-group-prepend"> -->
<!-- 										<label class="input-group-text" for="inputGroupSelect01">商品類別</label> -->
<!-- 									</div> -->
<%-- 									<form:input class="form-control" id="inputGroupSelect01" --%>
<%-- 										path="productcategory" style="pointer-events: none"/> --%>
<!-- 										<option value="蔬菜類">蔬菜類</option> -->
<!-- 										<option value="水果類">水果類</option> -->
<!-- 										<option value="肉品">肉品</option> -->
<!-- 										<option value="海鮮">海鮮</option> -->
<%-- 									</form:select> --%>
<!-- 								</div> -->
							</div>
					</div> 
									<br />
									
									
<!-- 									庫存數量 -->
<%-- 									<form:input path="inventoryquantity" class="form-control" /> --%>
<!-- 									<br /> -->

							<div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="takeon">上下架</label>
									</div>
									<form:select class="custom-select" id="takeon" name="takeon"
										path="takeon" >
										<form:option value="上架中">上架</form:option>
										<form:option value="已下架">下架</form:option>
										</form:select>
								</div>
							</div>
							


							
							
							
							
							

								</div>
								<!-- 								<div> -->
								<!-- 									<a onclick="return confirm('真的要刪除嗎?')" -->
								<%-- 										href="${contextRoot}/product/delete?productid=${lastestpMsg.productid}"><button --%>
								<!-- 											class="btn btn-danger" class=".check_pid">刪除</button></a> -->
								<!-- 								</div> -->
							<div>
							<input type="submit" name="submit" class="btn btn-outline-success" value="修改訊息" onclick="return confirm('真的要修改嗎?')">
							<input class="btn btn-outline-danger" type="button" name="back" value="返回"onClick="javascript:history.back()">
							</div>
						</form:form>
							</div>
							



					</div>
				</div>

			</div>

		</div>
		</div>
</body>
</html>