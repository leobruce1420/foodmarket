package com.foodmarket.app.shopcar.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.repository.MemberRepository;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.service.WorkProductService;
import com.foodmarket.app.shopcar.entity.OrderItem;
import com.foodmarket.app.shopcar.entity.OrderRecord;
import com.foodmarket.app.shopcar.entity.ShopCart;
import com.foodmarket.app.shopcar.service.OrderItemService;
import com.foodmarket.app.shopcar.service.OrderRecordService;

@Controller
public class OrderRecordController {
	
	@Autowired
	private OrderRecordService orderRecordService;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private OrderItemService orderItemService;
	
	@Autowired
	private WorkProductService productService;
	
	
	@GetMapping("/orderRecord/all")
	public String getAllRecord(Model model) {
		List<OrderRecord> orderRecords = orderRecordService.getAll();
		
		for(OrderRecord orderRecord:orderRecords) {
			Long userId = orderRecord.getUserId();
			Member member = memberRepository.findById(userId).get();
			String customerName = member.getCustomerName();
			String mobile = member.getMobile();
			String address = member.getAdress1();
			orderRecord.setCustomerName(customerName);
			orderRecord.setMobile(mobile);
			orderRecord.setAddress(address);

		}
		
		model.addAttribute("orderRecords" , orderRecords);
		
		return "order/record";
	}
	
	@GetMapping("/listItem/{orderRecordId}")
	public String getItemByRecordId(Model model,@PathVariable Integer orderRecordId) {
	
		List<OrderItem> orderItems = orderItemService.getByOrderRecordId(orderRecordId);
		
		for(OrderItem orderItem:orderItems) {
			Long productId = orderItem.getProductId();
			WorkProduct product= productService.findById(productId);
					
			String productName = product.getProductname();
			Integer productPrice = product.getProductprice();
			
			orderItem.setProductName(productName);
			orderItem.setProductPrice(productPrice);
		}
		
		model.addAttribute("orderItems" , orderItems);
		return "order/itemList";
	}
}
