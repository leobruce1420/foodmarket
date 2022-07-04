<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.col.card h-100{
	height:800px;
}
button.btn{
float:right;
}
.ad-wall{
height: 300px;
width:100%;
background-color: green;
}
 div.search{
		margin:10px auto;
		text-align:center;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<br>
<div class="ad-wall"></div>
<div class="container">
<div class="search">
搜尋：<input class="searchtext" type="text" placeholder="請輸入關鍵字">
<input id="search" type="submit" value="🔍"/>
</div>
<h5 style="text-align:center">最新食譜:<br></h5>
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
        		<p>⌚  ${recipe.cookTime} 
        			<a id="likebutton" href="${contextRoot}/recipe/addLikeTimeView/${recipe.recipePostId}#${recipe.recipePostId}" ><button id="likebutton" class="btn btn-info" style="display:block">♥  ${recipe.postLikeTime}</button></a>
       				<a id="likebutton" href="" ><button id="cancelbutton" class="btn btn-danger" style="display:none">♡  ${recipe.postLikeTime}</button></a>
       			</p>
      		</div>
    	</div>
  	</div>
    </c:forEach>
 </div> 
  <br><br><br>
  </div>
    <div class="col-9">
  <h5 style="text-align:center">TOP 3 熱門食譜:<br></h5>
<div class="row row-cols-1 row-cols-md-3 g-4">
  <c:forEach var="recipe" items="${likePage.content}">
  	<div class="col">
    	<div class="card h-100" style="margin:10px 0px;" id="${recipe.recipePostId}">
      	<a href="${contextRoot}/recipe/showRecipe?recipePostId=${recipe.recipePostId}"><img src="${recipe.postImage}" class="card-img-top" alt="recipeImg"  height="175px"></a>
      		<div class="card-body">
        		<h5 class="card-title"><a href="${contextRoot}/recipe/showRecipe?recipePostId=${recipe.recipePostId}"><c:out value="${recipe.postTitle}" /></a></h5>
        		<p class="card-text">分類:<c:out value="${recipe.recipeType}" /></p>
        		<p>⌚  ${recipe.cookTime} 
        			<a id="likebutton" href="${contextRoot}/recipe/addLikeTimeView/${recipe.recipePostId}#${recipe.recipePostId}" ><button id="likebutton" class="btn btn-info" style="display:block">♥  ${recipe.postLikeTime}</button></a>
       				<a id="likebutton" href="" ><button id="cancelbutton" class="btn btn-danger" style="display:none">♡  ${recipe.postLikeTime}</button></a>
       			</p>
      		</div>
    	</div>
  	</div>
    </c:forEach>
 </div> 
  <br><br><br>
  </div>
  
  
  	<h5>想不到要煮甚麼嗎?可以用以下分類搜尋唷</h5>
  		<div class="row row-cols-1 row-cols-md-5 g-3">
  			<c:forEach var="recipeType" items="${recType.content}">
  				<div class="col">
    				<div class="card">
      					<a href="${contextRoot}/recipe/search?recipeType=${recipeType.recipeTypeTitle}"><img src="${recipeType.recipeTypeImg}" class="card-img-top" alt="recipeTypeImg" style="height: 110px"></a>
      						<div class="card-body">
        					<h5 class="card-title"><a href="${contextRoot}/recipe/search?recipeType=${recipeType.recipeTypeTitle}">${recipeType.recipeTypeTitle}</a></h5>
      						</div>
    				</div>
  				</div>
  			</c:forEach>
		</div>
    </div>
    <br>
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