package com.foodmarket.app.shopcar.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.foodmarket.app.shopcar.dao.OrderItemDao;
import com.foodmarket.app.shopcar.entity.OrderItem;
import com.foodmarket.app.shopcar.entity.OrderRecord;



@Service
@Transactional
public class OrderItemService {
	

	@Autowired
	private OrderItemDao orderItemDao;

	public OrderItem getOne(Integer id) {
		return orderItemDao.findById(id).get();
	}

	public List<OrderItem> getByOrderRecordId(Integer orderRecordId) {
		return orderItemDao.findByOrderRecordId(orderRecordId);
	}
	
	public boolean save(List<OrderItem> orderItem) {
		for(OrderItem o : orderItem) {
			orderItemDao.save(o);
		}
		return true;
	}
	public boolean save(List<OrderItem> orderItem, OrderRecord orderRecord) {
		for(OrderItem o : orderItem) {
			orderItemDao.save(o);
			orderRecord.getId();
		}
		return true;
	}
	
	
}
