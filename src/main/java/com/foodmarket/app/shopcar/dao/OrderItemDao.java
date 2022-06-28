package com.foodmarket.app.shopcar.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.shopcar.entity.OrderItem;

@Repository
public interface OrderItemDao extends JpaRepository<OrderItem, Integer>{
	
	public List<OrderItem> findByOrderRecordId(Integer orderRecordId);
	
}
