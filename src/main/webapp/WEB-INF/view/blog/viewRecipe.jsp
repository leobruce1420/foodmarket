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
			div.background{
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
		<script type="text/javascript">
		</script>
	</head>
<body>

<div class="background">
	<div class="container">
		<div class="search">
			搜尋：<input class="searchtext" type="text" placeholder="請輸入關鍵字">
			<input id="search" type="submit" value="🔍"/>
		</div>
		<div class="row justify-content-center">
  			<div class="col-9">
			<br><h3 style="text-align:center;background-color: mediumseagreen">最新食譜:<br></h3>
				<div class="row row-cols-1 row-cols-md-3 g-4">
  				<c:forEach var="recipe" items="${page.content}">
  					<div class="col">
    					<div class="card h-100" style="margin:10px 0px;" id="${recipe.recipePostId}">
      						<a href="${contextRoot}/recipe/showRecipe?recipePostId=${recipe.recipePostId}"><img src="${recipe.postImage}" class="card-img-top" alt="recipeImg"  height="175px"></a>
      						<div class="card-body">
        						<h5 class="card-title"><a href="${contextRoot}/recipe/showRecipe?recipePostId=${recipe.recipePostId}"><c:out value="${recipe.postTitle}" /></a></h5>
        						<p class="card-text">分類:<c:out value="${recipe.recipeType}" /></p>
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
 <br>
    		<div class="col-9">
  				<br><h3 style="text-align:center;background-color: mediumseagreen">TOP 3 熱門食譜:<br></h3>
				<div class="row row-cols-1 row-cols-md-3 g-4">
  				<c:forEach var="recipe" items="${likePage.content}">
  					<div class="col">
    					<div class="card h-100" style="margin:10px 0px;" id="${recipe.recipePostId}">
      					<a href="${contextRoot}/recipe/showRecipe?recipePostId=${recipe.recipePostId}"><img src="${recipe.postImage}" class="card-img-top" alt="recipeImg"  height="175px"></a>
      						<div class="card-body">
        						<h5 class="card-title"><a href="${contextRoot}/recipe/showRecipe?recipePostId=${recipe.recipePostId}"><c:out value="${recipe.postTitle}" /></a></h5>
        						<p class="card-text">分類:<c:out value="${recipe.recipeType}" /></p>
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
  
  
  		<div class="col-9">
			<h3 style="text-align:center;background-color: mediumseagreen">想不到要煮甚麼嗎?可以用以下分類搜尋唷</h3>
  			<div class="row row-cols-1 row-cols-md-4 g-3">
  				<c:forEach var="recipeType" items="${recType.content}">
  					<div class="col">
    					<div class="card">
      						<a href="${contextRoot}/recipe/search?recipeType=${recipeType.recipeTypeTitle}"><img src="${recipeType.recipeTypeImg}" class="card-img-top" alt="recipeTypeImg" style="height: 180px"></a>
      							<div class="card-body" style="padding:5px;">
        						<h6 class="card-title" style="text-align:center"><a href="${contextRoot}/recipe/search?recipeType=${recipeType.recipeTypeTitle}">${recipeType.recipeTypeTitle}</a></h6>
      							</div>
    					</div>
  					</div>
  				</c:forEach>
			</div>
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