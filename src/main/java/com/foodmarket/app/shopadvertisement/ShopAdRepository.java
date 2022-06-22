package com.foodmarket.app.shopadvertisement;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface ShopAdRepository extends JpaRepository<ShopAdvertisement, Integer> {

}
