<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/adminNavbar.jsp" />
<c:set value="${pageContext.request.contextPath}" var="contextRoot"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增部落格活動</title>
</head>
<body>
<br>
<div class="container">
	<h2 class="form-row justify-content-center">新增部落格活動</h2>

	<div class="row justify-content-center">
		<form:form method="post" action="${contextRoot}/blogad/insert"
			enctype='multipart/form-data'>

			<div class="form-group">
				<label for="blogAdName" class="FormTitle">活動名稱</label> <input
					type="text" id="blogAdName" name="blogAdName" autocomplete="on"
					required class="form-control" />
			</div>

			<div class="form-group">
				<img id="output" class="picture" width="450px">
			</div>


			<div class="form-group">
				<label for="imgFile" class="FormTitle">圖片</label> <input type="file"
					onchange="loadFile(event)" name="picture" accept="image/*" required
					class="form-control-picture" />
			</div>
			<div class="form-row">
				<div class="col-6">
					<label for="createDate" class="FormTitle">活動開始日期</label> <input
						type="date" id="date" name="beginDate" max="2022-06-10" required
						class="form-control" />
				</div>

				<div class="col-6">
					<label for="endDate" class="FormTitle">活動結束日期</label> <input
						type="date" id="date" name="endDate" max="2022-06-10" required
						class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label for="recipeUrl" class="FormTitle">食譜路徑</label> <input
					id="recipeUrl" name="recipeUrl" autocomplete="off" required
					class="form-control" />
			</div>

			<div class="form-group">
				<label for="remark" class="FormTitle">備註</label>
				<textarea id="remark" name="remark" rows="4" cols="50"
					onKeyDown="checkMaxInput(this.form)"
					onKeyUp="checkMaxInput(this.form)" placeholder="輸入限制25字" required
					class="form-control">${ad.remark}</textarea>
				<br> <label for="remark" class="FormTitle">剩餘</label> <input
					readonly type=text name=remLen size=3 maxlength=3 value="">字
			</div>

			<div class="form-row">
				<div class="col-6">
					<!--  <label for="productId" class="FormTitle">商品編號 : </label> <input
					id="productId" name="productId" autocomplete="off" required /> -->
					<label for="recipeId">食譜編號</label> <select id="recipeId"
						name="recipeId" class="custom-select" required>
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
				</div>



				<div class="col-6">
					<!--  <label for="productId" class="FormTitle">商品編號 : </label> <input
					id="productId" name="productId" autocomplete="off" required /> -->
					<label for="recipeId">上架狀態</label> <select id="onboard"
						name="onboard" class="custom-select" required>
						<option value="on">on</option>
						<option value="off">off</option>
					</select>
				</div>
			</div>
				<br>
				<div class="form-row justify-content-center">
				<input type="submit" id="submit" class="btn btn-outline-info"
					value="確定" /> <input class="btn btn-outline-danger" type="button"
					name="back" value="返回" onClick="javascript:history.back()">
			</div>
		</form:form>
	</div>
</div>
<br>
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