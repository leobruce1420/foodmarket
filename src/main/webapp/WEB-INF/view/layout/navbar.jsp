<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick.css"/>
<!-- // Add the new slick-theme.css if you want the default styling -->
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick-theme.css"/>
<title>Insert title here</title>

<title>好食光市場</title>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark " >
  <a class="navbar-brand" href="${contextRoot}/p">好食光市場</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <ul class="navbar-nav mr-auto ">
    
      <li class="nav-item active">
      <a class="nav-link active" href="${contextRoot}/p">管理員首頁 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          商品管理
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${contextRoot}/product/add">新增商品訊息</a>
          <a class="dropdown-item" href="${contextRoot}/product/all">所有商品訊息</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${contextRoot}/product/ajax">ajax</a>
        </div>
      </li>
<!--       <li class="nav-item dropdown"> -->
<!--         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false"> -->
<!--           會員管理 -->
<!--         </a> -->
<!--         <div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!--           <a class="dropdown-item" href="#">所有會員訊息</a> -->
<!--           <a class="dropdown-item" href="#">訊息</a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a class="dropdown-item" href="#">ajax</a> -->
<!--         </div> -->
<!--       </li> -->

		<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          廣告管理
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${contextRoot}/blogad/getAll">部落格廣告</a>
          <a class="dropdown-item" href="${contextRoot}/shopad/getAll">商城廣告</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">ajax</a>
        </div>
      </li>
      		<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          常見問題
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${contextRoot}/question/allQuestion">常見問題</a>
          <a class="dropdown-item" href="${contextRoot}/question/addQuestion">新增常見問題</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">ajax</a>
        </div>
      </li>
      <li class="nav-item dropdown">
      <a class="nav-link" href="${contextRoot}/product/all">所有商品訊息</a>
      </li>
      <li class="nav-item dropdown">
      <a class="nav-link" href="${contextRoot}/product/add">新增商品訊息</a>
    </li>
    
    
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    
    <c:choose>
		<c:when test="${loginUserId != null}">
			<button class="btn btn-outline-warning my-2 my-sm-0 ml-2" type="button" onclick="location.href='${contextRoot}/memberCenter/${loginUserId}'">會員中心</button>
			 <button class="btn btn-outline-warning my-2 my-sm-0 ml-2" type="button" onclick="location.href='${contextRoot}/logout'">登出</button>
		</c:when>
			
		<c:otherwise>
		 	 <button class="btn btn-outline-warning my-2 my-sm-0 ml-2" type="button" onclick="location.href='${contextRoot}/signUp'">註冊</button>
			 <button class="btn btn-outline-warning my-2 my-sm-0 ml-2" type="button" onclick="location.href='${contextRoot}/login'">登入</button>
		</c:otherwise>
	</c:choose>
  </div>
  
</nav>
<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/slick.js"></script>
</body>
</html>