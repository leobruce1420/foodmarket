<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../layout/navbarRecipe.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
/* 	background: gray url("https://i.pinimg.com/originals/d3/6d/46/d36d462db827833805497d9ea78a1343.jpg") scroll no-repeat center / 100% 100%; */
 	background: gray url("/foodmarket/img/viewRecipebackgroundHD1.jpg") scroll no-repeat center / 100% 100%; 
	background-attachment: fixed
	}
button#timebutton{
float:left;
}
button#likebutton{
float:right;
}

 div.search{
		margin:10px auto;
		text-align:center;
}
</style>

</head>
<body>

<div class="background">
<div class="container">
<div class="search">
搜尋：<input class="searchtext" type="text" placeholder="請輸入關鍵字">
<input id="search" type="submit" value="🔍"/>
</div>
<br>

<h5 style="text-align:center">搜尋食譜:<br></h5>
<div class="row justify-content-center">
  <div class="col-9">
<div class="row row-cols-1 row-cols-md-3 g-4">
  <c:forEach var="recipe" items="${page.content}">
  	<div class="col">
    	<div class="card h-100" style="margin:10px 0px;" id="${recipe.recipePostId}">
      	<a href="${contextRoot}/recipe/showRecipe?recipePostId=${recipe.recipePostId}"><img src="${recipe.postImage}" class="card-img-top" alt="recipeImg"  height="175px"></a>
      		<div class="card-body">
        		<h5 class="card-title"><a href="${contextRoot}/recipe/showRecipe?recipePostId=${recipe.recipePostId}"><c:out value="${recipe.postTitle}" /></a></h5>
        		<p class="card-text">分類:<c:out value="${recipe.recipeType}" /></p>
<%--         		<p class="card-text">標籤:<c:out value="${recipe.postTag}" /></p> --%>
        		<p>
        			<button id="timebutton" class="btn btn-warning" style="display:block" disabled="disabled">⌚ ${recipe.cookTime} </button> 
        			<button id="likebutton" class="btn btn-warning" style="display:block" disabled="disabled">♥  ${recipe.postLikeTime}</button>
       			</p>
      		</div>
    	</div>
  	</div>
    </c:forEach>
 </div> 
  <br><br><br>
  </div>

    </div>
    <br>
</div>
</div>

<script>
const insertdata = document.querySelector('.searchtext');
const post = document.querySelector('#search');

insertdata.addEventListener('input',showValue);
function showValue(){
  console.log(this.value);
  const val = document. querySelector('.searchtext').value;
  console.log(val);
	post.onclick = function(){
	window.location.href="http://localhost:8080/foodmarket/recipe/findByTagLike?postTag="+val;
	
	};
}
</script>
</body>
</html>
