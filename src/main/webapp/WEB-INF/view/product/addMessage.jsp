<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<div class="container">


<div class="row justify-content-center">
<div class="col-9">
  <h1>新增商品頁面</h1>
<div class="card">
  <div class="card-header">
    請輸入新商品資訊
  </div>
  <div class="card-body">
  
<%--   <form:form class="form" method="post" action="${contextRoot}/postMessage" modelAttribute="workMessages"> --%>
  <form:form class="form" method="post" action="${contextRoot}/postProduct" modelAttribute="workProduct" enctype="multipart/form-data">
  
  <div class="form-group">
  商品名稱
<%--   <form:textarea path="text" class="form-control"/> --%>
<%--   <form:textarea path="productname" class="form-control"/> --%>
  <form:input path="productname" class="form-control"/>
  商品類別編號
  <form:input path="productcategory" class="form-control"/>
  價格
  <form:input path="productprice" class="form-control"/><br/>
  圖
<%--   <form action=""> --%>
<%--   <form:input path="productimg" class="form-control" /> --%>
  
<!--   <input type="file" name="file" id="img_upload_file" multiple="multiple" accept=".jpg,.jpeg,.gif" required/><br/> -->
<!-- <input type="hidden" name="img_upload_base" id="img_upload_base" /> -->
<!-- <label>圖片預覽</label>  -->
<%-- <img id="img_upload_show"  style="width: 100px; height: 100px;" src= "data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image" /> --%>
<%--   </form> --%>

<div>
<input type="file" accept="image/*" onchange="loadFile(event)">
</div>
<br/>

<img id="output" style="width: 100px; height: 100px;" />
<script> 
// function preview() {
//     frame.src=URL.createObjectURL(event.target.files[0]);
// }
// $("#img_upload_file").change(function() {
//         var file = this.files[0];
//         var reader = new FileReader();
//         reader.readAsDataURL(file);//呼叫自帶方法進行轉換
//         reader.onload = function(e) {
//             $("#img_upload_show").attr("src", this.result);//將轉換後的編碼存入src完成預覽
//             $("#img_upload_base").val(this.result);//將轉換後的編碼儲存到input供後臺使用
//         }; 
//     });
    
    


  var loadFile = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('output');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };

    
 </script>
 
 

<!-- <div> -->
<%--      <img id="frame" class="rounded-sm" alt="productImg" src="data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image" width="100px" height="100px"> --%>
<!--      </div> -->
<br/>
  圖檔名
  <form:input path="imgtype" class="form-control"/>
  商品介紹
  <form:input path="productdesciption" class="form-control"/>
  庫存數量
  <form:input path="inventoryquantity" class="form-control"/>
  上下架
  <form:input path="takedown" class="form-control"/>
  </div>
  
  <input type="submit" name="submit" value="新增商品">
  
  </form:form>
    
  </div>
  <table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
</div>

</div>

</div>

<p />

<div class="row justify-content-center">
  <div class="col-9">
   
  <div class="card">
    <div class="card-header">
      最新新增商品資訊  <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE" value="${lastestpMsg.added}" />
    </div>
    <div class="card-body">
    <div>
      <c:out value="${lastestpMsg.productname}" />
      </div>
      <div>
      <c:out value="${lastestpMsg.productcategory}" />
      </div>
      <div>
      <c:out value="${lastestpMsg.productprice}" />
      </div>
      <div>
<%--       <c:out value="${lastestpMsg.productimg}" /> --%>
      <img style="width: 100px; height: 100px;" src= "data:image/${lastestpMsg.imgtype};base64,${lastestpMsg.productimg}" alt="image" />
      </div>
      <div>
      <c:out value="${lastestpMsg.imgtype}" />
      </div>
      <div>
      <c:out value="${lastestpMsg.productdesciption}" />
      </div>
      <div>
      <c:out value="${lastestpMsg.inventoryquantity}" />
      </div>
      <div>
      <c:out value="${lastestpMsg.takedown}" />
      </div>
      
    </div>
  </div>
  
 
  
  </div>
  
  </div>
  

</div>

