package com.foodmarket.app.shopcar.controller;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.service.WorkProductService;
import com.foodmarket.app.shopcar.entity.OrderItem;
import com.foodmarket.app.shopcar.entity.OrderRecord;
import com.foodmarket.app.shopcar.entity.ShopCart;
import com.foodmarket.app.shopcar.service.OrderItemService;
import com.foodmarket.app.shopcar.service.OrderRecordService;
import com.foodmarket.app.shopcar.service.ShopCartService;

@Controller
public class OrderItemController {

	@Autowired
	private OrderItemService orderItemService;
	
	@Autowired
	private OrderRecordService orderRecordService;
	
	@Autowired
	private ShopCartService shopCartService;
	
	@Autowired
	private WorkProductService workProductService;
	
	@PostMapping("lock/orderItem/save/{userId}")
	@ResponseBody  //回傳數據
	public OrderRecord saveRecord(Model model, @RequestBody OrderRecord orderRecord, @PathVariable Long userId) {
		System.out.println("saveRecord");
		OrderRecord newOrderRecord = orderRecordService.save(orderRecord, userId);
		
		shopCartService.deleteByCustomerId(userId);
		
		return newOrderRecord;
	}
	

	@GetMapping("lock/orderList/{orderId}")
	public String getOrderList(Model model, @PathVariable Integer orderId){
		List<OrderItem> orderItems = orderItemService.getByOrderRecordId(orderId);
		
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		orderItems.forEach(o -> {
			WorkProduct product = workProductService.findById(Long.valueOf(o.getProductId()));
			o.setProductName(product.getProductname());
			o.setCreateDateStr(dtf.format(o.getCreateDate()));
		});
		
		Member member = new Member();
		member.setCustomerId(1L);
		
		model.addAttribute("orderItems" , orderItems);
		model.addAttribute("member" , member);
		
		return "order/orderList";
	}
	
	
	
}