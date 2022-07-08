<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>會員登入</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form class="form-signin"  method="post" action="checkLogin">
<!--       <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
      <h1 class="h3 mb-3 font-weight-normal">會員登入</h1>
      <h5><span class="badge badge-secondary badge-danger">${errors.loginFail}</span></h5>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="mail"required autocomplete="off" autofocus value="">
      <h5><span class="badge badge-secondary badge-danger">${errors.mailNotImput}</span></h5>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required value="">
      <h5><span class="badge badge-secondary badge-danger">${errors.pswNotImput}</span></h5>
<!--       <div class="checkbox mb-3"> -->
<!--         <label> -->
<!--           <input type="checkbox" value="remember-me"> 記住帳號 -->
<!--         </label> -->
<!--       </div> -->
	  <button class="btn btn-sm btn-success btn-block" type="button" id="input">一鍵輸入</button>
      <button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
      還不是會員?<a  href="<c:url value='/signUp'/>">點我註冊</a>&emsp;&emsp;<a  href="<c:url value='/toforgotPwd'/>">忘記密碼</a>
      <p class="mt-5 mb-3 text-muted">&copy; 2022EEIT44T2</p>
    </form>
    
    <script src="${contextRoot}/js/jquery-3.6.0.js"></script>
    <script>
    	$('#input').click(function(){
    		$('#inputEmail').val('molamolaking860201@gmail.com');
    		$('#inputPassword').val('a12345');
    	})
    
    
    </script>
  </body>
</html>
