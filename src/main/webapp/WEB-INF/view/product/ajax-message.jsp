<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<h1>AJAX + Restful 版本</h1>

<div>
<input id ="myMessage">
<button id="submitBtn">送出</button>
</div>

<div>
 <table class="mytable" id="list_table_json">
 <thead>
   <tr>
     <th>留言內容</th>
     <th>時間</th>
   </tr>
 </thead>
 </table>
</div>



</div>

<script type="text/javascript">
$(document).ready(function(){
  $('#submitBtn').click(function(){
    var inputText = document.getElementById('myMessage').value;
    var dtoObject = {"msg" : inputText};
    var dtoJsonString= JSON.stringify(dtoObject)

   $.ajax({
     url:'http://localhost:8081/myapp/api/postMessage',
     method: 'post',
     contentType: 'application/json', // 送過去的
     dataType: 'json',
     data: dtoJsonString,
     success: function(result){
    	 $('#list_table_json tr td').remove()
        console.log(result)
        msg_data = ''
        $.each(result, function(index, value){
        	msg_data += '<tr>'
        	msg_data += '<td>' + value.text + '</td>'
        	msg_data += '<td>' + value.added + '</td>'
        	msg_data += '<tr>'
        })
        $('#list_table_json').append(msg_data)
        
     },
     error:function(err){
       console.log(err)
     }
   })

  })
})

</script>

</body>
</html>