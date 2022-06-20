<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark " >
  <a class="navbar-brand" href="${contextRoot}/p">管理員</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <ul class="navbar-nav mr-auto">
    
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
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          會員管理
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">所有會員訊息</a>
          <a class="dropdown-item" href="#">訊息</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">ajax</a>
        </div>
      </li>
      <li class="nav-item dropdown">
      <a class="nav-link" href="#">所有商品訊息</a>
      </li>
      <li class="nav-item dropdown">
      <a class="nav-link" href="#">ajax</a>
    </li>
    
    
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    
    <c:choose>
		<c:when test="${loginUserId != null}">
			你好，${loginUserName}&emsp;
			 <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${contextRoot}/logout'">登出</button>
		</c:when>
			
		<c:otherwise>
		 	 <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${contextRoot}/signUp'">註冊</button>
			 <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${contextRoot}/login'">登入</button>
		</c:otherwise>
	</c:choose>
  </div>
  
</nav>
<div class="row justify-content-center">
<div  class="btn-group btn-group-lg" role="group" aria-label="Basic example" style="width: 50rem;">
  <button type="button" class="btn btn-secondary">蔬菜類</button>
  <button type="button" class="btn btn-secondary">水果類</button>
  <button type="button" class="btn btn-secondary">肉品</button>
  <button type="button" class="btn btn-secondary">海鮮</button>
</div>
</div>
<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

</body>
</html>