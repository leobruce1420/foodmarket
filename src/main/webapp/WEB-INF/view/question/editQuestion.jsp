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
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-9">
				<h1>常見問題</h1>
				<div class="card">
					<div class="card-header">修改常見問題</div>
					<div class="card-body">
						<form:form class="form" method="post"
							action="${contextRoot}/question/editQuestion" modelAttribute="Question">
								<form:input path="id" type="hidden"></form:input>
							<table>
								<div class="form-group">
								<tr>
									<td><b>選擇問題分類：</b></td>
									<td><form:select path="questionCategory">
											<form:option value="-" label="-請選擇-" />
											<form:options items="${categoryList}" />
										</form:select></td>
								</tr>
							</table>
							<br>
							<div class="form-group">
								<div>修改問題：</div>
								<form:textarea path="questionTitle" class="form-control" />
							</div>
							<div class="form-group">
								<div>修改回答：</div>
								<form:textarea path="answer" class="form-control" />
							</div>
					</div>
					<input type="submit" name="submit" value="修改常見問題" />

					</form:form>
				</div>
			</div>

		</div>
	</div>
	</div>
</body>
</html>