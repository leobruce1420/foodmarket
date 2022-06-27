<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/memberNavbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
<style>

 .form-control-xxx { 
     width:80%; 
     padding:15px;
     display:inline; 
 } 

</style>
</head>
<body>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
  <div
   class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
   <h1 class="h2">常用地址</h1>
  </div>
 </main>

<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-1 pb-2 mb-3 border-bottom">
 <div class="container-fluid">
<form class="form" method="post" action="${contextRoot}/editAddress">
<div class="container-fluid mt-3 ml-5">
<div class="form-row justify-content-start mt-2">
	
 	<div class="form-group col-md-10">
      <label for="add1">地址1</label>
      <span id="msg1" class="badge badge-secondary badge-danger"></span>
      <input type="text" class="form-control form-control-xxx" id="add1" name="add1" autocomplete="off" value="${member.adress1}">
      <button type="button" class="btn btn-outline-info" id="view1">顯示地圖</button>
      <div id="map1"></div>
    </div>
    
    <div class="w-100"></div>
    
    <div class="form-group col-md-10">
      <label for="add2">地址2</label>
      <span id="msg2" class="badge badge-secondary badge-danger"></span>
      <input type="text" class="form-control form-control-xxx" id="add2" name="add2" autocomplete="off" value="${member.adress2}">
   	  <button type="button" class="btn btn-outline-info" id="view2">顯示地圖</button>
   	  <div id="map2"></div>
    </div>
    
     <div class="w-100"></div>
    
    <div class="form-group col-md-10">
      <label for="add3">地址1</label>
      <span id="msg3" class="badge badge-secondary badge-danger"></span>
      <input type="text" class="form-control form-control-xxx" id="add3" name="add3" autocomplete="off" value="${member.adress3}">
      <button type="button" class="btn btn-outline-info" id="view3">顯示地圖</button>
      <div id="map3"></div>
    </div>
	
</div>

<div class="form-row justify-content-start mt-4">
<button type="submit" class="btn btn-outline-primary col-md-2 mt-4" id="submit">修改</button></div>
</div>
</form>
 </div>
</div>

<c:if test="${editOkMsg == '修改成功'}">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">修改成功</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        資料修改成功
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<button class="btn btn-primary" onclick="show()">show</button>
</c:if>

<script type="text/javascript">

$(window).ready(() => {
	$('#myModal').modal('show');
})

	$('#view1').click(function(){
		
		var divContent=$('#map1').html();
		
		if(divContent==0||divContent==null){
			$('#map2').empty()
			$('#view2')[0].innerHTML='顯示地圖'
			$('#map2').hide()	
			
			$('#map3').empty()
			$('#view3')[0].innerHTML='顯示地圖'
			$('#map3').hide()
			
		$('#map1').html('<iframe '+
			      	  'width="600" '+
			          'height="450" '+
			          'frameborder="0" '+
			          'style="border:0" '+
			          'src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCke-yKhB62CeJB3PtaBLZWYEkECFjJamk&q='+ $('#add1').val() +'" '+
			          'allowfullscreen>'+
			      	  '</iframe>')
		$('#view1')[0].innerHTML='關閉地圖'
		$('#map1').show()
		}else{
			$('#map1').empty()
			$('#view1')[0].innerHTML='顯示地圖'
			$('#map1').hide()
		}
	});
	
	$('#view2').click(function(){
		
		var divContent=$('#map2').html();
		
		if(divContent==0||divContent==null){
			$('#map1').empty()
			$('#view1')[0].innerHTML='顯示地圖'
			$('#map1').hide()	
			
			$('#map3').empty()
			$('#view3')[0].innerHTML='顯示地圖'
			$('#map3').hide()
		$('#map2').html('<iframe '+
			      	  'width="600" '+
			          'height="450" '+
			          'frameborder="0" '+
			          'style="border:0" '+
			          'src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCke-yKhB62CeJB3PtaBLZWYEkECFjJamk&q='+ $('#add2').val() +'" '+
			          'allowfullscreen>'+
			      	  '</iframe>')
		$('#view2')[0].innerHTML='關閉地圖'
		$('#map2').show()
		}else{
			$('#map2').empty()
			$('#view2')[0].innerHTML='顯示地圖'
			$('#map2').hide()
		}
	});
	
	$('#view3').click(function(){
		
		var divContent=$('#map3').html();
		
		if(divContent==0||divContent==null){
			$('#map2').empty()
			$('#view2')[0].innerHTML='顯示地圖'
			$('#map2').hide()	
			
			$('#map1').empty()
			$('#view1')[0].innerHTML='顯示地圖'
			$('#map1').hide()
		$('#map3').html('<iframe '+
			      	  'width="600" '+
			          'height="450" '+
			          'frameborder="0" '+
			          'style="border:0" '+
			          'src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCke-yKhB62CeJB3PtaBLZWYEkECFjJamk&q='+ $('#add3').val() +'" '+
			          'allowfullscreen>'+
			      	  '</iframe>')
		$('#view3')[0].innerHTML='關閉地圖'
		$('#map3').show()
		}else{
			$('#map3').empty()
			$('#view3')[0].innerHTML='顯示地圖'
			$('#map3').hide()
		}
	});
	
// 	const pattern = new RegExp("^[\s0-9a-zA-Z\u4E00-\u9FA5]+$");
// 	let add1Checked = true;
// 	let add2Checked = true;
// 	let add3Checked = true;
	
// 	$('#add1').blur(function(){
// 		var add1Input = $('#add1').val();
		
// 		if(add1Input!=0||add1Input!=null){
// 		if (!pattern.test(add1Input)) {
// 			add1Checked = false;
// 			$('#msg1')[0].innerHTML='本欄位接受中文、英文字母及數字'
// 			lock()
// 		} else {
// 			add1Checked = true;
// 			$('#msg1')[0].innerHTML=''
// 			lock()
// 		}
// 		}
// 	});
	
// 	$('#add2').blur(function(){
// 		var add2Input = $('#add2').val();
		
// 		if(add2Input!=0||add2Input!=null){	
// 		if (!pattern.test(add2Input)) {
// 			add2Checked = false;
// 			$('#msg2')[0].innerHTML='本欄位接受中文、英文字母及數字'
// 			lock()
// 		} else {
// 			add2Checked = true;
// 			$('#msg2')[0].innerHTML=''
// 			lock()
// 		}
// 		}
// 	});
	
// 	$('#add3').blur(function(){
// 		var add3Input = $('#add3').val();
		
// 		if(add3Input!=0||add3Input!=null){
// 		if (!pattern.test(add3Input)) {
// 			add3Checked = false;
// 			$('#msg3')[0].innerHTML='本欄位接受中文、英文字母及數字'
// 			lock()
// 		} else {
// 			add3Checked = true;
// 			$('#msg3')[0].innerHTML=''
// 			lock()
// 		}
// 		}
// 	});
	
// 	function lock(){
// 		if(add1Checked == true && add2Checked == true && add3Checked == true){
// 			$('#submit').attr("disabled", false);
// 		}else{
// 			$('#submit').attr("disabled", true);
// 		}
// 	}

</script>

</body>
</html>