<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
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
<body>

<!-- 之前的navProduct -->
<!--  	<div class="container"> -->
<!-- <div class="row justify-content-center"> -->

<!-- <div class="btn-group btn-group-toggle" data-toggle="buttons" style="width: 50rem;"> -->
<%--    <c:forEach var="productcategorytakeon" items="${productcategorytakeon}"> --%>
<!--   <label class="btn btn-secondary "> -->
<%--   <a class="dropdown-item list-group-item list-group-item-action list-group-item-success" href="${contextRoot}/product/category?productcategory=${productcategorytakeon.productcategoryname}"> --%>
<%--     <input type="radio" name="options" id="option1" >${productcategorytakeon.productcategoryname} --%>
<!--     </a> -->
<!--   </label> -->
<%--   </c:forEach>  --%>
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->

<nav class="navbar navbar-dark bg-dark navbar-expand-md" id="main">
      <div class="img1">
        <a class="nav-link" href="${contextRoot}/HOME"><img
          src="${contextRoot}/img/logo6.png" width="150px" class="img1"></a>
      </div>
      <div class="container">
        <div class="collapse navbar-collapse" id="navcol-1">
          <ul class="nav navbar-nav w-100 justify-content-between">
  			<c:forEach var="productcategorytakeon" items="${productcategorytakeon}">
            <li class="nav-item dropdown"><a class="nav-link"
              href="${contextRoot}/product/category?productcategory=${productcategorytakeon.productcategoryname}">${productcategorytakeon.productcategoryname}</a>
            </li>
            </c:forEach> 
          </ul>
        </div>
  
      </div>
      
      
    
    
	<a class="nav-link" data-display="static" href="${contextRoot}/lock/shopCart/all">
		<img src="${contextRoot}/img/shopcart.png">
<!-- 	 	<span class='badge badge-warning' id='lblCartCount'>  -->
	 	
<%-- 	 	<c:out value="${totalNum}"></c:out> --%>
	 
<!-- 	 	</span> -->
	</a>

      
    
    
      
      <form action="${contextRoot}/product/searchproductname" method="get">
        <input  type="search" placeholder="Search"
          aria-label="Search" id="productname" name="productname"
          autocomplete="off" required>
        <button class="btn btn-success btn-round-2" type="submit">搜尋</button>
      </form>
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