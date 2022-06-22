<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有部落格活動</title>
<style>
img {
	width: 50px;
}

table {
	border-collapse: collapse;
	border: 1px solid black;
}

th {
	border-collapse: collapse;
	border: 1px solid orange;
	text-align: center;
}

td {
	border-collapse: collapse;
	border: 1px solid orange;
	text-align: center;
}
</style>
</head>
<body>
	<div align="center">
		<br><h2>部落格活動資料</h2><br>
		<form:form action="${contextRoot}/blogad/queryById" method="get">
			<div class="div1">
				<label for="id" class="id">單筆活動查詢 : </label> <input type="text"
					id="id" name="id" autocomplete="off" required /><input
					type="button" value="查詢">
			</div>

		</form:form>
		<table>
			<tr style="background-color: #D68B00">
				<th>活動編號
				<th>活動名稱
				<th>活動圖片
				<th>開始時間
				<th>結束時間
				<th>備註
				<th>食譜編號
				<th>修改
				<th>刪除 <c:forEach items="${ad}" var="ad" varStatus="s">
						<tr id="${ad.blogAdId}">
							<td>${ad.blogAdId}
							<td><a href="${contextRoot}/blogad/queryById?id=${ad.blogAdId}">${ad.blogAdName}</a>
							<td><img src="data:image/*;base64, ${ad.picture}"
								alt="image" />
							<td>${ad.beginDate}
							<td>${ad.endDate}
							<td>${ad.remark}
							<td>${ad.recipeId}
							<td><a href="${contextRoot}/blogad/update?id=${ad.blogAdId}">
									<button type="button" class="btn btn-outline-info">修改</button>
							</a>
							<td><a onclick="return confirm('確定刪除?')"
								href="${contextRoot}/blogad/delete?id=${ad.blogAdId}">
									<button type="button" class="btn btn-outline-danger">刪除</button>
							</a> <c:set var="count" value="${s.count}" />
					</c:forEach>
		</table>

		<br>
		<a href="${contextRoot}/blogad/insert">
			<button type="button" class="btn btn-outline-info">新增活動</button>
		</a>
	</div>

</body>
</html>