package com.foodmarket.app.wishList.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.wishList.model.WishList;

@Repository
@Transactional
public interface WishListRepository extends JpaRepository<WishList, Long> {
	
	public List<WishList> findByMember(Member member);
	
	@SuppressWarnings("unchecked")
	public WishList save(WishList wishList);
	
	public WishList findByMemberAndProduct(Member member,WorkProduct product);
	
	@Transactional
	@Modifying
	public void deleteByMemberAndProduct(Member member,WorkProduct product);

}
