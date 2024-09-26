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
 	background: gray url("/foodmarket/img/recipebackgroundHD1.jpg") scroll no-repeat center / 100% 100%; 
	background-attachment: fixed
	}
	div.recipe_details ul {
		background: rgb(61, 61, 61);
		display: flex;
		flex-wrap: wrap;
		margin:24px 0;
		padding: 12px 5%;
	}

	div.recipe_details ul li {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		min-width: 33%;
		padding: 24px;
		color:	#E6B800;
	}
	td.ingredients{
	min-width:350px;
	max-width:350px;
	padding:10px;
	}
</style>
</head>
<body>
<div class="background">
 <div class="row justify-content-center">
  	<div class="col-4" style="border: solid;margin-top:10px;background-color: white;">
		<div id="showarea">
			<div id="showvalue">
				輸入方塊
			</div>
		</div>
	</div>
 </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$.getJSON('${contextRoot}/recipe/forshowrecipe/${rec.recipePostId}', function(json) {		
		console.log('${rec.recipePostId}');
		console.log('${contextRoot}');
		console.log(json);
		console.log(json.postText);
		var el = document.getElementById("showvalue");
		el.innerHTML = '<h1>'+json.postTitle+'</h1><br>'
					+'<button id="likebutton" class="btn btn-info" style="display:block">♥  '+json.postLikeTime+' 把食譜加入收藏</button><br>'
// 					+'<button id="disLikeButton" class="btn btn-danger" style="display:block">♥  '+json.postLikeTime+' 移除收藏</button><br>'
					+'<img src="'+json.postImage+'" alt="recipeImg"  width="480px" height="340px" float="left">'
					+'<div class="recipe_details">'
					+'<ul><li><span>預計份量</span>'+json.serving+'</li>'
					+'<li><span>烹飪時間</span>'+json.cookTime+'</li>'
					+'<li><span>收藏人數</span>'+json.postLikeTime+'</li>'
					+'</ul></div>'
					+'<table>食材準備:<td class="ingredients">'+json.ingredients+'</td><td><input class="insertProductBtn btn btn-success" type="button" value="加入購物車" onclick="insertManyProduct(${loginUserId})"></td></table>'
					// +'<p>食材準備:<br>'+json.ingredients+' <input class="insertProductBtn btn btn-success" type="button" value="加入購物車" onclick="insertManyProduct(${loginUserId})">'
					+'<br><div class="blogText">'+json.postText+'</div><br><br><br><br>'
					+'<br><br><br><br><div style="text-align: center"><a href="${contextRoot}/recipe/all" ><p>返回食譜首頁</p></a></div>';
					
					
	  $('#likebutton').click(function(){
		   $.ajax({
		     url:'${contextRoot}/recipe/addRecipeToLike/'+json.recipePostId,
		     method: 'post',
		     contentType: 'application/json', // 送過去的
		     dataType: 'json',
		     success: function(result){
		       $('#showvalue').remove()
		        console.log("按下喜歡按鈕的"+result)
		          recipe_data = ''
		          recipe_data += '<h1>'+result.postTitle+'</h1><br>'
		          recipe_data +='<a id="likebutton" href="${contextRoot}/recipe/cancelRecipeToLike/${rec.recipePostId}" ><button id="disLikeButton" class="btn btn-danger" style="display:block">♥  '+result.postLikeTime+' 移除收藏</button></a><br>'
		          recipe_data +='<img src="'+result.postImage+'" alt="recipeImg"  width="480px" height="340px" float="left">'
		          recipe_data +='<div class="recipe_details">'
		          recipe_data +='<ul><li><span>預計份量</span>'+json.serving+'</li>'
		          recipe_data +='<li><span>烹飪時間</span>'+json.cookTime+'</li>'
		          recipe_data +='<li><span>收藏人數</span>'+json.postLikeTime+'</li>'
		          recipe_data +='</ul></div>'
		          recipe_data +='<table>食材準備:<td class="ingredients">'+json.ingredients+'</td><td><input class="insertProductBtn btn btn-success" type="button" value="加入購物車" onclick="insertManyProduct(${loginUserId})"></td></table>'
		          recipe_data += result.postText;
		          recipe_data += '<br><br><br><br><div style="text-align: center"><a href="${contextRoot}/recipe/all" ><p>返回食譜首頁</p></a></div>';

		        $('#showarea').append(recipe_data)
		     },
		   });
		  });

// 	  $('#disLikeButton').click(function(){
// 		   $.ajax({
// 		     url:'${contextRoot}/recipe/cancelRecipeToLike/'+result.recipePostId,
// // 		     url:'${contextRoot}/recipe/cancelRecipeToLike/'+json.recipePostId,
// 		     method: 'post',
// 		     contentType: 'application/json', // 送過去的
// 		     dataType: 'json',
// 		     success: function(result2){
// 		       $('#showvalue').remove()
// 		        console.log("按下討厭按鈕的"+result2)
// 		        recipe_data = '我是新資料'
// 		          recipe_data += '<h1>'+result2.postTitle+'</h1><br>'
// 		          recipe_data +='<button id="likebutton" class="btn btn-info" style="display:block">♥  '+result2.postLikeTime+' 移除收藏</button><br>'
// 		          recipe_data +='<img src="'+result2.postImage+'" alt="recipeImg"  width="470px" height="340px" float="left">'
// 		          recipe_data +='<br><br><br><p style="border: thick double #32a1ce;padding:20px;float:left;margin-left:10px">烹飪時間: '+result2.cookTime+'</p>'
// 		          recipe_data +='<p style="border: thick double #32a1ce;padding:20px;float:left;margin-left:10px">份量: '+result2.serving+'人份</p>'
// 		          recipe_data +='<p style="border: thick double #32a1ce;padding:20px;float:left;margin-left:10px">喜歡人數: '+result2.postLikeTime+'</p>'
// 		          recipe_data +='<br><br><br><br><br><p>食材準備:<br>'+result2.ingredients+'</p><br>'
// 		          recipe_data += result2.postText;
// 		        $('#showarea').append(recipe_data)
// 		     },
// 		   });
// 		  });
	  
	  
	  
	});
	
	
});






</script>
<script type="text/javascript">

function insertManyProduct(cId) {
	 if(cId!=null){
	  axios({
	  method : 'post',
	  url : '${contextRoot}/lock/shopcart/insertAll' ,
	  data : [{
	           "productNumber" : 1,
	           "customerId" : cId ,
	           "productId" :1
	    },{
	     "productNumber" : 1,
	     "customerId" : cId ,
	     "productId" :19
	    },{
	     "productNumber" : 1,
	     "customerId" : cId ,
	     "productId" :51
	    }]
	    }).then(function(res) {
	    alert("已加入購物車");
	    }) 
	    }else{
	    alert("請先登入") 
	    }
	 }
  

</script>
</body>
</html>