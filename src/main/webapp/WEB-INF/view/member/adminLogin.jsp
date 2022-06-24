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

    <title>管理員登入</title>

    <!-- Bootstrap core CSS -->
    <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${contextRoot}/css/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form class="form-signin"  method="post" action="adminCheckLogin">
      <h1 class="h3 mb-3 font-weight-normal">管理員登入</h1>
      <h5><span class="badge badge-secondary badge-danger">${errors.loginFail}</span></h5>
      <label for="inputEmail" class="sr-only">Account</label>
      <input type="text" id="inputAccount" class="form-control" placeholder="Account" name="account" required autofocus>
      <h5><span class="badge badge-secondary badge-danger">${errors.mailNotImput}</span></h5>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
      <h5><span class="badge badge-secondary badge-danger">${errors.pswNotImput}</span></h5>
      <button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
    </form>
  </body>
</html>
