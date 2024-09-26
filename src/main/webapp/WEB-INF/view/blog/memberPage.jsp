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
<title>個人頁面</title>
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
div.container{
		margin:10px auto;
		text-align:center;
}
</style>
</head>
<body>
<div class="background">
<div class="container">
			
	<div class="titleline">
		<h3 style="text-align:center;background-color: mediumseagreen" >您撰寫的食譜</h3>
	</div>
	<div class="row justify-content-center" style="background-color:antiquewhite;">
		<table class="table" style="margin:20px;">
		<thead  class="table-dark">
			<tr><th>食譜分類<th>食譜標題<th>食譜標籤<th>收藏人數<th>烹飪時間<th>份量<th>功能列表</tr>
		</thead>
			<c:forEach var="yourrecipe" items="${yourrecipe.content}">
			<tbody>
			<tr>
			<td ><c:out value="${yourrecipe.recipeType}" />
			<td ><a href="${contextRoot}/recipe/showRecipe?recipePostId=${yourrecipe.recipePostId}"><c:out value="${yourrecipe.postTitle}" /></a>
			<td ><c:out value="${yourrecipe.postTag}" />
			<td ><c:out value="${yourrecipe.postLikeTime}" />
			<td ><c:out value="${yourrecipe.cookTime}" />
			<td ><c:out value="${yourrecipe.serving}" />
			<td>
				<a href="${contextRoot}/recipe/editRecipe?recipePostId=${yourrecipe.recipePostId}"><button class="btn btn-info">編輯</button></a>
        		<a onclick="return confirm('真的要刪除嗎')"  href="${contextRoot}/recipe/deleteOwnRecipe?recipePostId=${yourrecipe.recipePostId}"><button class="btn btn-danger">刪除</button></a>
			</td>
			</tr>
			</tbody>   	
		</c:forEach>
		</table>
	</div>		
<br>
	<div class="row justify-content-center">
  		<div class="col-9">
	<div class="titleline">
		<h3 style="text-align:center;background-color: mediumseagreen">您收藏的食譜</h3>
	</div>
			<div class="row row-cols-1 row-cols-md-3 g-4">
  			<c:forEach var="recipe" items="${page.content}">
  				<div class="col">
    				<div class="card h-100" style="margin:10px 0px;" id="${recipe.recipePostId}">
      				<a href="${contextRoot}/recipe/showHouseRecipe?recipePostId=${recipe.recipePostId}"><img src="${recipe.postImage}" class="card-img-top" alt="recipeImg"  height="175px"></a>
        			<div class="card-body">
        				<h5 class="card-title"><a href="${contextRoot}/recipe/showHouseRecipe?recipePostId=${recipe.recipePostId}"><c:out value="${recipe.postTitle}" /></a></h5>
        					<p class="card-text">分類:<c:out value="${recipe.recipeType}" /></p>
        					<p> <button id="timebutton" class="btn btn-info" disabled="disabled">⌚ ${recipe.cookTime} </button>
        						<button id="likebutton" class="btn btn-info" disabled="disabled">♥  ${recipe.postLikeTime}</button>
       						</p>
      					</div>
      				</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>


</div>
</div>
  <br><br><br>

</body>
</html>