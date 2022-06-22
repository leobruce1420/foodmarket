<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>部落格廣告查詢</title>
<style>
*{
margin: 0px;
padding: 0px;
}
.div1 {
	width: 1000px;
	height: 600px;
	margin: auto;
	margin-top: 10px;
	text-align: center;
	border: 3px solid black;
	background-color: lightblue;
}

img{
	width: 400px;
	display:block;
	margin:auto;
}
.div2 {
	margin: auto;
	width: 300px;
	height: 250px;
	text-align: left;
}
.div3 {
	text-align: center;
}
h2{
	margin: 15px;
}
.list{
	list-style-type:none;
	font-size:130%;
}
.update{
	width:120px;
}
</style>
</head>
<body>
	<div class="div1">
		<h2>部落格廣告資料</h2>
			<img src= "data:image/*;base64, ${ad.picture}" alt="image" />
			<br>
		<div class="div2">
		<ul class="list">
			<li>活動編號:${ad.blogAdId}</li>
			<li>活動名稱:${ad.blogAdName}</li>
			<li>開始時間:${ad.beginDate}</li>
			<li>結束時間:${ad.endDate}</li>
			<li>備註  :  ${ad.remark}</li>
			<li>食譜編號:${ad.recipeId}</li>
		</ul>
		</div>
		<div class="div3"><input class="btn btn-outline-info" type="button" value="修改" onclick="location.href='${contextRoot}/blogad/update?id=${ad.blogAdId}'">
						<input class="btn btn-outline-danger" type="button" name="back" value="返回"onClick="javascript:history.back()"></div>
	</div>

</body>
</html>