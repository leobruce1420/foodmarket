<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../layout/adminNavbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div.backstage{
	margin-left:20%;
	margin-right:5%;
	}
	*{
	padding:0;
	margin:0;
	}
	table{
		align-content: center;
		text-align:center;
		line-height: 10x ;
		}
	.pagenumber{
	align-content: center;
		text-align:center;
	}
</style>
<script type="text/javascript">
(function(document) {
	  // 建立 LightTableFilter
	  var LightTableFilter = (function(Arr) {
	    var _input;
	    // 資料輸入事件處理函數
	    function _onInputEvent(e) {
	      _input = e.target;
	      var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
	      Arr.forEach.call(tables, function(table) {
	        Arr.forEach.call(table.tBodies, function(tbody) {
	          Arr.forEach.call(tbody.rows, _filter);
	        });
	      });
	    }
	    // 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
	    function _filter(row) {
	      var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
	      row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
	    }
	    return {
	      // 初始化函數
	      init: function() {
	        var inputs = document.getElementsByClassName('light-table-filter');
	        Arr.forEach.call(inputs, function(input) {
	          input.oninput = _onInputEvent;
	        });
	      }
	    };
	  })(Array.prototype);

	  // 網頁載入完成後，啟動 LightTableFilter
	  document.addEventListener('readystatechange', function() {
	    if (document.readyState === 'complete') {
	      LightTableFilter.init();
	    }
	  });
	})(document);
</script>

</head>
<body>
<br/>

<div>
<h2>管理者介面CRUD</h2>
<div class="backstage">
<%-- <a href="${contextRoot}/recipe/manageradd"><button type="button" class="btn btn-primary btn-lg">新增食譜</button></a> --%>
搜尋：<input type="search" class="light-table-filter" data-table="table" placeholder="請輸入關鍵字"><br>
	<br><table class="table">
		<thead  class="table-dark">
			<tr><th>食譜Id<th>使用者Id<th>食譜分類<th>食譜標題<th>食譜標籤<th>收藏人數<th>烹飪時間<th>份量<th>創建時間<th>功能列表</tr>
		</thead>	
		<c:forEach var="recipe" items="${page.content}">
			<tbody>
			<tr>
			<td ><c:out value="${recipe.recipePostId}" />
			<td ><c:out value="${recipe.customerId}" />
			<td ><c:out value="${recipe.recipeType}" />
			<td ><a href="${contextRoot}/recipe/showRecipe?recipePostId=${recipe.recipePostId}"><c:out value="${recipe.postTitle}" /></a>
			<td ><c:out value="${recipe.postTag}" />
			<td ><c:out value="${recipe.postLikeTime}" />
			<td ><c:out value="${recipe.cookTime}" />
			<td ><c:out value="${recipe.serving}" />
			<td ><fmt:formatDate pattern="yyyy 年 MM 月 dd 日 hh:mm:ss a EEEE" value="${recipe.modifiedDate}" />
			<td>
				<a href="${contextRoot}/recipe/backEditRecipe?recipePostId=${recipe.recipePostId}"><button class="btn btn-info">編輯</button></a>
        		<a onclick="return confirm('真的要刪除嗎')"  href="${contextRoot}/recipe/deleteRecipe?recipePostId=${recipe.recipePostId}"><button class="btn btn-danger">刪除</button></a>
			</td>
			</tr>
			</tbody>   	
		
		</c:forEach>
	</table>


 <div class="row justify-content-center">
  	<div class="col-9">
   		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   
   			<c:choose>
     			<c:when test="${page.number != pageNumber-1}">
        			<a href="${contextRoot}/recipe/backall?p=${pageNumber}" class="pagenumber"><c:out value="${pageNumber}" /></a>
     			</c:when>
   
     			<c:otherwise>
       			<c:out value="${pageNumber}" />
     			</c:otherwise>
   			</c:choose>
   
   			<c:if test="${pageNumber != page.totalPages}">
   			|
   			</c:if>
     
   		</c:forEach>
  	</div>
 </div>

</div>
</div>




</body>
</html>