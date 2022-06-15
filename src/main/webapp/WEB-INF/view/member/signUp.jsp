<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" >
<title>會員註冊</title>
</head>
<body>

<form>
<div class="container mt-5">
<h2 class="form-row justify-content-center">會員註冊</h2>

<div class="form-row justify-content-center mt-4">
	
 	<div class="form-group col-md-4">
      <label for="name">姓名</label>
      <input type="text" class="form-control" id="name" name="name">
    </div>
    
    <div class="form-group col-md-4">
      <label for="mobile">手機</label>
      <input type="text" class="form-control" id="mobile" name="mobile">
    </div>
    
    <div class="form-group col-md-8">
      <label for="mail">電子信箱</label>
      <input type="text" class="form-control" id="mail" placeholder="email@example.com" name="mail">
       <small id="emailHelp" class="form-text text-muted">此信箱將當作帳號使用</small>
    </div>
    
    <div class="form-group col-md-8">
      <label for="password">密碼</label>
      <input type="password" class="form-control" id="password" name="password">
    </div>
    
    <div class="form-group col-md-5">
      <label for="birthday">生日</label>
      <input type="date" class="form-control" id="birthday" name="birthday">
    </div>
    
     <div class="form-group col-md-3">
      <label for="gender">性別</label>
      <select id="gender" class="form-control"  name="gender">
        <option selected value="male">男</option>
        <option value="female">女</option>
      </select>
    </div>
</div>
<div class="form-row justify-content-center mt-4"><button type="submit" class="btn btn-primary  col-md-4">送出</button></div>

</div>
</form>


<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>