package com.foodmarket.app.shopcar.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodmarket.app.shopcar.dao.ShopCartDao;
import com.foodmarket.app.shopcar.entity.ShopCart;

@Service
@Transactional
public class ShopCartService {

	@Autowired
	private ShopCartDao shopCartDao;
	
	public ShopCart save(ShopCart shopCart) {
		return shopCartDao.save(shopCart);
	}

	
	public List<ShopCart> findAll(){
		return shopCartDao.findAll();
	}
	
	
	public List<ShopCart> findShopCartByCustomerId(Long customerId){
		
		return shopCartDao.findShopCartByCustomerId(customerId);
	}
	

	public ShopCart findById(Integer id){
		return shopCartDao.findById(id).orElse(null);
	}
	
//	public List<ShopCart> getAllShopCart(){
//		Long productId= shopCart.getProductId();
//		WorkProduct product = productDao.findById(productId).get();
//		String productName = product.getProductname();
//		Integer productPrice = product.getProductprice();
//		return ;
//		
//		
//		
//	}
	public void deleteById(Integer id) {
		shopCartDao.deleteById(id);
	}
	
	public void deleteByCustomerId(Long userId) {
		shopCartDao.deleteByCustomerId(userId);;
	}
	
	public ShopCart findByproductId(Long productId){
		return shopCartDao.findByProductId(productId);
	}
}
