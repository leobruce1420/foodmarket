package com.foodmarket.app.shopcar.service;

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
	

	
	
	
}
