<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
 content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
 content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">

<link rel="canonical"
 href="https://getbootstrap.com/docs/4.6/examples/dashboard/">

<link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick.css"/>
<!-- // Add the new slick-theme.css if you want the default styling -->
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick-theme.css"/>

<!-- Custom styles for this template -->
<link href="${contextRoot}/css/dashboard.css" rel="stylesheet">

<title>好食光市場</title>

<title>好食光市場後臺系統</title>

<style>
.bd-placeholder-img {
 font-size: 1.125rem;
 text-anchor: middle;
 -webkit-user-select: none;
 -moz-user-select: none;
 -ms-user-select: none;
 user-select: none;
}

@media ( min-width : 768px) {
 .bd-placeholder-img-lg {
  font-size: 3.5rem;
 }
}

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
  
  /* /搜尋欄位/ */
  form {
    margin: 15px;
  }
  input {
    outline: none;
  }
  
  input[type=search] {
    -webkit-appearance: textfield;
    -webkit-box-sizing: content-box;
    font-family: inherit;
    font-size: 100%;
  }
  input::-webkit-search-decoration,
  input::-webkit-search-cancel-button {
    display: none; 
  }
  input[type=search] {
    padding: 9px 10px 9px 25px;
    width: 45px;
    background: #ededed url(https://static.tumblr.com/ftv85bp/MIXmud4tx/search-icon.png) no-repeat 9px center;
    border: solid 1px #ccc;
    
    -webkit-border-radius: 10em;
       -moz-border-radius: 10em;
            border-radius: 10em;
    
    -webkit-transition: all .5s;
       -moz-transition: all .5s;
            transition: all .5s;
  }
  	input[type=search]:focus {
    width: 130px;
    background-color: #fff;
    border-color: #66CC75;
    
    -webkit-box-shadow: 0 0 5px rgba(109,207,246,.5);
       -moz-box-shadow: 0 0 5px rgba(109,207,246,.5);
            box-shadow: 0 0 5px rgba(109,207,246,.5);
  }
  /* /按鈕/ */
  .btn-round-2 {
    border-radius: 20px;
  }

/* /購物車數量顯示/  */
	#lblCartCount {
    font-size: 15px;
    background: #ff0000;
    color: #fff;
    padding: 0 3px;
    vertical-align: top;
    margin-left: -10px;
  } 

</style>
</head>

<body>
<!-- ==================================nav1=========================================== -->
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark sticky-top" >
  <a class="navbar-brand" href="${contextRoot}/HOME">好食光市場</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <ul class="navbar-nav mr-auto ">
       <li class="nav-item">
			<a class="navbar-brand" href="${contextRoot}/question/allQuestion">常見問題</a>
      </li>     
    </ul>
    
    <c:choose>
		<c:when test="${loginUserId != null}">
			<button class="btn btn-outline-warning my-2 my-sm-0 ml-2" type="button" onclick="location.href='${contextRoot}/lock/memberCenter/${loginUserId}'">會員中心</button>
			 <button class="btn btn-outline-warning my-2 my-sm-0 ml-2" type="button" onclick="location.href='${contextRoot}/logout'">登出</button>
		</c:when>
			
		<c:otherwise>
		 	 <button class="btn btn-outline-warning my-2 my-sm-0 ml-2" type="button" onclick="location.href='${contextRoot}/signUp'">註冊</button>
			 <button class="btn btn-outline-warning my-2 my-sm-0 ml-2" type="button" onclick="location.href='${contextRoot}/login'">登入</button>
		</c:otherwise>
	</c:choose>
  </div>
</nav>
<!-- ==================================nav1=========================================== -->

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3">
           <ul class="nav flex-column">        
          <li class="nav-item">
            <a class="nav-link" href="${contextRoot}/lock/memberCenter/${loginUserId}">
              <span data-feather="user"></span>
              會員資料
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextRoot}/memberAddress/${loginUserId}">
              <span data-feather="bookmark"></span>
              常用地址
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextRoot}/toChangePwd/${loginUserId}">
              <span data-feather="edit-3"></span>
              修改密碼
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextRoot}/lastestRecord">
              <span data-feather="shopping-cart"></span>
              訂單查詢
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextRoot}/wishList/${loginUserId}">
              <span data-feather="heart"></span>
              我的收藏
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
 </div>
 
<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${contextRoot}/js/slick.js"></script>
 <script
  src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
  crossorigin="anonymous"></script>
 <script>
  window.jQuery
    || document
      .write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
 </script>
 <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

 <script
  src="${contextRoot}/js/Chart.min.js"></script>
 <script src="${contextRoot}/js/dashboard.js"></script>
 
<script src="${contextRoot}/js/feather.min.js"></script>
<script> feather.replace()</script> 

</body>
</html>