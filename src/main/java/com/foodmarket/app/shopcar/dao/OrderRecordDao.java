package com.foodmarket.app.shopcar.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodmarket.app.shopcar.entity.OrderRecord;


@Repository
public interface OrderRecordDao extends JpaRepository<OrderRecord, Integer>{

}
