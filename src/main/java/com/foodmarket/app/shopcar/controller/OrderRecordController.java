package com.foodmarket.app.shopcar.controller;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@GetMapping("record/page")
	public ModelAndView viewRecord(ModelAndView mav,
			@RequestParam(name="p",defaultValue ="1") Integer pageNumber) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		Page<OrderRecord> page = orderRecordService.findByPage(pageNumber);
		for(OrderRecord orderRecord:page) {
			Long userId = orderRecord.getUserId();
			Member member = memberRepository.findById(userId).get();
			String customerName = member.getCustomerName();
			String mobile = member.getMobile();
			String address = member.getAdress1();
			orderRecord.setCustomerName(customerName);
			orderRecord.setMobile(mobile);
			orderRecord.setAddress(address);
			orderRecord.setCreateDateStr(dtf.format(orderRecord.getCreateDate()));
		}
		mav.getModel().put("page", page);
		mav.setViewName("order/record2");
		return mav;
	}
	
	
	
	
	@GetMapping("orderRecord/all")
	public String getAllRecord(Model model) {
		List<OrderRecord> orderRecords = orderRecordService.getAll();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

		for(OrderRecord orderRecord:orderRecords) {
			Long userId = orderRecord.getUserId();
			Member member = memberRepository.findById(userId).get();
			String customerName = member.getCustomerName();
			String mobile = member.getMobile();
			String address = member.getAdress1();
			orderRecord.setCustomerName(customerName);
			orderRecord.setMobile(mobile);
			orderRecord.setAddress(address);
			orderRecord.setCreateDateStr(dtf.format(orderRecord.getCreateDate()));
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
	
	@GetMapping("/lastestRecord")
	public String getLastRecord(Model model) {
		
		OrderRecord lastestRecord = orderRecordService.getLastest();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		lastestRecord.setCreateDateStr(dtf.format(lastestRecord.getCreateDate()));
		List<OrderItem> orderItems= orderItemService.getByOrderRecordId(lastestRecord.getId());
		for(OrderItem orderItem:orderItems) {
			Long productId = orderItem.getProductId();
			WorkProduct product= productService.findById(productId);
					
			String productName = product.getProductname();
			Integer productPrice = product.getProductprice();
			
			orderItem.setProductName(productName);
			orderItem.setProductPrice(productPrice);
		
		}
		model.addAttribute("lastestRecord",lastestRecord);
		model.addAttribute("orderItems" , orderItems);
		return "order/lastestRecord";
	}
	
	
	@GetMapping("user/records")
	public String getUserRecord(Model model,HttpSession session) {
		Long userId= (Long) session.getAttribute("loginUserId");
		System.out.println("userId"+ userId);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		List<OrderRecord> userRecords = orderRecordService.getByCustomerId(userId);
		
		for(OrderRecord orderRecord:userRecords) {
			orderRecord.setCreateDateStr(dtf.format(orderRecord.getCreateDate()));
//			 Integer recordId= orderRecord.getId();
//			 List<OrderItem> orderItems= orderItemService.getByOrderRecordId(recordId);
//			 for(OrderItem orderItem:orderItems) {
//				 Long productId = orderItem.getProductId();
//				 WorkProduct product= productService.findById(productId);
//				 String productName = product.getProductname();
//				 Integer productPrice = product.getProductprice();
//					orderRecord.setProductName(productName);
//					orderRecord.setProductPrice(productPrice);
//				 
//				 Integer quantity= orderItem.getQuantity();
//				 	orderRecord.setQuantity(quantity);
//
//			 }
		}

		model.addAttribute("userRecords",userRecords);
		return "order/UserRecord";
	}
	
	@GetMapping("/userRecordItem/{orderRecordId}")
	public String getUserItemByRecordId(Model model,@PathVariable Integer orderRecordId) {
	
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
		return "order/userRecordItemList";
	}
	
}
