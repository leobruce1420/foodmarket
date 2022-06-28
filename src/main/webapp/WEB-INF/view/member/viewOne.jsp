<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminNavbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
</head>
<body>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mt-4">
 <h1 class="h2">${member.customerName}-會員資料</h1>
</main>

<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pb-2 mb-3 border-bottom">
 <div class="container-fluid">
<div class="container-fluid mt-3 ml-5">
<div class="row justify-content-start mt-2">
	
	<h3><span class="badge badge-secondary">編號</span>&emsp;${member.customerId}</h3>
	
	&emsp;
	<c:choose>
    	<c:when test="${member.authCheck == 'true'}">
    		  <h3><span class="badge badge-success">信箱已驗證</span></h3>
    	</c:when>
    	<c:otherwise>
    		  <h3><span class="badge badge-danger">信箱未驗證</span></h3>
    	</c:otherwise>
	</c:choose>
	
	&emsp;
	<c:choose>
    	<c:when test="${member.banned == 'false'}">
        	  <button type="button" class="btn btn-success " id="ban${member.customerId}" onclick="ban(${member.customerId})">論壇狀態：正常</button>
    	</c:when>
    	<c:otherwise>
    		  <button type="button" class="btn btn-danger" id="ban${member.customerId}" onclick="ban(${member.customerId})">論壇狀態：禁言</button>
    	</c:otherwise>
	</c:choose>
	
	<div class="w-100"></div>
	<h3><span class="badge badge-secondary">姓名</span>&emsp;${member.customerName}</h3>
	<div class="w-100"></div>
	
	<c:choose>
    	<c:when test="${member.gender == 'male'}">
       		<h3><span class="badge badge-secondary">性別</span>&emsp;男</h3>
       		<div class="w-100"></div>
    	</c:when>
    	<c:otherwise>
    		<h3><span class="badge badge-secondary">性別</span>&emsp;女</h3>
    		<div class="w-100"></div>
    	</c:otherwise>
	</c:choose>
	
	<h3><span class="badge badge-secondary">手機</span>&emsp;${member.mobile}</h3>
	<div class="w-100"></div>
	<h3><span class="badge badge-secondary">信箱</span>&emsp;${member.mail}</h3>
	<div class="w-100"></div>
	<h3><span class="badge badge-secondary">生日</span>&emsp;${member.birthday}</h3>
	<div class="w-100"></div>
	
	<c:if test="${member.adress1 != null}">
		<h3><span class="badge badge-secondary">地址1</span>&emsp;${member.adress1}</h3>
		<div class="w-100"></div>
	</c:if>
	
	<c:if test="${member.adress2 != null}">
		<h3><span class="badge badge-secondary">地址2</span>&emsp;${member.adress2}</h3>
		<div class="w-100"></div>
	</c:if>
	
	<c:if test="${member.adress3 != null}">
		<h3><span class="badge badge-secondary">地址3</span>&emsp;${member.adress3}</h3>
		<div class="w-100"></div>
	</c:if>

	 <c:choose>
    	<c:when test="${member.imgFile != null}">
    		  <h3><span class="badge badge-secondary">頭像</span>&emsp;</h3>
        	  <img id="blah" alt="your image" src= "data:image/${member.imgType};base64,${member.imgFile}" width="100" height="100" />
        	  <div class="w-100"></div>
    	</c:when>
    	<c:otherwise>
    		  <h3><span class="badge badge-secondary">頭像</span>&emsp;</h3>
         	  <img id="blah" alt="your image" src="${contextRoot}/img/member01.png" width="100" height="100" />	
         	  <div class="w-100"></div>
    	</c:otherwise>
	</c:choose>

</div>
 </div>
</div>
</div>


<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

function ban(customerId){
	$.ajax({
	      type: "post"
	      , url: "http://localhost:8080/foodmarket/member/ban"
	      , data: { id: customerId }
	      , async: false
	      , success: function(res){
	    	  
	    	  var id = '#ban'+customerId
	    	  
	    	  $(id)[0].innerHTML="論壇狀態："+res
	    	  
	    	  if(res == '正常'){
	    		  $(id).addClass("btn-success").removeClass("btn-danger");
	    	  }else{
	    		  $(id).addClass("btn-danger").removeClass("btn-success");
	    	  }
	      }
	    });
}
</script>

</body>
</html>