<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <jsp:include page="../layout/navbar.jsp" /> --%>
<jsp:include page="../layout/adminNavbar.jsp" />
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
	<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-15">
					<br>
					<h1 style="text-align: center">所有常見問題</h1>
					<br>
					<div class="col-15" style="font-size:18px">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col" style="text-align: center">問題類別</th>
									<th scope="col" style="text-align: center">常見問題</th>
									<th scope="col" style="text-align: center">問題回答</th>
									<th scope="col" style="text-align: center">修改</th>
									<th scope="col" style="text-align: center">刪除</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="Question" items="${pageQuestion.content}">
									<tr>
										<th scope="row" style="text-align: center"><c:out
												value="${Question.questionCategory}" /></th>
										<td style="max-width: 300px"><c:out
												value="${Question.questionTitle}" /></td>
										<td style="max-width: 300px"><c:out
												value="${Question.answer}" /></td>
										<td><a
											href="${contextRoot}/question/editQuestion?id=${Question.id}"><button
													class="btn btn-warning">修改</button></a></td>
										<td><a onclick="return confirm('真的要刪除嗎')"
											href="${contextRoot}/question/deleteQuestion?id=${Question.id}"><button
													class="btn btn-danger">刪除</button></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				</div>
				</div>
				<div
					class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
					<div class="container-fluid">

						<div class="row justify-content-center">

							<div class="col-9">
								<c:forEach var="pageNumber" begin="1"
									end="${pageQuestion.totalPages}">
									<c:choose>
										<c:when test="${pageQuestion.number != pageNumber-1}">
											<a
												href="${contextRoot}/question/viewAllQuestion?p=${pageNumber}"><c:out
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
					</div>
					</div>
</body>
</html>