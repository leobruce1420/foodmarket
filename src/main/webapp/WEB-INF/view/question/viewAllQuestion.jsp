<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <jsp:include page="../layout/navbar.jsp" /> --%>
<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<%-- <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link href="${contextRoot}/css/question.css" rel="stylesheet"> --%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br />
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-8">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th scope="col">questionCategory</th>
							<th scope="col">questionTitle</th>
							<th scope="col">answer</th>
							<th scope="col">修改</th>
							<th scope="col">刪除</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<c:forEach var="Question" items="${pageQuestion.content}">
			<div class="row justify-content-center">
				<div class="col-18">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row"><c:out value="${Question.questionCategory}" /></th>
								<td><c:out value="${Question.questionTitle}" /></td>
								<td><c:out value="${Question.answer}" /></td>
								<td><a href="${contextRoot}/question/editQuestion?id=${Question.id}"><button class="btn btn-warning">修改</button></a></td>
								<td><a onclick="return confirm('真的要刪除嗎')" href="${contextRoot}/question/deleteQuestion?id=${Question.id}"><button class="btn btn-danger">刪除</button></a></td>
<!-- 								<td> -->
<!-- 									<div> -->
<!-- 										<a -->
<%-- 											href="${contextRoot}/product/editProduct?productid=${workProduct.productid}"> --%>
<!-- 											<button class="btn btn-info">編輯</button> -->
<!-- 										</a> -->
<!-- 									</div> <br /> -->
<!-- 									<div> -->
<!-- 										<a onclick="return confirm('真的要下架嗎?')" -->
<%-- 											href="${contextRoot}/product/delete?productid=${workProduct.productid}"><button --%>
<!-- 												class="btn btn-danger" class=".check_pid">下架</button></a> -->
<!-- 									</div> -->
<!-- 								</td> -->
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</c:forEach>

		<div class="row justify-content-center">

			<div class="col-9">
				<c:forEach var="pageNumber" begin="1"
					end="${pageQuestion.totalPages}">
					<c:choose>
						<c:when test="${pageQuestion.number != pageNumber-1}">
							<a href="${contextRoot}/question/viewAllQuestion?p=${pageNumber}"><c:out
									value="${pageNumber}" /></a>
						</c:when>

						<c:otherwise>
							<c:out value="${pageNumber}" />
						</c:otherwise>

					</c:choose>

					<c:if test="${pageNumber != pageQuestion.totalPages}">
							|
							</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>