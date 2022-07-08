<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/navbarRecipe.jsp" />
  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>新增食譜</title>
<!--   <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
<!--   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!--   <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
div.background{
/* 	background: gray url("https://i.pinimg.com/originals/d3/6d/46/d36d462db827833805497d9ea78a1343.jpg") scroll no-repeat center / 100% 100%; */
 	background: gray url("/foodmarket/img/writeRecipeBackGroundHD1.jpg") scroll no-repeat center / 100% 100%; 
	background-attachment: fixed
	}
div #pullinup{
	background-color:rgba(128, 128, 128, 0.199) ;
	border:dotted 5px ;
	text-align:center;
    width: 80%;
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
<div class="background">
<div class="container">
<div id="pullinup"><h2>新增封面照請拖曳至此</h2></div>
	<div class="row justify-content-center">
		<div class="col-9">
 		 
			<div class="card">
  				
 				<div class="card-body">
  
  					<form:form id="myform" class="form" method="post" action="${contextRoot}/postRecipe" modelAttribute="recipe">
  
  						<div class="form-group">
  						
 						<form:input path="customerId" class="form-control" value="${customerId}" type="hidden"/><br/>
 						食譜標題:<form:input path="postTitle" class="form-control"/><br/>
 						食譜封面圖: (拖曳放入頁面即可，要更換則再次拖入)<form:input path="postImage" class="form-control" id="pullintext"  readonly="true" value=""/><br/>
 							<div id="show" ><img src="" id="showdivimg" style="width: 400px;"></div>
						食譜種類:<form:select path="recipeType" class="form-control"> 						
							<form:option value="NONE" label="--- 請選擇 ---"/>
							<form:option value="西餐" label="西餐"/>
							<form:option value="早午餐" label="早午餐"/>
							<form:option value="麵包" label="麵包"/>
							<form:option value="糕點" label="糕點"/>
							<form:option value="泰式料理" label="泰式料理"/>
							<form:option value="美式料理" label="美式料理"/>
							<form:option value="日式料理" label="日式料理"/>
							<form:option value="台式料理" label="台式料理"/>
							<form:option value="懶人料理" label="懶人料理"/>
							<form:option value="義大利料理" label="義大利料理"/>
 						</form:select><br>

 						份量:<form:input path="serving" class="form-control" placeholder="請輸入數字"/><br/>
 						所需食材:<form:input path="ingredients" class="form-control"/><br/>
 						食譜標籤:<form:input path="postTag" class="form-control"/><br/>
 						烹飪時間:<form:input path="cookTime" class="form-control" placeholder="ex:40分鐘"/><br/>
 						食譜內文:<form:input id="catchSummernote" path="postText" class="form-control" readonly="true" type="hidden"/><br/>
 						<div id="summernote"></div>
 						<form:input path="postLikeTime" class="form-control" value="0" type="hidden"/>
 						
 						
 						
 						
 						
  						
  						</div>
  
  
  
 					</form:form>
    				
    				
    				<button class="btn btn-primary" id="submitbtn" type="submit" form="myform">新增食譜</button>
  				</div>
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
  const finAddRecipe = document.querySelector('#submitbtn');
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
	  });
  dropzone.addEventListener('drop', event => {
	    event.preventDefault();
	    
	    dropzone.removeAttribute("display")
	    dropzone.style.display='none';

	    const file = event.dataTransfer.files[0];
	    const reader = new FileReader();
	    reader.readAsDataURL(file);

	    reader.addEventListener('loadend', () => {
		      const img = document.querySelector('#showdivimg');
		      img.src='';
		      img.src = reader.result;
		      textareashow.value='';
		      textareashow.value=reader.result;
		      textareashow.type='hidden';
		      console.log(img)
	    });
	  });
	

	
  $(document).ready(function() {
	// onChange callback
	  $('#summernote').summernote({
		  height: 300,
		  placeholder: '<h2>請在此處輸入:</h2><br><h3>食材用量<br>食譜內文<br></h3>',
		  callbacks: {
	      onChange: function(contents, $editable) {
	        console.log('onChange:', contents, $editable);
	        const insertvalue2 = document.querySelector('#catchSummernote');
	        insertvalue2.value=contents;
	      }
	    }
	  });

	  // summernote.change
	  $('#summernote').on('summernote.change', function(we, contents, $editable) {
	    console.log('summernote\'s content is changed.');
	  });
	});
</script>
</body>
</html>