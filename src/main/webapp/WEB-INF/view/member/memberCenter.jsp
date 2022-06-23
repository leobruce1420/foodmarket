<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.css" rel="stylesheet"></link>
<meta charset="UTF-8">
<title>會員中心選單</title>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3">
           <ul class="nav flex-column">        
          <li class="nav-item">
            <a class="nav-link" href="${contextRoot}/memberCenter/${loginUserId}">
              <span data-feather="user"></span>
              會員資料
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextRoot}/memberAddress/${loginUserId}">
              <span data-feather="bookmark"></span>
              常用地址
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextRoot}/toChangePwd/${loginUserId}">
              <span data-feather="edit-3"></span>
              修改密碼
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextRoot}/memberShoppingList/${loginUserId}">
              <span data-feather="shopping-cart"></span>
              訂單查詢
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextRoot}/memberWishList/${loginUserId}">
              <span data-feather="heart"></span>
              我的收藏
            </a>
          </li>
        </ul>
      </div>
    </nav>

<form:form class="form" method="post" action="${contextRoot}/updateCustomer" modelAttribute="member" enctype='multipart/form-data'>
<div class="container-fluid mt-3 ml-5">
<h2 class="form-row justify-content-start">會員資料</h2>

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
    	<c:when test="${member.gender = 'male'}">
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
	<div class="form-group col-md-5">
      <label for="img">頭像</label>
      <span id="mobilemsg" class="badge badge-secondary badge-danger"></span>
      <div class="w-100"></div>
      <c:choose>
    	<c:when test="${member.imgFile != null}">
        	  <img id="blah" alt="your image" src= "data:image/${member.imgType};base64,${member.imgFile}" width="100" height="100" />
    	</c:when>
    	<c:otherwise>
         	  <img id="blah" alt="your image" src="${contextRoot}/img/member01.png" width="100" height="100" />	
    	</c:otherwise>
	</c:choose>
	  <input type="file" name = "img" accept=".png,.jpg,.jpeg" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">	
    </div>   
<!--     圖片 -->
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

<script src="${contextRoot}/js/feather.min.js"></script>
<script> feather.replace()</script> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js"></script>

<script type="text/javascript">
let nameChecked = false;
let mobileChecked = false;

$('#customerName').blur(function checkName(){
	var nameInput = $('#customerName').val();
	var pattern = new RegExp("^[a-zA-Z\u4E00-\u9FA5]+$");
	
	if (nameInput == "") {
		nameChecked = false;
		lock()
		$('#namemsg')[0].innerHTML='請輸入姓名'
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

$('#mobile').blur(function(){
	var mobileInput = $('#mobile').val();
	var pattern = /^09\d{2}?\d{3}?\d{3}$/;
	
	if (mobileInput == "") {
		mobileChecked = false;
		lock()
		$('#mobilemsg')[0].innerHTML='請輸入手機'
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
</script>

</body>
</html>