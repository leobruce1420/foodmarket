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

	<br>
	<h1 style="text-align: center">常見問題</h1>
	<br>
	<div class="container">
		<div style="text-align: center">
			<input id="myQuestion">
			<button id="submitBtn">查詢</button>
		</div>
			<br/>
		<div>
			<div id="insertData"></div>
		</div>
	</div>
	<div class="container" id="removeData">
		<div class="row justify-content-center">
			<div class="col-9">
				<div class="card" id="allQuestion">
					<div class="card-header">會員申請</div>
					<div class="card-body" >
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
				<div class="card" id="allQuestion">
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
				<div class="card" id="allQuestion">
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
				
				<div class="card" id="allQuestion">
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
	<script type="text/javascript">
		var coll = document.getElementsByClassName("collapsible");
		var i;
		var result;
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
		
		$(document).ready(function() {
			$('#submitBtn').click(function() {
				var inputTitle = document.getElementById('myQuestion').value;
				$.ajax({
					url : 'http://localhost:8080/foodmarket/json/postQuestion',
					method : 'post',
					contentType : 'application/json',
					dataType : 'json',
					data : inputTitle,
					success : function(result) {
						$("#removeData").remove()
						console.log(result)
						qus_data = '<div class="container" id="removeData">'+'<div class="row justify-content-center">'+'<div class="col-9">' + '<div class="card">' + '<div class="card-header">搜尋結果</div>' + '<div class="card-body">'
						$.each(result, function(index, value) {
							qus_data += '<button type="button" class="collapsible">'
							qus_data += value.questionTitle
							qus_data += '</button>'	
							qus_data += '<br>'
							qus_data += '<div>'
							qus_data += '<div style="display: flex; align-items: center;height: 50px;">'
							qus_data +=  value.answer
							qus_data += '</div>'
							qus_data += '</div>'
						})
						console.log(qus_data)
						$('#insertData').append(qus_data)
					}	
				})
			})
		})
	</script>
</body>
</html>