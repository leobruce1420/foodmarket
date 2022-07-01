<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
<!--   <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
<!--   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!--   <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
div #pullinup{
	background-color:rgba(128, 128, 128, 0.199) ;
	border:dotted 5px;
	text-align:center;
    width: 60%;
    height: 30%;
    position: fixed;
  	top: 10%;
  	left: 10%;
	display:none;
	z-index:100;
  	}
</style>
</head>
<body>
<div class="container">
<div id="pullinup"><h2>新增封面照請拖曳至此</h2></div>
	<div class="row justify-content-center">
		<div class="col-9">
 		 <h1>修改食譜頁面<br>這裡是管理者介面</h1>
			<div class="card">
  				<div class="card-header" style="background-color: gold">就是多了customerId能輸入啦</div>
 				<div class="card-body">
  
  					<form:form class="form" method="post" modelAttribute="rec" action="${contextRoot}/recipe/backEditRecipe">
  
  						<div class="form-group">
  						
 						新增文章使用者Id:<form:input path="customerId" class="form-control"/><br/>
 						食譜標題:<form:input path="postTitle" class="form-control"/><br/>
 						食譜封面圖:(拖曳放入頁面即可，要更換則再次拖入)<form:input path="postImage" class="form-control" id="pullintext" readonly="true" type=""/><br/>
 							<div id="show" ><img src="" id="showdivimg" style="width: 400px;"></div>
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
 						烹飪時間:<form:input path="cookTime" class="form-control"/><br/>
 						所需食材:<form:input path="ingredients" class="form-control"/><br/>
 						
 						食譜內文:<form:input id="catchSummernote" path="postText" class="form-control" readonly="true"/><br/>
 						<div id="summernote"><h1>重新編輯文章</h1></div>
 						食譜標籤:<form:input path="postTag" class="form-control"/><br/>
 						<form:input path="postLikeTime" class="form-control" type="hidden"/>
 						<form:input path="recipePostId" class="form-control" type="hidden"/>
 						<form:input path="modifiedDate" class="form-control" type="hidden"/>
  						</div>
  						<input type="submit" name="submit" value="修改食譜">
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
  const dropzone = document.querySelector('#pullinup');
  const dropzoneListener = document.querySelector('body');
  const textareashow = document.querySelector('#pullintext');
  const showdiv = document.querySelector('#show');
  const img = document.querySelector('#showdivimg');
  const imgbeforesrc = img.src;
  const insertvalue = document.querySelector('#catchSummernote');
  dropzoneListener.addEventListener('dragenter', event => {
	    event.preventDefault();
	    console.log('catch zone');
	    dropzone.removeAttribute('display');
	    dropzone.style.display='block';
	  });

  dropzoneListener.addEventListener('dragleave', event => {
	    event.preventDefault();
	    
	  });
  dropzoneListener.addEventListener('dragover', event => {
	    event.preventDefault();
	  });
  dropzoneListener.addEventListener('drop', event => {
	    event.preventDefault();
	    
	    dropzone.removeAttribute("display")
	    dropzone.style.display='none';
	    textareashow.value='';

	    const file = event.dataTransfer.files[0];
	    const reader = new FileReader();
	    reader.readAsDataURL(file);

	    reader.addEventListener('loadend', () => {
	      
	      img.src='';
	      img.src = reader.result;
	      textareashow.value='';
	      textareashow.value=reader.result;
	      textareashow.type='hidden';
	      
	      textareashow.display='none';
	      console.log(img)
	    });
	  });
  const edit2 = function() {
	  $('#summernote').summernote({focus: true});
	};

const save2 = function() {
const markup2 = $('#summernote').summernote('code');
  $('#summernote').summernote('destroy');
  console.log('ok');
  console.log(markup2);
  insertvalue.readonly='true';
  insertvalue.value=markup2;
};



$(document).ready(function() {
  $('#summernote').summernote();
  img.src=textareashow.value;
//  console.log("原本的src:"+textareashow.value);
  
});
</script>

</body>
</html>