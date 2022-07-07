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
.cssload-tetrominos {
	position: absolute;
	left: 50%;
	transform: translate(-109px, -94px);
		-o-transform: translate(-109px, -94px);
		-ms-transform: translate(-109px, -94px);
		-webkit-transform: translate(-109px, -94px);
		-moz-transform: translate(-109px, -94px);
}

.cssload-tetromino {
	width: 94px;
	height: 109px;
	position: absolute;
	transition: all ease 0.135s;
		-o-transition: all ease 0.135s;
		-ms-transition: all ease 0.135s;
		-webkit-transition: all ease 0.135s;
		-moz-transition: all ease 0.135s;
	background: url('data:image/svg+xml;utf-8,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 612 684"%3E%3Cpath fill="%23010101" d="M305.7 0L0 170.9v342.3L305.7 684 612 513.2V170.9L305.7 0z"/%3E%3Cpath fill="%23fff" d="M305.7 80.1l-233.6 131 233.6 131 234.2-131-234.2-131"/%3E%3C/svg%3E') no-repeat top center;
}

.cssload-box1 {
	animation: cssload-tetromino1 0.675s ease-out infinite;
		-o-animation: cssload-tetromino1 0.675s ease-out infinite;
		-ms-animation: cssload-tetromino1 0.675s ease-out infinite;
		-webkit-animation: cssload-tetromino1 0.675s ease-out infinite;
		-moz-animation: cssload-tetromino1 0.675s ease-out infinite;
}

.cssload-box2 {
	animation: cssload-tetromino2 0.675s ease-out infinite;
		-o-animation: cssload-tetromino2 0.675s ease-out infinite;
		-ms-animation: cssload-tetromino2 0.675s ease-out infinite;
		-webkit-animation: cssload-tetromino2 0.675s ease-out infinite;
		-moz-animation: cssload-tetromino2 0.675s ease-out infinite;
}

.cssload-box3 {
	animation: cssload-tetromino3 0.675s ease-out infinite;
		-o-animation: cssload-tetromino3 0.675s ease-out infinite;
		-ms-animation: cssload-tetromino3 0.675s ease-out infinite;
		-webkit-animation: cssload-tetromino3 0.675s ease-out infinite;
		-moz-animation: cssload-tetromino3 0.675s ease-out infinite;
	z-index: 2;
}

.cssload-box4 {
	animation: cssload-tetromino4 0.675s ease-out infinite;
		-o-animation: cssload-tetromino4 0.675s ease-out infinite;
		-ms-animation: cssload-tetromino4 0.675s ease-out infinite;
		-webkit-animation: cssload-tetromino4 0.675s ease-out infinite;
		-moz-animation: cssload-tetromino4 0.675s ease-out infinite;
}









@keyframes cssload-tetromino1 {
	0%, 40% {
		transform: translate(0, 0);
	}
	50% {
		transform: translate(47px, -26px);
	}
	60%, 100% {
		transform: translate(94px, 0);
	}
}

@-o-keyframes cssload-tetromino1 {
	0%, 40% {
		-o-transform: translate(0, 0);
	}
	50% {
		-o-transform: translate(47px, -26px);
	}
	60%, 100% {
		-o-transform: translate(94px, 0);
	}
}

@-ms-keyframes cssload-tetromino1 {
	0%, 40% {
		-ms-transform: translate(0, 0);
	}
	50% {
		-ms-transform: translate(47px, -26px);
	}
	60%, 100% {
		-ms-transform: translate(94px, 0);
	}
}

@-webkit-keyframes cssload-tetromino1 {
	0%, 40% {
		-webkit-transform: translate(0, 0);
	}
	50% {
		-webkit-transform: translate(47px, -26px);
	}
	60%, 100% {
		-webkit-transform: translate(94px, 0);
	}
}

@-moz-keyframes cssload-tetromino1 {
	0%, 40% {
		-moz-transform: translate(0, 0);
	}
	50% {
		-moz-transform: translate(47px, -26px);
	}
	60%, 100% {
		-moz-transform: translate(94px, 0);
	}
}

@keyframes cssload-tetromino2 {
	0%, 20% {
		transform: translate(94px, 0px);
	}
	40%, 100% {
		transform: translate(140px, 26px);
	}
}

@-o-keyframes cssload-tetromino2 {
	0%, 20% {
		-o-transform: translate(94px, 0px);
	}
	40%, 100% {
		-o-transform: translate(140px, 26px);
	}
}

@-ms-keyframes cssload-tetromino2 {
	0%, 20% {
		-ms-transform: translate(94px, 0px);
	}
	40%, 100% {
		-ms-transform: translate(140px, 26px);
	}
}

@-webkit-keyframes cssload-tetromino2 {
	0%, 20% {
		-webkit-transform: translate(94px, 0px);
	}
	40%, 100% {
		-webkit-transform: translate(140px, 26px);
	}
}

@-moz-keyframes cssload-tetromino2 {
	0%, 20% {
		-moz-transform: translate(94px, 0px);
	}
	40%, 100% {
		-moz-transform: translate(140px, 26px);
	}
}

@keyframes cssload-tetromino3 {
	0% {
		transform: translate(140px, 26px);
	}
	20%, 60% {
		transform: translate(94px, 53px);
	}
	90%, 100% {
		transform: translate(47px, 26px);
	}
}

@-o-keyframes cssload-tetromino3 {
	0% {
		-o-transform: translate(140px, 26px);
	}
	20%, 60% {
		-o-transform: translate(94px, 53px);
	}
	90%, 100% {
		-o-transform: translate(47px, 26px);
	}
}

@-ms-keyframes cssload-tetromino3 {
	0% {
		-ms-transform: translate(140px, 26px);
	}
	20%, 60% {
		-ms-transform: translate(94px, 53px);
	}
	90%, 100% {
		-ms-transform: translate(47px, 26px);
	}
}

@-webkit-keyframes cssload-tetromino3 {
	0% {
		-webkit-transform: translate(140px, 26px);
	}
	20%, 60% {
		-webkit-transform: translate(94px, 53px);
	}
	90%, 100% {
		-webkit-transform: translate(47px, 26px);
	}
}

@-moz-keyframes cssload-tetromino3 {
	0% {
		-moz-transform: translate(140px, 26px);
	}
	20%, 60% {
		-moz-transform: translate(94px, 53px);
	}
	90%, 100% {
		-moz-transform: translate(47px, 26px);
	}
}

@keyframes cssload-tetromino4 {
	0%, 60% {
		transform: translate(47px, 26px);
	}
	90%, 100% {
		transform: translate(0, 0);
	}
}

@-o-keyframes cssload-tetromino4 {
	0%, 60% {
		-o-transform: translate(47px, 26px);
	}
	90%, 100% {
		-o-transform: translate(0, 0);
	}
}

@-ms-keyframes cssload-tetromino4 {
	0%, 60% {
		-ms-transform: translate(47px, 26px);
	}
	90%, 100% {
		-ms-transform: translate(0, 0);
	}
}

@-webkit-keyframes cssload-tetromino4 {
	0%, 60% {
		-webkit-transform: translate(47px, 26px);
	}
	90%, 100% {
		-webkit-transform: translate(0, 0);
	}
}

@-moz-keyframes cssload-tetromino4 {
	0%, 60% {
		-moz-transform: translate(47px, 26px);
	}
	90%, 100% {
		-moz-transform: translate(0, 0);
	}
}
	div.background{
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
				<div class="cssload-tetrominos" style="margin-top:50%;">
					<div class="cssload-tetromino cssload-box1"></div>
					<div class="cssload-tetromino cssload-box2"></div>
					<div class="cssload-tetromino cssload-box3"></div>
					<div class="cssload-tetromino cssload-box4"></div>
				</div>
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
	           "productId" :22
	    },{
	     "productNumber" : 1,
	     "customerId" : cId ,
	     "productId" :33
	    },{
	     "productNumber" : 1,
	     "customerId" : cId ,
	     "productId" :44
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