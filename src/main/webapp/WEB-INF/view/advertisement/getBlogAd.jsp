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
/* .div1 { */
/* 	width: 800px; */
/* 	height: 700px; */
/* 	margin: auto; */
/* 	margin-top: 10px; */
/* 	text-align: center; */
/* 	border: 3px solid black; */
/* 	background-color: lightblue; */
/* 	border-radius: 20px; */
/* } */

img{ 
width: 400px; 
display:block; 
margin:auto; 
} 
/* .div2 { */
/* 	margin: auto; */
/* 	width: 300px; */
/* 	height: 250px; */
/* 	text-align: left; */
/* } */
.div3 {
text-align: center;
} 
h2{ 
	text-align: center;
	margin: 15px;
/} 
/* .list{ */
/* 	list-style-type:none; */
/* 	font-size:130%; */
/* } */
/* .update{ */
/* 	width:120px; */
/* } */

table{
  width: 100%;
  border-collapse: collapse;
}

table tr{
  border-bottom: solid 2px white;
}

table tr:last-child{
  border-bottom: none;
}

table th{
  position: relative;
  width: 30%;
  background-color: #7d7d7d;
  color: white;
  text-align: center;
  padding: 10px 0;
}

table th:after{
  display: block;
  content: "";
  width: 0px;
  height: 0px;
  position: absolute;
  top:calc(50% - 10px);
  right:-10px;
  border-left: 10px solid #7d7d7d;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
}

table td{
  text-align: left;
  width: 70%;
  text-align: center;
  background-color: #eee;
  padding: 10px 0;
}

.div1 {
  margin: 20px auto;
  item-align: center;
  width: 60%;
}

</style>
</head>
<body>
	<div class="div1">
		<h2>部落格廣告資料</h2>
			<img src= "data:image/*;base64, ${ad.picture}" alt="image" />
			<br>
		<div class="div2">
		<table class="list">
		
			<tr>
				<th>活動編號:</th>
				<td>${ad.blogAdId}</td>
			</tr>
			<tr>
				<th>活動名稱:</th>
				<td>${ad.blogAdName}</td>
			</tr>
			<tr>
				<th>開始時間:</th>
				<td>${ad.beginDate}</td>
			</tr>
			<tr>
				<th>結束時間:</th>
				<td>${ad.endDate}</td>
			</tr>
			<tr>
				<th>備註  : </th>
				<td>${ad.remark}</td>
			</tr>
			<tr>
				<th>食譜編號:</th>
				<td>${ad.recipeId}</td>
			</tr>
			<tr>
				<th>上架狀態:</th>
				<td>${ad.onboard}</td>
			</tr>
			
		</table>
		
		</div>
		<br>
		<div class="div3"><input class="btn btn-outline-info" type="button" value="修改" onclick="location.href='${contextRoot}/blogad/update?id=${ad.blogAdId}'">
						<input class="btn btn-outline-danger" type="button" name="back" value="返回"onClick="javascript:history.back()"></div>
	</div>

</body>
</html>