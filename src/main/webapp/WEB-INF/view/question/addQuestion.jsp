<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.css" rel="stylesheet">

<div class="container">
	<div class="row justify-content-center">
		<div class="col-9">
			<br>
			<h1 style="text-align: center">常見問題</h1>
			<br>
			<div class="card">
				<div class="card-header" style="font-size: 22px">新增常見問題</div>
				<div class="card-body">
					<form:form class="form" method="post"
						action="${contextRoot}/question/postQuestion"
						modelAttribute="Question">
						<table>
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
							<div>輸入問題：</div>
							<form:textarea path="questionTitle" class="form-control" />
						</div>
						<div class="form-group">
							<div>輸入回答：</div>
							<form:textarea path="answer" class="form-control" />
						</div>
						<input type="submit" name="submit" value="新增常見問題" />
					</form:form>

				</div>
			</div>

		</div>
	</div>




</div>