<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" >
<title>會員註冊</title>
<script>window.verifyCallback = verifyCallback;</script>
</head>
<body>

<form:form class="form" method="post" action="${contextRoot}/insertCustomer" modelAttribute="member" onsubmit="return(checkRobot())">
<div class="container mt-5">
<h2 class="form-row justify-content-center">會員註冊</h2>

<div class="form-row justify-content-center mt-4">
	
 	<div class="form-group col-md-4">
      <label for="customerName">姓名</label>
      <span id="namemsg" class="badge badge-secondary badge-danger"></span>
      <input type="text" class="form-control" id="customerName" name="customerName" required autocomplete="off">
    </div>
    
    <div class="form-group col-md-4">
      <label for="mobile">手機</label>
      <span id="mobilemsg" class="badge badge-secondary badge-danger"></span>
      <input type="text" class="form-control" id="mobile" name="mobile" required autocomplete="off">
    </div>
    
    <div class="form-group col-md-8">
      <label for="mail">電子信箱</label>
      <span id="emailcheck" class="badge badge-secondary badge-danger"></span>
      <span id="emailmsg" class="badge badge-secondary badge-danger"></span>
      <input type="text" class="form-control" id="mail" placeholder="email@example.com" name="mail" required autocomplete="on">
       <small id="emailHelp" class="form-text text-muted">此信箱將當作帳號使用</small>
    </div>
    
    <div class="form-group col-md-8">
      <label for="password">密碼</label>
      <span id="pswmsg" class="badge badge-secondary badge-danger"></span>
      <input type="password" class="form-control" id="password" name="password" required autocomplete="off">
    </div>
    
    <div class="form-group col-md-5">
      <label for="birthday">生日</label>
      <input type="date" class="form-control" id="birthday" name="birthday" required autocomplete="off">
    </div>
     <div class="form-group col-md-3">
      <label for="gender">性別</label>
      <select id="gender" class="form-control"  name="gender">
        <option selected value="male">男</option>
        <option value="female">女</option>
      </select>
    </div>
    <small id="readme" class="form-text text-muted ">點擊送出後請至信箱進行驗證，本站所提供之服務需經驗正後方可正式開通</small>
</div>

<div class="form-row justify-content-center mt-4">
 <div
    class="g-recaptcha btn-sm"
    data-sitekey="6Le9B3QgAAAAAHgp8DNKlx4U_A58N6IfMu6GqjER"
    data-theme="light" data-size="normal"
    data-callback="verifyCallback">
</div>
<button type="submit" class="btn btn-outline-primary col-md-3" id="submit">送出</button></div>

</div>
</form:form>


<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script type="text/javascript">
let nameChecked = false;
let mobileChecked = false;
let mailChecked = false;
let pswChecked = false;
	
// 到後端進行機器人驗證	
function verifyCallback(token) {
	$.ajax({
    type :"POST",
    url  : "checkRecaptcha",
    contentType:'application/json',
	data: JSON.stringify(grecaptcha.getResponse()),
	success: function(data){
		   if(data=='Y'){
			   console.log("ok")
			   $('#submit').attr("disabled", false);
		   } 
		   if(data=='N'){
			   $('#submit').attr("disabled", true);
		   }
	   },
	   error: function(e){
		   console.log(e);
	   }
	})
}
// 按送出時檢查是否進行過機器人驗證
function checkRobot(){
    var v = grecaptcha.getResponse();
    if(v.length == 0){
        alert('請先進行機器人驗證!!');
        return false;
    }
    
    if(nameChecked != true || mobileChecked != true || mailChecked != true || pswChecked != true){
    	alert('請先修改資料不正確之欄位!!');
        return false;
    }
}

$('#customerName').blur(function checkName(){
	var nameInput = $('#customerName').val();
	var pattern = new RegExp("^[a-zA-Z\u4E00-\u9FA5]+$");
	
	if (nameInput == "") {
		nameChecked = false;
		$('#submit').attr("disabled", true);
		$('#namemsg')[0].innerHTML='請輸入姓名'
	}
		
	if (!pattern.test(nameInput)) {
		nameChecked = false;
		$('#submit').attr("disabled", true);
		$('#namemsg')[0].innerHTML='本欄位只接受中文及英文字母'
	} else {
		nameChecked = true;
		$('#submit').attr("disabled", false);
		$('#namemsg')[0].innerHTML=''
	}
	
});

$('#mobile').blur(function(){
	var mobileInput = $('#mobile').val();
	var pattern = /^09\d{2}?\d{3}?\d{3}$/;
	
	if (mobileInput == "") {
		mobileChecked = false;
		$('#submit').attr("disabled", true);
		$('#mobilemsg')[0].innerHTML='請輸入手機'
	}
	if (!pattern.test(mobileInput)) {
		mobileChecked = false;
		$('#submit').attr("disabled", true);
		$('#mobilemsg')[0].innerHTML='請輸入09xxoooxxx格式之手機'
	} else {
		mobileChecked = true;
		$('#submit').attr("disabled", false);
		$('#mobilemsg')[0].innerHTML=''
	}
	
});

$('#mail').blur(function(){
	var mailInput = $('#mail').val();
	var pattern = /^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,4})*$/;

		if (mailInput == "") {
			mailChecked = false;
			$('#emailcheck')[0].innerHTML=''
			$('#submit').attr("disabled", true);
			$('#emailmsg')[0].innerHTML='請輸入信箱'
		} 
		
		if (!pattern.test(mailInput)) {
			mailChecked = false;
			$('#emailcheck')[0].innerHTML=''
			$('#submit').attr("disabled", true);
			$('#emailmsg')[0].innerHTML='請輸入格式正確之信箱'
		} else {
			$.ajax({
				type :"POST",
				url  : "checkMail",
				contentType:'application/text',
				data: mailInput,
				success: function(data){
					if(data=='Y'){
						mailChecked = false;
						$('#emailmsg')[0].innerHTML=''
						$('#submit').attr("disabled", true);
						$('#emailcheck')[0].innerHTML='此帳號已被註冊'
					} 
					if(data=='N'){
						mailChecked = true;
						$('#emailmsg')[0].innerHTML=''
						$('#submit').attr("disabled", false);
						$('#emailcheck')[0].innerHTML=''
					}
				},
				error: function(e){
					console.log(e);
				}
			})	
		}	
});

$('#password').blur(function(){
	var pswInput = $('#password').val();
	var pattern = new RegExp("^[1~9a-zA-Z!@#$%^&*]+$");
	
	if (pswInput == "") {
		pswChecked = false;
		$('#submit').attr("disabled", true);
		$('#pswmsg')[0].innerHTML='請輸入密碼'
	}		
	if (pswInput.length >= 6) {
		if (pattern.test(pswInput)) {
			pswChecked = true;
			$('#submit').attr("disabled", false);
			$('#pswmsg')[0].innerHTML=''
		} else {
			pswChecked = false;
			$('#submit').attr("disabled", true);
			$('#pswmsg')[0].innerHTML='本欄位只接受數字、英文字母及!@#$%^&*'
		}
	} else {
		pswChecked = false;
		$('#submit').attr("disabled", true);
		$('#pswmsg')[0].innerHTML='請輸入至少六位數之密碼'
	}
});

</script>
</body>
</html>