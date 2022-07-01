<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../foodmarket/css/all.min.css" />
<link rel="stylesheet" href="../../foodmarket/css/bootstrap.min.css" />
<link rel="stylesheet" href="../../foodmarket/css/highlight.css" />
<link rel="stylesheet" href="../../foodmarket/css/wysiwyg.css" />
<script src="../../foodmarket/js/jquery.slim.min.js"></script>
<script src="../../foodmarket/js/bootstrap.js">
</script>

<!-- OPTIONAL Highlight.js -->
<script src="../../foodmarket/js/highlight.js"></script>
<script src="../../foodmarket/js/wysiwyg.js">
$(document).ready(function(){
	
	$('#editor').wysiwyg({
		mode: 'source'
		  toolbar: [
		    ['mode'],
		    ['operations', ['undo', 'rendo', 'cut', 'copy', 'paste']],
		    ['styles'],
		    ['fonts', ['select', 'size']],
		    ['text', ['bold', 'italic', 'underline', 'strike', 'subscript', 'superscript', 'font-color', 'bg-color']],
		    ['align', ['left', 'center', 'right', 'justify']],
		    ['lists', ['unordered', 'ordered', 'indent', 'outdent']],
		    ['components', ['table', /*'chart'*/]],
		    ['intervals', ['line-height', 'letter-spacing']],
		    ['insert', ['emoji', 'link', 'image', '<a href="https://www.jqueryscript.net/tags.php?/video/">video</a>', 'symbol', /*'bookmark'*/]],
		    ['special', ['print', 'unformat', 'visual', 'clean']],
		    /*['fullscreen'],*/
		  ],
		});

	});
</script>
	

<script>




</script>
<jsp:include page="../layout/navbar.jsp" />
<style>
  *{
  padding:0;
  margin:0;
  }

  div #pullinup{
 
    border: 10px border lightgray;
    width: 80%;
    height: 40%;
    position: fixed;
  	top: 10%;
  	left: 10%;
	display:none;
  	}
  div.pullindown{
  background-color:red;
    border: 10px border lightgray;
    width: 80%;
    height: 40%;
    position: fixed;
 	top: 50%;
  	left: 10%;
 	display:none;
  	}


</style>
</head>
<body>

<textarea id="editor" class="form-control">
  content here
</textarea>

<script src="../../foodmarket/js/wysiwyg.js">

$('#editor').wysiwyg();
</script>
<script>

$('#editor').wysiwyg();

</script>
</body>
</html>