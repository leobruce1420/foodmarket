<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/navbar.jsp" /> 
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/shopcar.css" rel="stylesheet" />
<h1>購物車清單</h1>
<div class="row justify-content-center">
<div class="col-9">
<table class="table table-bordered">
	<thead>
		<tr>
			<th class="prod_item">商品名稱</th>
			<th class="prod_name">數量</th>
			<th class="prod_spec">單價</th>
			<th class="prod_qty">小計</th>
			<th class="prod_price">取消</th>
		</tr>
	</thead>
	<tbody>
	<input type="hidden" id="userId" value="${loginUserId}">
	
	<c:forEach var="product" items="${shopCarts}">
		<tr>
			<td><input type="text" value="${product.productName}" disabled></td>
			<td><input type="hidden" id="shopcartId_${product.id}" name="shopCartId" value="${product.id}">			
				<input type="hidden" id="productId_${product.id}" value="${product.productId}">
				<select id="amount_${product.id}" class="form-select" onchange="amountChange('${product.id}')" class="numberBtn" name="amount" >
					<option value="1" ${product.productNumber == '1' ? 'selected' : ''}>1</option>
					<option value="2" ${product.productNumber == '2' ? 'selected' : ''}>2</option>
					<option value="3" ${product.productNumber == '3' ? 'selected' : ''}>3</option>
					<option value="4" ${product.productNumber == '4' ? 'selected' : ''}>4</option>
					<option value="5" ${product.productNumber == '5' ? 'selected' : ''}>5</option>
					<option value="6" ${product.productNumber == '6' ? 'selected' : ''}>6</option>
					<option value="7" ${product.productNumber == '7' ? 'selected' : ''}>7</option>
					<option value="8" ${product.productNumber == '8' ? 'selected' : ''}>8</option>
					<option value="9" ${product.productNumber == '9' ? 'selected' : ''}>9</option>
					<option value="10" ${product.productNumber == '10' ? 'selected' : ''}>10</option>
				</select>
			</td>
			<td><input type="text" id="productPrice_${product.id}" value ="${product.productPrice}" disabled></td>
			<td><input type="text" id="subTotal_${product.id}" value="${product.productPrice * product.productNumber}" disabled></td>
			<td><a href="${contextRoot}/lock/shopcart/delete?id=${product.id}"><button class="btn btn-outline-danger"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16"><path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/></svg></button></a>
			</td>
		</tr>
	</c:forEach>
	
	
	
	</tbody>
	</table>
	<div class="carTotal">總金額：$<c:out  value ="${totalPrice}"/> 元</div>
	<div class="submitdiv">
		<input class="insertOrderBtn btn btn-success" type="button" value="送出訂單" onclick="sendOrder()">
	</div>
</div>
</div>
<script>

function sendOrder() {
	
	var shoplist = {};
	shoplist.list = [];
	var userId = document.getElementById('userId').value;

	document.getElementsByName("shopCartId").forEach(shopCartInput => {           
		var shopCartId = shopCartInput.value;                                     //購物車db每一個商品的id
		var quantity = document.getElementById("amount_" + shopCartId).value;     //數量
		var productId = document.getElementById("productId_" + shopCartId).value; //商品的id
	 	shoplist.list.push({"productId": productId, "quantity": quantity})		  //將數量跟商品id放到list裡面
	})
	axios({
		method : 'post',
		url : '${contextRoot}/lock/orderItem/save/' + userId,       //送shoplist.list的data到OrderItemController的saveRecord方法
		data : {
			 "orderItems"  : shoplist.list
		}
	}).then(function(res) {
		var orderRecordId = res.data.id
		document.location.href = `${contextRoot}/lock/orderList/` + orderRecordId
	})
	console.log(shoplist.list.length)
}

function amountChange(apId){
	 var userId =document.getElementById('userId').value;
	 var productNumber = document.getElementById('amount_'+apId).value;
	 var id = document.getElementById('shopcartId_'+apId).value;
		
		axios({
			method : 'post',
			url : '${contextRoot}/lock/shopcart/update',
			data : {
				"id" : id,
				"productNumber" : productNumber
			}
		}).then(function(res) {
			alert("數量修改完成");
			location.reload();

		})

	}

	//  $("#numberBtn").change(

	//  		function() {

	// 			 var oAmount = document.getElementById('amount');
	// 			 var amountValue = oAmount.options[oAmount.selectedIndex].value; //1
	// 			 var id = document.getElementById('shopcartId').value;
	//  			 var productId = document.getElementById('productId').value;
	//  			 var productPrice = document.getElementById('productPrice').value;
	//  			axios({
	//  			  method:'post',
	//  			  url:'${contextRoot}/shopcart/update',
	//  			  data:{
	//  				  "id": id,
	//  				  "productNumber": amountValue,
	//  				  "productId": productId
	//   					}
	//  			}).then(function(res) {
	//  				console.log("finish")
	//  				console.log(res)
	//  				  alert("數量修改完成");
	//  			})
	//  			 document.getElementById('subTotal').value = amountValue * productPrice;
	//  		}
	//  	)
</script>
