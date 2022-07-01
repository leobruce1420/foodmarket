<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</head>
<body>

  <div class="container">
<div id="pullinup"></div>
	<div class="row justify-content-center">
		<div class="col-9">
 		 <h1>新增食譜頁面<br>這裡是一般使用者</h1>
			<div class="card">
  				<div class="card-header" style="background-color: gold">請輸入食譜，使用者輸入data區</div>
 				<div class="card-body">
  
  					<form:form class="form" method="post" action="${contextRoot}/postRecipe" modelAttribute="recipe">
  
  						<div class="form-group">
  						
 						食譜標題:<form:input path="postTitle" class="form-control"/><br/>
 						食譜封面圖:<form:input path="postImage" class="form-control" id="pullintext"/><br/>
 							<div id="show" ></div>
						食譜種類:<form:select path="recipeType" class="form-control"> 						
							<form:option value="NONE" label="--- 請選擇 ---"/>
							<form:option value="西餐" label="西餐"/>
							<form:option value="麵包" label="麵包"/>
							<form:option value="糕點" label="糕點"/>
							<form:option value="泰式料理" label="泰式料理"/>
							<form:option value="美式料理" label="美式料理"/>
							<form:option value="日式料理" label="日式料理"/>
							<form:option value="台式快炒" label="台式快炒"/>
							<form:option value="義大利料理" label="義大利料理"/>
 						</form:select><br>

 						份量:<form:input path="serving" class="form-control" placeholder="請輸入數字"/><br/>
 						所需食材:<form:input path="ingredients" class="form-control"/><br/>
 						食譜內文:<form:input id="catchSummernote" path="postText" class="form-control" readonly="true" value="原程式碼顯示處"/><br/>
 						<div id="summernote"><p></p></div>
 						食譜標籤:<form:input path="postTag" class="form-control"/><br/>
 						烹飪時間:<form:input path="cookTime" class="form-control"/><br/>
 						<form:input path="postLikeTime" class="form-control" value="0" type="hidden"/>
  						
  						</div>
  
  						<input type="submit" name="submit" value="新增食譜">
  
 					</form:form>
<br>
<button id="edit2" class="btn btn-primary" onclick="edit2()" type="button">修改資料</button>
<button id="save2" class="btn btn-primary" onclick="save2()" type="button">儲存按鈕</button>
    
  				</div>
			</div>

		</div>

	</div>

</div>
  
  <script>
  	const edit2 = function() {
		  $('#summernote').summernote({focus: true});
		};

	const save2 = function() {
	const markup2 = $('#summernote').summernote('code');
	  $('#summernote').summernote('destroy');
	  console.log('ok');
	  console.log(markup2);
	  const insertvalue = document.querySelector('#catchSummernote');
	  insertvalue.readonly='true';
	  insertvalue.value=markup2;
	};

  	
    $(document).ready(function() {
        $('#summernote').summernote();
		
	});

        
  </script>
</body>
</html>