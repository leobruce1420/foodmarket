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
<title>修改資料</title>
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

.picture{
width: 450px;
}

</style>
</head>
<body>
	<fieldset>
		<h2>修改資料</h2>
		<form:form method="post" action="${contextRoot}/blogad/update"
			enctype='multipart/form-data' modelAttribute="editAd">

			<div class="div1">
				活動編號: <input type="text" readonly name="blogAdId" required
					value="${ad.blogAdId}">
			</div>

			<div class="div1">
				<label for="blogAdName" class="FormTitle">活動名稱 : </label> <input
					type="text" id="blogAdName" name="blogAdName" autocomplete="off"
					required value="${ad.blogAdName}" />
			</div>

			<div class="">
				<label for="picture" class="FormTitle">圖片 : </label> <img
					id="output" src="data:image/*;base64, ${ad.picture}"
					class="picture" name="picture" />
			</div>

			 <!--  <div class="div1">

				<input type="file" onchange="loadFile(event)" accept="image/*"
					name="picture" />
			</div>--> 

			<div class="div1">
				<label for="beginDate" class="FormTitle">活動開始日期 : </label> <input
					type="date" id="date" name="beginDate" max="2022-06-10" required
					value="${ad.beginDate}" />
			</div>

			<div class="div1">
				<label for="endDate" class="FormTitle">活動結束日期 : </label> <input
					type="date" id="date" name="endDate" max="2022-06-10" required
					value="${ad.endDate}" />
			</div>

			<div class="div1">
				<label for="remark" class="FormTitle">備註 :</label>
				<textarea id="remark" name="remark" rows="4" cols="50" required> ${ad.remark}
				</textarea>
			</div>

			<div class="div1">
				<label for="recipeId" class="FormTitle">食譜編號 : </label> <input
					id="recipeId" name="recipeId" autocomplete="off" required
					value="${ad.recipeId}" />
			</div>

			<div class="submit">
				<input type="submit" id="submit" class="btn btn-outline-info" value="確定" />
				<input class="btn btn-outline-danger" type="button" name="back" value="返回"onClick="javascript:history.back()">
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