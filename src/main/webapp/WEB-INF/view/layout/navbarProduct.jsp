<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet"> --%>
<title>好食光市場</title>
</head>
<style>
nav {
	top: 0;
	width: 100%;
	transition: all 0.5s;
	position: relative;
	z-index: 1;
}

.fixed-nav nav {
	position: fixed;
}

.img1 {
	float: left;
	border-radius: 10px;;
}
</style>
<body>
	<!-- <div class="container"> -->
	<!-- <div class="row justify-content-center"> -->
	<!-- <!-- <div  class="btn-group btn-group-toggle" role="group" aria-label="Basic example" style="width: 50rem;"> -->
	<%-- <%--   <a class="dropdown-item" href="${contextRoot}/product/category?productcategory=蔬菜類"><button type="button" class="btn btn-secondary ">蔬菜類</button></a> --%>
	<%-- <%--   <a class="dropdown-item" href="${contextRoot}/product/category?productcategory=水果類"><button type="button" class="btn btn-secondary ">水果類</button></a> --%>
	<%-- <%--   <a class="dropdown-item" href="${contextRoot}/product/category?productcategory=肉品"><button type="button" class="btn btn-secondary ">肉品</button></a> --%>
	<%-- <%--   <a class="dropdown-item" href="${contextRoot}/product/category?productcategory=海鮮"><button type="button" class="btn btn-secondary ">海鮮</button></a> --%>
	<!-- <!-- </div> -->
	<!-- <div class="btn-group btn-group-toggle" data-toggle="buttons" style="width: 50rem;"> -->
	<!--   <label class="btn btn-secondary "> -->
	<%--   <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=蔬菜類"> --%>
	<!--     <input type="radio" name="options" id="option1" >蔬菜類 -->
	<!--     </a> -->
	<!--   </label> -->
	<!--   <label class="btn btn-secondary"> -->
	<%--   <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=水果類"> --%>
	<!--     <input type="radio" name="options" id="option2">水果類 -->
	<!--   </a> -->
	<!--   </label> -->
	<!--   <label class="btn btn-secondary"> -->
	<%--   <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=肉品"> --%>
	<!--     <input type="radio" name="options" id="option3">肉品 -->
	<!--  </a> -->
	<!--   </label> -->
	<!--   <label class="btn btn-secondary"> -->
	<%--   <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=海鮮"> --%>
	<!--     <input type="radio" name="options" id="option4">海鮮 -->
	<!--   </a> -->
	<!--   </label> -->


	<!-- </div> -->
	<!-- </div> -->
	<!-- </div> -->
	<nav class="navbar navbar-dark bg-dark navbar-expand-md" id="main">
		<div class="img1">
			<a class="nav-link" href="${contextRoot}/HOME"><img
				src="${contextRoot}/img/logo6.png" width="125px" class="img1"></a>
		</div>
		<div class="container">
			<div class="collapse navbar-collapse" id="navcol-1">
				<ul class="nav navbar-nav w-100 justify-content-between">

					<li class="nav-item dropdown"><a class="nav-link"
						href="${contextRoot}/product/category?productcategory=蔬菜類">蔬菜類</a>

					</li>
					<li class="nav-item dropdown"><a class="nav-link"
						href="${contextRoot}/product/category?productcategory=水果類">水果類</a>

					</li>
					<li class="nav-item dropdown"><a class="nav-link"
						data-display="static"
						href="${contextRoot}/product/category?productcategory=肉品">肉品</a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						data-display="static"
						href="${contextRoot}/product/category?productcategory=海鮮">海鮮</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>

	<script>
		// 取得導覽列元素
		const nav = document.querySelector('#main');
		// 取得導覽列元素頂端位置
		const topOfNav = nav.offsetTop;

		function fixNav() {
			// 如果觀景窗頂部位置值大於導覽列頂部就沾黏，反之取消沾黏
			if (window.scrollY >= topOfNav) {
				document.body.style.paddingTop = nav.offsetHeight + 'px';
				document.body.classList.add('fixed-nav');
			} else {
				document.body.style.paddingTop = 0;
				document.body.classList.remove('fixed-nav');
			}
		}

		// 監聽滾動事件
		window.addEventListener('scroll', fixNav);
	</script>

</body>
</html>