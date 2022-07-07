package com.foodmarket.app.shopcar.controller;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.service.WorkProductService;
import com.foodmarket.app.shopcar.dao.ShopCartDao;
import com.foodmarket.app.shopcar.entity.OrderItem;
import com.foodmarket.app.shopcar.entity.ShopCart;
import com.foodmarket.app.shopcar.service.ShopCartService;


@Controller
public class ShopCarController {
	
//	@Autowired
//	private OrderItemService orderItemService;
	
//	@Autowired
//	private OrderRecordService orderRecordService;
	
	@Autowired
	private ShopCartService shopCartService;

	@Autowired
	private ShopCartDao shopCartDao;
	
	
//	@Autowired
//	private WorkProductRepository productDao;
	
	@Autowired
	private WorkProductService productService;
	
//	@GetMapping("allProduct")
//	public String allProductPage(Model model) {
//		List<Product> products = productService.getAll();// 進到這個頁面就載入所有商品
//		model.addAttribute("products", products);
//		return "shopcar/allProduct";
//	}
//	
//	@GetMapping("edit-page/{id}")
//	public String editPage(Model model, @PathVariable Integer id) {
//		Product product = productService.getOneById(id);
//		model.addAttribute("product", product);
//		return "shopcar/editProduct";
//	}
//	
//	@GetMapping("delete-page/{id}")
//	public String deletePage(@PathVariable Integer id) {
//		productService.deleteById(id);
//		return "shopcar/allProduct";
//	}
//	
//	@PostMapping("save")
//	public String save(List<OrderItem> orderItem) {
//
//		orderItemService.save(orderItem);
//	
//		return "shopcar/allProduct";
//	}
//	
//	@PostMapping("saveRecord")
//	@ResponseBody
//	public String saveRecord(@RequestBody OrderRecord orderRecord) {
//		
//		orderRecord = orderRecordService.save(orderRecord); //先存到Record取得RecordID
//		final int orderRecordId = orderRecord.getId();
//		orderRecord.getOrderItems().forEach(orderItem -> {
//			Integer productId = orderItem.getProductId();
//			Product product = productDao.findById(productId).get();
//			
//			orderItem.setOrderRecordId(orderRecordId);
//			orderItem.setCreateDate(LocalDateTime.now());
//			orderItem.setModifyDate(LocalDateTime.now());
//			orderItem.setUserId(1);
//			orderItem.setTotalAmount(orderItem.getQuantity() * product.getProductPrice());
//		});
//		
//		orderItemService.save(orderRecord.getOrderItems());
//		return "新增成功";
//	}
	
//	3.新增送出按鈕，點擊後可送出單一商品資料至後端 ex :{productId[0] : 1, quantity[0]:2},{productId[1] : 1, quantity[1]:2}
//	4.依據傳入之productId，查詢出對應的價格，並計算出總價格
//	5.接者呼叫OrderRecordService.save()取得OrderRecord的id
//	6.呼叫OrderItemService.save()，存入所有前端傳入資OrderItem資料
//	@PostMapping("saveOrderItem")
//	public String saveRecord(List<OrderItem> orderItem) {
//		for(OrderItem o : orderItem) {
//			System.out.println("itemQuantity" + o.getQuantity());
//		}
//		return "shopcar/allProduct";
//	}
	
	
	@GetMapping("/shopcart")
	public String shopcart() {
		return "shopcart/shopCart";
	}
	
	@PostMapping("lock/shopcart/update") //更新單筆
	@ResponseBody
	public ShopCart updateShopCart(@RequestBody ShopCart shopCart) {
		ShopCart dbShopCart = shopCartService.findById(shopCart.getId()); //用網頁傳回的id找出要修改的shopCart
		dbShopCart.setProductNumber(shopCart.getProductNumber()); //set網頁回傳的productNumber
		return shopCartService.save(dbShopCart);
	}
	
	
	@PostMapping("lock/shopcart/insert") //新增單筆
	@ResponseBody
	public ShopCart insertShopCart(@RequestBody ShopCart reqShopCart) {
		List<ShopCart> shopCarts = shopCartService.findAll();
		for(ShopCart shopCart:shopCarts) {
			Long productId = shopCart.getProductId();
			if(reqShopCart.getProductId() == productId) {
				ShopCart product = shopCartService.findByproductId(reqShopCart.getProductId());
				product.setProductNumber(product.getProductNumber() + 1);
				shopCartService.save(product);
				return null;
			}
		
		}
		
		return shopCartService.save(reqShopCart);
	}
	
	@PostMapping("shopcart/insertAll") //新增多筆
	@ResponseBody
	public List<ShopCart> insertShopCart(@RequestBody List<ShopCart> reqList){
		List<ShopCart> reqestList = shopCartDao.saveAll(reqList);
		return reqestList;
	}
	
	@GetMapping("lock/shopcart/delete") //刪除購物車裡單筆資料
	public String deleteById(@RequestParam("id") Integer id) {
		shopCartDao.deleteById(id);
		return "redirect:/lock/shopCart/all";
	}
	
//<<<<<<< HEAD
//	@GetMapping("shopcart/delete/{id}")
//	public deleteById(@PathVariable Integer id) {
//		
//	}
//=======
	@PostMapping("shopcart/add") //新增單筆
	public String addShopCart(Model model) {
		
		ShopCart shopcart = new ShopCart();
		
		model.addAttribute("shopcart",shopcart);
		
		return "shopCart";
	}

	@GetMapping("lock/shopCart/all")
	public String getAll(Model model, HttpSession session){
		System.out.println(session.getAttribute("loginUserId"));
		Long sessionUId = (Long) session.getAttribute("loginUserId");
		List<ShopCart> shopCarts = shopCartService.findShopCartByCustomerId(sessionUId);
		
		int totalPrice = 0;
		
		for(ShopCart shopCart:shopCarts) {
			Long productId = shopCart.getProductId();
			int productNumber = shopCart.getProductNumber();
			WorkProduct product= productService.findById(productId);
					
			String productName = product.getProductname();
			Integer productPrice = product.getProductprice();
			totalPrice += productNumber * productPrice;
			shopCart.setProductName(productName);
			shopCart.setProductPrice(productPrice);
			
		}
		model.addAttribute("totalPrice", totalPrice);
//		System.out.println("總金額:"+totalPrice);
//		Session.xxx; //getCustomerId

		Member member = new Member();
		member.setCustomerId(sessionUId);
		
		model.addAttribute("shopCarts" , shopCarts);
		model.addAttribute("member" , member);
		
		return "shopcart/shopCart";
	}
	
	
	
	@PostMapping("shopCart/item")
	public String getItem(Model model,Long customerId) {
		List<ShopCart> shopCarts = shopCartService.findShopCartByCustomerId(customerId);
		
		return "shopcart/Item";
	} 

	
	
}
