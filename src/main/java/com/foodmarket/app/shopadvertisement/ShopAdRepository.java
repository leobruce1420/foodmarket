package com.foodmarket.app.shopadvertisement;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface ShopAdRepository extends JpaRepository<ShopAdvertisement, Integer> {

	@Query(value="select * from shop_advertisement where onboard = 'on'",nativeQuery = true)
	public List<ShopAdvertisement> findShopAdByBoard();
		
	
}
