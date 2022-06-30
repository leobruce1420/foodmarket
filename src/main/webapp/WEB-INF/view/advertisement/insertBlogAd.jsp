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
fieldset {
	width: 800px;
	height: 750px;
	margin: auto;
	margin-top: 10px;
	text-align: center;
	
}

h2 {
	text-align: center;
}

form {
	margin: auto;
	text-align: left;
	width: 600px;
}

.submit {
	text-align: center;
}

textarea {
	resize: none;
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
				<img id="output" class="picture" width="400px">
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
				<label for="remark" class="FormTitle">備註 :</label>
				<textarea id="remark" name="remark" rows="4" cols="50"
					onKeyDown="checkMaxInput(this.form)"
					onKeyUp="checkMaxInput(this.form)" placeholder="輸入限制25字" 
					required>${ad.remark}</textarea>
				<br> <label for="remark" class="FormTitle">剩餘 : </label> <input
					readonly type=text name=remLen size=3 maxlength=3 value="">字
			</div>
			
			<div class="div1">
				<!--  <label for="productId" class="FormTitle">商品編號 : </label> <input
					id="productId" name="productId" autocomplete="off" required /> -->
					<label for="recipeId">食譜編號 : </label> <select id="recipeId" name="recipeId">
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
			</div>

			<div class="div1">
				<label for="recipeUrl" class="FormTitle">食譜路徑 : </label> <input
					id="recipeUrl" name="recipeUrl" autocomplete="off" required />
			</div>
			
			<div class="div1">
				<!--  <label for="productId" class="FormTitle">商品編號 : </label> <input
					id="productId" name="productId" autocomplete="off" required /> -->
					<label for="recipeId">上架狀態 : </label> <select id="onboard" name="onboard">
					<option value="on">on</option>
					<option value="off">off</option>
				</select>
			</div>
			
			<div class="submit">
				<input type="submit" id="submit" class="btn btn-outline-info" value="確定" />
				<input class="btn btn-outline-danger" type="button"
					name="back" value="返回" onClick="javascript:history.back()">
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
		
		maxLen = 25; // 字數頂限

		function checkMaxInput(form) {
			if (form.remark.value.length > maxLen) // if too long.... trim it!
				form.remark.value = form.remark.value.substring(0, maxLen);
			// otherwise, update 'characters left' counter
			else
				form.remLen.value = maxLen - form.remark.value.length;
		}
		//
		
	</script>
</body>
</html>