package com.foodmarket.app.shopcar.dao;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.foodmarket.app.shopcar.entity.ShopCart;


@Repository
public interface ShopCartDao extends JpaRepository<ShopCart, Integer>{

	@Query("from ShopCart where customerId = :customerId")
	public List<ShopCart> findShopCartByCustomerId(@Param("customerId") Long customerId);
	
	
	public void deleteByCustomerId(Long customerId);
	
	public ShopCart findByProductId(Long productId);
	
//	@Query(value="select * from shop_cart where ;",nativeQuery = true)
//	public List<ShopCart> findByShopCartNum();
		
	
}
