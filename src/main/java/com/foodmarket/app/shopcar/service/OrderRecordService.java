package com.foodmarket.app.shopcar.service;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.model.WorkProductRepository;
import com.foodmarket.app.shopcar.dao.OrderItemDao;
import com.foodmarket.app.shopcar.dao.OrderRecordDao;
import com.foodmarket.app.shopcar.entity.OrderItem;
import com.foodmarket.app.shopcar.entity.OrderRecord;



@Service
@Transactional
public class OrderRecordService {

	@Autowired
	private OrderRecordDao orderRecordDao;
	
	@Autowired
	private OrderItemDao orderItemDao;
	
	@Autowired
	private WorkProductRepository productDao;
	
	@Autowired
	private MemberServiceInterface memberService;

	public List<OrderRecord> getAllOrderRecord() {
		return orderRecordDao.findAll();
	}
	
	public OrderRecord save(OrderRecord orderRecord, Long userId) {
		
		int totalAmount = 0;
		
		for(OrderItem item : orderRecord.getOrderItems()) {
			Integer productId = item.getProductId();
			Integer quantity = item.getQuantity();
			WorkProduct product = productDao.findByproductid(Long.valueOf(productId));
			
			int productPrice = product.getProductprice();
			item.setTotalAmount(productPrice * quantity);
			item.setUserId(userId);
			item.setCreateDate(LocalDateTime.now());
			item.setModifyDate(LocalDateTime.now());	
			totalAmount += productPrice * quantity;
		};
		
		orderRecord.setTotalAmount(totalAmount);
		orderRecord.setUserId(userId); //orderRecord.getMember().getCustomerId();

		
		Member member = memberService.findById(Long.valueOf(userId));
		orderRecord.setMember(member);
		//orderRecord.setUserId(userId); 
		orderRecord.setCreateDate(LocalDateTime.now());
		orderRecord.setModifyDate(LocalDateTime.now());
		final Integer orderRecordId = orderRecordDao.save(orderRecord).getId();
		
		for(OrderItem item : orderRecord.getOrderItems()) {
			item.setOrderRecordId(orderRecordId);
			orderItemDao.save(item);
		}
	
		return orderRecordDao.save(orderRecord);
	}

	public OrderRecord getOne(Integer id) {
		return orderRecordDao.findById(id).get();
	}
	
	public List<OrderRecord> getAll() {
		return orderRecordDao.findAll();
	}
	
}
