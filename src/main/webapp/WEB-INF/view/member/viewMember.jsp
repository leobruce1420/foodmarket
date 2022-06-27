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
<title>會員總覽</title>
<style type="text/css">
tr{font-size: 1.2rem;}
th{font-size: 1rem;}
td{font-size: 1rem;}
</style>
</head>
<body>	

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mt-4">
 <h1 class="h2">會員總覽</h1>
</main>

<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
 <div class="container-fluid">
 	 <div class="row justify-content-center">	
 	<table >
		<tr style="background-color:rgb(184, 195, 205)">
		<th>編號<th>頭像<th>姓名<th>性別<th>手機<th>信箱<th>生日<th>論壇狀態<th>修改<th>刪除
		<c:forEach var="m" items="${page.content}">
		
			<tr id="${m.customerId}"><td class="px-3">${m.customerId}
			
			<c:choose>
    			<c:when test="${m.imgFile != null}">
        	  		<td class="col-1"><img alt="your image" src= "data:image/${m.imgType};base64,${m.imgFile}" width="40" height="40" />
    			</c:when>
    			<c:otherwise>
         	  		<td class="col-1"><img alt="your image" src="${contextRoot}/img/member01.png" width="40" height="40" />	
    			</c:otherwise>
			</c:choose>
			
			<td class="col-3"><a href="#">${m.customerName}</a>
			
			<td class="px-3">
				<c:choose>
					<c:when test="${m.gender == 'female'}">女</c:when>
					<c:otherwise>男</c:otherwise>
				</c:choose>
			
			<td >${m.mobile}
			<td class="col-4">${m.mail}
			<td class="col-5">${m.birthday}
			
			<c:choose>
    			<c:when test="${m.banned == 'false'}">
        	  		<td class="col-1"><button type="button" class="btn btn-success" id="unban">正常</button>
    			</c:when>
    			<c:otherwise>
    				<td class="col-1"><button type="button" class="btn btn-danger" id="ban">禁言</button>
    			</c:otherwise>
			</c:choose>
			
<%-- 			<td><input type="button" value="修改" onclick="location.href='${contextRoot}/updateById/${customer.customerId}'"> --%>
			<td class="col-1"><input type="button" value="修改">
			<td class="col-1"><input type="button" value="刪除" onclick="checkDelete(${m.customerId})">
		</c:forEach>
	</table>
	
<!-- 	頁數顯示 -->
<div class="w-100"></div>
	<nav aria-label="Page navigation example">
  		<ul class="pagination">
  		 
  		 <c:choose>
			<c:when test="${page.number == 0}">
			<li class="page-item disabled">
			 	<a class="page-link" href="#" aria-label="Previous">
        		<span aria-hidden="true">&laquo;</span>
      			</a>
      		</li>
			</c:when>
			
			<c:otherwise>
			<li class="page-item">
			 	<a class="page-link" href="${contextRoot}/member/findAll?p=${page.number+1 -1}" aria-label="Previous">
        		<span aria-hidden="true">&laquo;</span>
      			</a>
      		</li>
			</c:otherwise>		
		</c:choose>

    	
  		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   		<c:choose>
   		
			<c:when test="${pageNumber == page.number+1}">
			 <li class="page-item disabled"><a class="page-link" href="${contextRoot}/member/findAll?p=${pageNumber}"><c:out value="${pageNumber}" /></a></li>
			</c:when>
			
			<c:otherwise>
			<li class="page-item"><a class="page-link" href="${contextRoot}/member/findAll?p=${pageNumber}"><c:out value="${pageNumber}" /></a></li>
			</c:otherwise>
			
		</c:choose>
   		</c:forEach>
   		
   		<c:choose>
			<c:when test="${page.number == page.totalPages-1}">
			 <li class="page-item disabled">
     		 	<a class="page-link" href="#" aria-label="Next">
        	 	<span aria-hidden="true">&raquo;</span>
      		 	</a>
    		 </li>
			</c:when>
			
			<c:otherwise>
			<li class="page-item">
     		 	<a class="page-link" href="${contextRoot}/member/findAll?p=${page.number +2}" aria-label="Next">
        	 	<span aria-hidden="true">&raquo;</span>
      		 	</a>
    		</li>
			</c:otherwise>		
		</c:choose>
    
  </ul>
</nav>
<!-- =========================================================================================================================== -->
 </div>
 </div>	
</div>

<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

function deleteOne(id) {
    
    $.ajax({
      type: "post"
      , url: "http://localhost:8080/foodmarket/member/delete"
      , data: { id: id }
      , async: false
      , success: function(res){
    	  $('#'+id).remove();
      }
    });
  }

function checkDelete(customerId){
	var check = confirm('確定要刪除嗎？');
	if (check) {
		deleteOne(customerId)
	}else{	
	}
}

</script>

</body>
</html>
