<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/navbar.jsp" />
<c:set value="${pageContext.request.contextPath}" var="contextRoot"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增部落格活動</title>
<style>
fieldset{
width: 1000px;
height: 600px;
text-align: center;
margin: auto;
margin-top: 10px;
}

h2{
text-align: center;
}

form{
margin: auto;
text-align: left;
width: 600px;
}

.submit{
text-align: center;
}

</style>
</head>
<body>
	<fieldset>
		<h2>新增部落格活動</h2><br>
		<form:form method="post" action="${contextRoot}/blogad/insert"
			enctype='multipart/form-data'>

			<div class="div1">
				<label for="blogAdName" class="FormTitle">活動名稱 : </label> <input
					type="text" id="blogAdName" name="blogAdName" autocomplete="off"
					required />
			</div>

			<div>
				<img id="output" class="picture" width="450px">
			</div>


			<div class="div1">
				<label for="imgFile" class="FormTitle">圖片 : </label> <input
					type="file" onchange="loadFile(event)" name="picture" accept="image/*" required/>
			</div>

			<div class="div1">
				<label for="createDate" class="FormTitle">活動開始日期 : </label> <input
					type="date" id="date" name="beginDate" max="2022-06-10" required />
			</div>

			<div class="div1">
				<label for="endDate" class="FormTitle">活動結束日期 : </label> <input
					type="date" id="date" name="endDate" max="2022-06-10" required />
			</div>

			<div class="div1">
				<label for="remark" class="FormTitle">備註 : </label>
				<textarea id="remark" name="remark" rows="4" cols="50">
				</textarea>
			</div>

			<div class="div1">
				<label for="recipeId" class="FormTitle">食譜編號 : </label> <input
					id="recipeId" name="recipeId" autocomplete="off" required />
			</div>

			<div class="submit">
				<input type="submit" id="submit" class="btn btn-outline-info" value="確定" />
			</div>
		</form:form>
	</fieldset>
	<script>
		var loadFile = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('output');
				output.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		};
	</script>
</body>
</html>