<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- <jsp:include page="layout/navbar.jsp"/> --%>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />



<c:forEach var="item" items="${products}">
    <div>
	
	id : <input type="hidden" id="${item.id}" value="${item.id}">
	
	產品名稱 : <input id="input_name_${item.id}" value="${item.productName}">

	價錢 : <input id="input_price_${item.id}" value="${item.productPrice}">
<%-- 	<a href="${contextRoot}/edit-page/${item.id}"><button>編輯</button></a> --%>
<%-- 	<a href="${contextRoot}/delete-page/${item.id}"><button>刪除</button></a> --%>
    <span id="btn_${item.id}" class="addbtn" onclick="addItem('${item.id}', '${item.productName}', '${item.productPrice}' )">+新增</span>
	</div>
</c:forEach>


<!-- #buylist -->
<!--   h1 MyBuylist 購物清單 -->
<!--   .buy_item.control_panel -->
<!--     label 產品名 -->
<!--     input#input_name(placeholder="名稱...") -->
<!--     label 價錢 -->
<!--     input#input_price(placeholder="234...") -->
<!--     span.addbtn +新增 -->
<!--   #items_list -->
 <form>
  <div id="buylist">
  <h1>購物車清單</h1>
  <div id="items_list"></div>
</div>
<hr/>
<input class="insertOrderBtn" type="button" value="送出訂單">
</form>
<style>
@charset "UTF-8";
* {
  position: relative;
  font-family: "Roboto Condensed", sans-serif, "微軟正黑體";
}

#buylist {
  display: inline-block;
  padding: 20px;
  border: solid 4px #444;
  background-color: #f3f3f3;
  box-shadow: 0px 0px 30px rgba(0, 0, 0, 0.2);
  width:500px;
}

h1 {
  padding: 10px 10px 10px 10px;
   margin-top: 20px; 
   margin-left: 20px; 
   margin-right: 20px; 
  border-bottom: solid 4px #444;
  background-color: #FF3D4A;
  color: #f3f3f3;
  font-weight: 1000;
}

#items_list {
  margin-top: 10px;
  padding: 5px;
}

.buy_item {
  padding: 5px;
  list-style: none;
  border: solid 3px #444;
  margin-top: 10px;
  font-weight: 900;
}
.buy_item input {
  width: 100px;
  border: solid 3px;
  padding: 2px;
}
.buy_item .price {
  display: inline-block;
  position: absolute;
  padding-left: 8px;
  padding-right: 8px;
  right: 50px;
  background-color: #FFC954;
}
.buy_item .price::after {
  content: " $";
}
.buy_item .del_btn {
  display: inline-block; 
  position: absolute;
  padding: 0px 6px;
  right: 10px;
  cursor: pointer;
}
.buy_item .del_btn:hover {
  background-color: #FF3D4A;
  color: white;
}
.buy_item .addbtn {
  cursor: pointer;
  margin-left: 10px;
  padding: 5px;
  border: solid 3px #444;
}
.buy_item .addbtn:hover {
  background-color: #FF3D4A;
  color: white;
}

.control_panel {
  padding: 20px;
}

.total {
  background-color: #FF3D4A;
  color: #f3f3f3;
}
.total .price {
  background-color: transparent;
}

</style>	

<script>
//新增一個商品清單的物件
var shoplist={};
// shoplist.name="MyBuylist 購物清單";
// shoplist.time="2016/9/10";
//商品清單的清單裡面是個陣列，塞商品物件們
shoplist.list=[
	
];
//定義元素用的html模板，{{名稱}}代表要套入的地方
var item_html="<li id={{id}} class='buy_item'>{{num}}.{{item}}<div class='price'>{{price}}</div><div id={{del_id}} data-delid={{del_item_id}} class='del_btn'>X</div></li>";
var total_html="<li class='buy_item total'>總價<div name='totalAmount' class='price'>{{price}}</div></li>";

// <input type="text" name="orderItems[0].productId" value="2">
// <input type="text" name="orderItems[0].quantity" value="3">

//刪除並重新產生清單中所有項目
function showlist(){
  $("#items_list").html("");
  var total_price=0;
  //把每個項目做出來
  for(var i=0;i<shoplist.list.length;i++){
    var item=shoplist.list[i];
    var item_id="buyitem_"+i;
    var del_item_id="del_buyitem_"+i;
    
    //動態統計總價(每一項跑時加上去)
    total_price+=parseInt(item.price);
    
    //取代模板位置成資料replace(要取代的,取代成...)
    var current_item_html=
        item_html.replace("{{num}}",i+1)
                 .replace("{{item}}",item.productName)
                 .replace("{{id}}",item_id)
                 .replace("{{del_id}}",del_item_id)
                 .replace("{{price}}",item.price)
                 .replace("{{del_item_id}}",i);
    
    //加入元素後才能夠用jquery操作
    $("#items_list").append(current_item_html);
    $("#"+del_item_id).click(
      function(){
        remove_item(parseInt($(this).attr("data-delid")));
      }
    );
  }
  //新增總價那一欄
  var current_total_html=
      total_html.replace("{{price}}",total_price);
  $("#items_list").append(current_total_html);
}
//先顯示一次，因為前面只定義好function 還沒有執行
showlist();


function addItem(id, productName, price){
// 	console.log(id , productName, price)
	shoplist.list.push({"productId": id, "quantity": 1,
		"productName":productName,"price": price})
	showlist();
}
//刪除項目 陣列.splice(位置,長度) 
//刪除資料->重新根據資料渲染清單
function remove_item(id){
  shoplist.list.splice(id,1);
  showlist();
}


$(".insertOrderBtn").click(
	function() {
		axios({
		  method: 'post',
		  url: '${contextRoot}/saveRecord',
		  data: {
			  "orderItems"  : shoplist.list
			 
		  }
		}).then(function(response) {
			  alert(response.data);
			  console.log(shoplist.list)
		}) 
	}
)
</script>


<!-- 1.顯示商品(Product)資料 (id, name, price) -->
<!-- 2.新增按鈕，點擊後可新增至購物車，物件屬性為 (productId, quantity) -->
<!-- 3.新增送出按鈕，點擊後可送出單一商品資料至後端 ex :{productId : 1, quantity:2} -->
<!-- 4.依據傳入之productId，查詢出對應的價格，並計算出總價格 -->
<!-- 5.接者呼叫OrderRecordService.save()取得OrderRecord的id -->
<!-- 6.呼叫OrderItemService.save()，存入所有前端傳入資OrderItem資料 -->

<!-- 1.先把jsp裡面對應的productI跟quantity改成跟資料庫欄位名稱一樣,取得網頁上的資料 -->
<!-- 2.讓商品的 order_record_id,product_id,quantity變成陣列的 input -->
<!-- 3.在按下insertOrderBtn時抓取購物清單的陣列，並送出userId -->
<!-- 4.用orderRecordService的save方法存入資料庫並拿到orderRecord的id -->
<!-- 5.將orderRecord的id塞入orderItem並呼叫orderItemService的save方法 -->