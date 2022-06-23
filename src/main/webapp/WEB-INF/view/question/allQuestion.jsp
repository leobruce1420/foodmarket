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
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextRoot}/css/question.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<br>
		<h1 style="text-align: center">常見問題</h1>
		<br>

<!-- 		<td><a -->
<%-- 			href="${contextRoot}/question/findByQuestionTitle?questionTitle=${Question.questionTitle}"><button --%>
<!-- 					class="btn btn-warning">修改</button></a></td> -->
		<div class="row justify-content-center">
			<div class="col-9">
				<div class="card">
					<div class="card-header">產品及服務</div>
					<div class="card-body">
						<c:forEach var="Question" items="${allqus}">
							<c:if test="${Question.questionCategory =='產品及服務'}">
								<button type="button" class="collapsible">
									<c:out value="${Question.questionTitle}" />
								</button>
								<div class="content">
									<br>
									<p>
										<c:out value="${Question.answer}" />
									</p>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<br>
				<div class="card">
					<div class="card-header">配送物流</div>
					<div class="card-body">
						<c:forEach var="Question" items="${allqus}">
							<c:if test="${Question.questionCategory =='配送物流'}">
								<button type="button" class="collapsible">
									<c:out value="${Question.questionTitle}" />
								</button>
								<div class="content">
									<br>
									<p>
										<c:out value="${Question.answer}" />
									</p>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<br>
				<div class="card">
					<div class="card-header">會員申請</div>
					<div class="card-body">
						<c:forEach var="Question" items="${allqus}">
							<c:if test="${Question.questionCategory =='會員申請'}">
								<button type="button" class="collapsible">
									<c:out value="${Question.questionTitle}" />
								</button>
								<div class="content">
									<br>
									<p>
										<c:out value="${Question.answer}" />
									</p>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<br>
				<div class="card">
					<div class="card-header">其他</div>
					<div class="card-body">
						<c:forEach var="Question" items="${allqus}">
							<c:if test="${Question.questionCategory =='其他'}">
								<button type="button" class="collapsible">
									<c:out value="${Question.questionTitle}" />
								</button>
								<div class="content">
									<br>
									<p>
										<c:out value="${Question.answer}" />
									</p>
								</div>
							</c:if>

						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var coll = document.getElementsByClassName("collapsible");
		var i;

		for (i = 0; i < coll.length; i++) {
			coll[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var content = this.nextElementSibling;
				if (content.style.display === "block") {
					content.style.display = "none";
				} else {
					content.style.display = "block";
				}
			});
		}
	</script>


</body>
</html>