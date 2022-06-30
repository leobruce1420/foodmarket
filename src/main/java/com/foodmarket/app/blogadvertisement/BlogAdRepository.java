package com.foodmarket.app.blogadvertisement;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface BlogAdRepository extends JpaRepository<BlogAdvertisement, Integer> {
	@Query(value="select * from blog_advertisement where onboard = 'on'",nativeQuery = true)
	public List<BlogAdvertisement> findShopAdByBoard();
}
