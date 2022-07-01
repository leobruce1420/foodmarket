<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../layout/navbar.jsp" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


</style>
</head>
<body>
 <div class="row justify-content-center">
  	<div class="col-4" style="border: solid;margin-top:10px;">
		<div id="showarea">
		輸入方塊
		</div>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function() {
	$.getJSON('${contextRoot}/recipe/forshowrecipe/${rec.recipePostId}', function(json) {		
		console.log('${rec.recipePostId}');
		console.log('${contextRoot}');
		console.log(json);
		console.log(json.postText);
		var el = document.getElementById("showarea");
		el.innerHTML = '<h1>'+json.postTitle+'</h1><br>'
					+'<img src="'+json.postImage+'" alt="recipeImg"  width="470px" height="340px" float="left">'
					+'<br><br><br><p style="border: thick double #32a1ce;padding:20px;float:left;margin-left:10px">烹飪時間: '+json.cookTime+'</p>'
					+'<p style="border: thick double #32a1ce;padding:20px;float:left;margin-left:10px">份量: '+json.serving+'人份</p>'
					+'<p style="border: thick double #32a1ce;padding:20px;float:left;margin-left:10px">烹飪時間: '+json.postLikeTime+'</p>'
					+'<br><p>食材準備:<br>'+json.ingredients+'</p><br>'
					+json.postText
	

	});
});

</script>
</body>
</html>