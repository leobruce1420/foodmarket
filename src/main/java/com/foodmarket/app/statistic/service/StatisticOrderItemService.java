package com.foodmarket.app.statistic.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodmarket.app.statistic.model.StatisticRepository;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.shopcar.entity.OrderItem;
import com.foodmarket.app.statistic.model.ProductStatistic;
import com.foodmarket.app.statistic.model.StatisticOrderItemRepository;
import com.foodmarket.app.statistic.model.StatisticProductRepository;

@Service
@Transactional
public class StatisticOrderItemService {
	
	@Autowired
	private StatisticOrderItemRepository soiDao;
	
	@Autowired
	private StatisticProductRepository spDao;
	
	public Map<String, Integer> productCount(){
		
		List<OrderItem> ps_list = soiDao.findAll();
		
//		System.err.println("============== test ps_list str ==============");
//		System.err.println(ps_list);
//		System.err.println("============== test ps_list end ==============");
		
		List<ProductStatistic> rtnList = new ArrayList();
		
		Map<String, Integer> keyMap = new HashMap(); // 泛型: 是否在宣告的時候指定型態
		
		for (OrderItem data : ps_list) {
			
			// 確認原始資料
			Long productid = data.getProductId();
//			System.err.println("ID:" + productid);
			
			WorkProduct wp = spDao.findByproductid(productid);
			String pn = wp.getProductname();
//			System.err.println("Product Name:" + pn);
			
			int s = data.getQuantity();
//			System.err.println("Quantity:" + s);
			
			
			// 取得目前加總
			int total_salles = keyMap.getOrDefault(pn, 0);
			
			// 計算新的加總
			total_salles = total_salles + s;
			
			// 把計算後的加總，更新到 map
			keyMap.put(pn, total_salles);
		}
		
//		System.err.println("加總結果:" + keyMap);

		return keyMap;
	}
	
		public Map<String, Integer> productImg(){
		
		List<OrderItem> ps_list = soiDao.findAll();
		
//		System.err.println("============== test ps_list str ==============");
//		System.err.println(ps_list);
//		System.err.println("============== test ps_list end ==============");
		
		List<ProductStatistic> rtnList = new ArrayList();
		
		Map<String, Integer> keyMap = new HashMap(); // 泛型: 是否在宣告的時候指定型態
		
		for (OrderItem data : ps_list) {
			
			// 確認原始資料
			Long productid = data.getProductId();
//			System.err.println("ID:" + productid);
			
			WorkProduct wp = spDao.findByproductid(productid);
			String pi = wp.getProductimg();
//			System.err.println("Product Img:" + pi);
			
			int s = data.getQuantity();
//			System.err.println("Quantity:" + s);
			
			
			// 取得目前加總
			int total_salles = keyMap.getOrDefault(pi, 0);
			
			// 計算新的加總
			total_salles = total_salles + s;
			
			// 把計算後的加總，更新到 map
			keyMap.put(pi, total_salles);
		}
		
//		System.err.println("加總結果:" + keyMap);

		return keyMap;
	}
	
}
