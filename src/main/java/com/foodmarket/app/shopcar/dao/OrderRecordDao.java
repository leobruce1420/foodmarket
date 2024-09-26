package com.foodmarket.app.shopcar.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodmarket.app.shopcar.entity.OrderRecord;


@Repository
public interface OrderRecordDao extends JpaRepository<OrderRecord, Integer>{

	
	@Query("from OrderRecord order by create_date Desc")
	public List<OrderRecord> findAllDesc();
	
	
	public OrderRecord findFirstByOrderByCreateDateDesc();
	
	@Query("from OrderRecord where UserId = :UserId order by create_date Desc")
	public List<OrderRecord> findByUserId(Long UserId);
}
