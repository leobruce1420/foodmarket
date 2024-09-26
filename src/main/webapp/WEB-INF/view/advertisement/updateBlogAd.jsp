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
<title>修改部落格資料</title>
</head>
<body>

	<br>
	<div class="container">
		<h2 class="form-row justify-content-center">修改部落格活動資料</h2>
		<div class="row justify-content-center">
			<form:form method="post" action="${contextRoot}/blogad/update"
				enctype='multipart/form-data' modelAttribute="editAd">

				<div class="form-group">
					<img id="output" class="picture" width="450px"
						src="data:image/*;base64, ${ad.picture}">
				</div>

				<div class="form-group">
					<label for="imgFile" class="FormTitle">更新圖片 : </label> <input
						type="file" onchange="loadFile(event)" name="picture"
						accept="image/*" />
				</div>

				<div class="form-group">
					活動編號: <input type="text" readonly name="blogAdId" required
						value="${ad.blogAdId}" class="form-control">
				</div>

				<div class="form-group">
					<label for="blogAdName" class="FormTitle">活動名稱 : </label> <input
						type="text" id="blogAdName" name="blogAdName" autocomplete="off"
						required value="${ad.blogAdName}" class="form-control" />
				</div>

				<div class="form-row">
					<div class="col-6">
						<label for="beginDate" class="FormTitle">活動開始日期 : </label> <input
							type="date" id="date" name="beginDate" max="2022-06-10" required
							value="${ad.beginDate}" class="form-control" />
					</div>

					<div class="col-6">
						<label for="endDate" class="FormTitle">活動結束日期 : </label> <input
							type="date" id="date" name="endDate" max="2022-06-10" required
							value="${ad.endDate}" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label for="remark" class="FormTitle">備註 :</label>
					<textarea id="remark" name="remark" rows="4" cols="50"
						onKeyDown="checkMaxInput(this.form)"
						onKeyUp="checkMaxInput(this.form)" maxlength="20" required
						class="form-control">${ad.remark}</textarea>
					<br> <label for="remark" class="FormTitle">剩餘 : </label> <input
						readonly type=text name=remLen size="3" maxlength="3" value="">字
				</div>

				<div class="form-group">
					<label for="recipeUrl" class="FormTitle">食譜路徑 : </label> <input
						id="recipeUrl" name="recipeUrl" autocomplete="off" required
						value="${ad.recipeUrl}" class="form-control" />
				</div>

				<div class="form-row">
					<div class="col-6">
						<label for="recipeId" class="FormTitle">食譜編號 : </label> <select
							id="recipeId" name="recipeId" class="custom-select">
							<option value="1" ${ad.recipeId == '1'? 'selected' : ''}>1</option>
							<option value="2" ${ad.recipeId == '2'? 'selected' : ''}>2</option>
						</select>
					</div>

					<div class="col-6">
						<label for="onboard" class="FormTitle">上架狀態 : </label><select
							id="onboard" name="onboard" class="custom-select">
							<option value="on" ${ad.onboard == 'on'? 'selected' : ''}>on</option>
							<option value="off" ${ad.onboard == 'off'? 'selected' : ''}>off</option>
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
			}
			reader.readAsDataURL(event.target.files[0]);
		}

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