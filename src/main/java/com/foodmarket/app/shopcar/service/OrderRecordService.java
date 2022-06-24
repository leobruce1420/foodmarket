package com.foodmarket.app.shopcar.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodmarket.app.shopcar.dao.OrderRecordDao;
import com.foodmarket.app.shopcar.entity.OrderRecord;



@Service
@Transactional
public class OrderRecordService {

	@Autowired
	private OrderRecordDao orderRecordDao;
	

	public List<OrderRecord> getAllOrderRecord() {
		return orderRecordDao.findAll();
	}
	
//	public OrderRecord save(OrderRecord orderRecord) {
//		int totalAmount = 0;
//		for(OrderItem orderItem : orderRecord.getOrderItems()) {
//			Integer productId = orderItem.getProductId();
//			Product product = productDao.findById(productId).get();
//			int productPrice = product.getProductPrice();
//			Integer quantity = orderItem.getQuantity();
//			totalAmount += productPrice * quantity;
//		}
//		
//		orderRecord.setTotalAmount(totalAmount);
//		orderRecord.setUserId(1);
//		orderRecord.setCreateDate(LocalDateTime.now());
//		orderRecord.setModifyDate(LocalDateTime.now());
//		return orderRecordDao.save(orderRecord);
//	}
//	
//	
//	public int calcTotalAmount(OrderItem orderItem) {
//		Integer productId = orderItem.getProductId();
//		Product product = productDao.findById(productId).get();
//		int productPrice = product.getProductPrice();
//		Integer quantity = orderItem.getQuantity();
//		return productPrice * quantity;
//	}
//
}
