<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" >
<title>重新發送驗證信</title>
<script>window.verifyCallback = verifyCallback;</script>
</head>
<body>

<c:if test="${error} != null">
alert(${error});
</c:if>

<form class="form" method="post" action="${contextRoot}/authMailReSend" onsubmit="return(checkRobot())">
<div class="container mt-5">
<h2 class="form-row justify-content-center">重新發送驗證信</h2>

<div class="form-row justify-content-center mt-2">
	
    
    <div class="form-group col-md-5">
      <label for="mail">請輸入電子信箱</label>
      <span id="emailcheck" class="badge badge-secondary badge-danger"></span>
      <span id="emailmsg" class="badge badge-secondary badge-danger"></span>
      <input type="text" class="form-control" id="mail" placeholder="email@example.com" name="mail" required autocomplete="on">
    </div>
    
     <div class="w-100"></div>
    
    <small id="readme" class="form-text text-muted ">點擊送出後請在三天內至信箱進行驗證，本站所提供之服務需經驗正後方可正式開通</small>
</div>

<div class="form-row justify-content-center mt-4">
 <div
    class="g-recaptcha btn-sm"
    data-sitekey="6Le9B3QgAAAAAHgp8DNKlx4U_A58N6IfMu6GqjER"
    data-theme="light" data-size="normal"
    data-callback="verifyCallback">
</div>

<div class="w-100"></div>

<button type="submit" class="btn btn-outline-primary col-md-3 mt-4" id="submit">送出</button></div>

</div>
</form>


<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script type="text/javascript">
	
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
}

$('#mail').blur(function(){
	var mailInput = $('#mail').val();
	var pattern = /^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,4})*$/;

		if (mailInput == "") {
			$('#emailcheck')[0].innerHTML=''
			$('#submit').attr("disabled", true);
			$('#emailmsg')[0].innerHTML='請輸入信箱'
		} 
		
		if (!pattern.test(mailInput)) {
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
						$('#emailmsg')[0].innerHTML=''
						$('#submit').attr("disabled", false);
						$('#emailcheck')[0].innerHTML=''
					} 
					if(data=='N'){
						$('#emailmsg')[0].innerHTML=''
						$('#submit').attr("disabled", true);
						$('#emailcheck')[0].innerHTML='此帳號不存在'
					}
				},
				error: function(e){
					console.log(e);
				}
			})	
		}	
});

</script>
</body>
</html>