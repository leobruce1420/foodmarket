<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/memberNavbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet"></link>
<link href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.css" rel="stylesheet"></link>
<meta charset="UTF-8">
<title>會員中心選單</title>
<style>
	#oldImg{
		margin:0px
	}
	.croppie-container .cr-boundary{
		margin:0px
	}
	
	.croppie-container .cr-slider-wrap {
    width: 75%;
    margin:0px;
	text-align:left
	}

</style>
</head>
<body>	

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
  <div
   class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
   <h1 class="h2">會員管理</h1>
  </div>
 </main>


<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pb-2 mb-3 border-bottom">
 <div class="container-fluid">
<form:form class="form" method="post" action="${contextRoot}/updateCustomer" modelAttribute="member" enctype='multipart/form-data'>
<div class="container-fluid mt-3 ml-5">
<div class="form-row justify-content-start mt-2">
	
 	<div class="form-group col-md-5">
      <label for="customerName">姓名</label>
      <span id="namemsg" class="badge badge-secondary badge-danger"></span>
      <input type="text" class="form-control" id="customerName" name="customerName" required autocomplete="off" value="${member.customerName}">
    </div>
    
    <div class="w-100"></div>
    
    <div class="form-group col-md-5">
      <label for="mobile">手機</label>
      <span id="mobilemsg" class="badge badge-secondary badge-danger"></span>
      <input type="text" class="form-control" id="mobile" name="mobile" required autocomplete="off" value="${member.mobile}">
    </div>
    
     <div class="w-100"></div>
    
    <div class="form-group col-md-5">
      <label for="mailReadOnly">電子信箱</label>
      <input type="text" class="form-control" id="mailReadOnly"  disabled value="${member.mail}">
    </div>
    
     <div class="w-100"></div>
    
    <div class="form-group col-md-3">
      <label for="birthday">生日</label>
      <input type="date" class="form-control" id="birthday" name="birthday" required autocomplete="off" value="${member.birthday}">
    </div>
    
    <c:choose>
    	<c:when test="${member.gender == 'male'}">
        	<div class="form-group col-md-2">
      			<label for="gender">性別</label>
      			<select id="gender" class="form-control"  name="gender">
        		<option selected value="male">男</option>
        		<option value="female">女</option>
      			</select>
    		</div>
    	</c:when>
    	<c:otherwise>
        	<div class="form-group col-md-2">
      			<label for="gender">性別</label>
      			<select id="gender" class="form-control"  name="gender">
        		<option value="male">男</option>
        		<option selected value="female">女</option>
      			</select>
    		</div>
    	</c:otherwise>
	</c:choose>
    
    <div class="w-100"></div>
    
<!--     圖片 -->
<!-- 	<div class="form-group col-md-8"> -->
<!--       <label for="img">頭像</label> -->
<!--       <span id="mobilemsg" class="badge badge-secondary badge-danger"></span> -->
<!--       <div class="w-100"></div> -->
<%--       <c:choose> --%>
<%--     	<c:when test="${member.imgFile != null}"> --%>
<%--         	  <img id="blah" alt="your image" src= "data:image/${member.imgType};base64,${member.imgFile}" width="200" height="200" /> --%>
<%--     	</c:when> --%>
<%--     	<c:otherwise> --%>
<%--          	  <img id="blah" alt="your image" src="${contextRoot}/img/member01.png" width="100" height="100" />	 --%>
<%--     	</c:otherwise> --%>
<%-- 	</c:choose> --%>
<!-- 	  <input type="file" name = "img" accept=".png,.jpg,.jpeg" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">	 -->
<!--     </div>    -->
<!--     圖片 -->

<!--     圖片test -->
	<div class="form-group col-md-8">
 		<label for="dbImg">頭像</label>
		<label class="btn btn-info"><input id="upload_img" style="display:none;" type="file" accept="image/*"><i class="fa fa-photo"></i> 上傳圖片</label>

		<c:choose>
    	<c:when test="${member.imgFile != null}">
    		  <div id="dbImg">
        	  <img id="blah" alt="your image" src= "data:image/${member.imgType};base64,${member.imgFile}" width="200" height="200" />
        	  </div>
    	</c:when>
    	<c:otherwise>
    		  <div id="dbImg">
         	  <img id="blah" alt="your image" src="${contextRoot}/img/member01.png" width="200" height="200" />	
         	  </div>	  
    	</c:otherwise>
		</c:choose>
		
		<div id="oldImg" style="display:none;"></div>
		<div id="newImg"></div>
		<input class="" type="Hidden" id="img" name="img" value="">
	</div>  
<!--     圖片test -->

</div>

<div class="form-row justify-content-start mt-4">
	  <input type="hidden" value="${member.customerId}" name="customerId">
      <input type="hidden" value="${member.mail}" name="mail">
      <input type="hidden" value="${member.authCheck}" name="authCheck">
      <input type="hidden" value="${member.banned}" name="banned">
      <input type="hidden" value="${member.createdDate}" name="createdDate">
<button type="submit" class="btn btn-outline-primary col-md-2 mt-4" id="submit">修改</button></div>
</div>
</form:form>
 </div>
</div>

<c:if test="${editOkMsg == '修改成功'}">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">修改成功</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        資料修改成功
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<button class="btn btn-primary" onclick="show()">show</button>
</c:if>

<script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js"></script>


<script type="text/javascript">

$(window).ready(() => {
	$('#myModal').modal('show');
})


let nameChecked = true;
let mobileChecked = true;

$('#customerName').keyup(function(){
	var nameInput = $('#customerName').val();
	var pattern = new RegExp("^[a-zA-Z\u4E00-\u9FA5]+$");
	
	if (nameInput == "") {
		nameChecked = false;
		lock()
		$('#namemsg')[0].innerHTML='請輸入姓名'
	}
	
	if(nameInput == '${member.customerName}'){
		nameChecked = true;
		lock()
		$('#namemsg')[0].innerHTML=''
	}
		
	if (!pattern.test(nameInput)) {
		nameChecked = false;
		lock()
		$('#namemsg')[0].innerHTML='本欄位只接受中文及英文字母'
	} else {
		nameChecked = true;
		lock()
		$('#namemsg')[0].innerHTML=''
	}
	
});

$('#mobile').keyup(function(){
	var mobileInput = $('#mobile').val();
	var pattern = /^09\d{2}?\d{3}?\d{3}$/;
	
	if (mobileInput == "") {
		mobileChecked = false;
		lock()
		$('#mobilemsg')[0].innerHTML='請輸入手機'
	}
	
	if(mobileInput == ${member.mobile}){
		mobileChecked = true;
		lock()
		$('#mobilemsg')[0].innerHTML=''
	}
	
	if (!pattern.test(mobileInput)) {
		mobileChecked = false;
		lock()
		$('#mobilemsg')[0].innerHTML='請輸入09xxoooxxx格式之手機'
	} else {
		mobileChecked = true;
		lock()
		$('#mobilemsg')[0].innerHTML=''
	}
	
});

function lock(){
	if(nameChecked == true && mobileChecked == true){
		$('#submit').attr("disabled", false);
	}else{
		$('#submit').attr("disabled", true);
	}
}
//	================================================================
(function($) {
	var width_crop = 200, // 圖片裁切寬度 px 值
	height_crop = 200, // 圖片裁切高度 px 值
	type_crop = "square", // 裁切形狀: square 為方形, circle 為圓形
	width_preview = 250, // 預覽區塊寬度 px 值
	height_preview = 250, // 預覽區塊高度 px 值
	compress_ratio = 0.85, // 圖片壓縮比例 0~1
	type_img = "png", // 圖檔格式 jpeg png webp
	oldImg = new Image(),
	myCrop, file, oldImgDataUrl;

	// 裁切初始參數設定
	myCrop = $("#oldImg").croppie({
	viewport: { // 裁切區塊
	width: width_crop,
	height: height_crop,
	type: type_crop
	},
	boundary: { // 預覽區塊
	width: width_preview,
	height: height_preview
	}
	});

	function readFile(input) {
	if (input.files && input.files[0]){
	file = input.files[0];
	} else {
	alert("瀏覽器不支援此功能！建議使用最新版本 Chrome");
	return;
	}

	if (file.type.indexOf("image") == 0) {
	var reader = new FileReader();

	reader.onload = function(e) {
	oldImgDataUrl = e.target.result;
	oldImg.src = oldImgDataUrl; // 載入 oldImg 取得圖片資訊
	myCrop.croppie("bind", {
	url: oldImgDataUrl
	});
	};

	reader.readAsDataURL(file);
	} else {
	alert("您上傳的不是圖檔！");
	}
	}

	function displayCropImg(src) {
		$("#img").val(src);	
	var html = "<img src='" + src + "' />";
	$("#newImg").html(html);
	}

	$("#upload_img").on("change", function() {
	$("#oldImg").show();
	$("#dbImg").hide();
	readFile(this);
	});


	$("#submit").on("click", function() {
	myCrop.croppie("result", {
	type: "canvas",
	format: type_img,
	quality: compress_ratio
	}).then(function(src) {
	displayCropImg(src);
	});
	});
	})(jQuery);
// 	================================================================


</script>

</body>
</html>