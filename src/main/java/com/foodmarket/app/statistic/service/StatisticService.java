package com.foodmarket.app.statistic.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodmarket.app.statistic.model.StatisticRepository;
import com.foodmarket.app.statistic.model.ProductStatistic;



@Service
@Transactional
public class StatisticService {
	
	@Autowired
	private StatisticRepository statisticDao;
	
	public Map<String, Integer> productCount(String productName, Integer sales){
	//public List<productStatistic> productCount(String productName, Integer sales){
		
		List<ProductStatistic> ps_list = statisticDao.findAll();
		
		System.err.println("============== test ps_list str ==============");
		System.err.println(ps_list);
		System.err.println("============== test ps_list end ==============");
		
		List<ProductStatistic> rtnList = new ArrayList();
		
		Map<String, Integer> keyMap = new HashMap(); // 泛型: 是否在宣告的時候指定型態
		
		for (ProductStatistic data : ps_list) {
			
			// 確認原始資料
			int id = data.getProductId();
			System.err.println("ID:" + id);
			
			String pn = data.getProductName();
			System.err.println("Product Name:" + pn);
			
			int s = data.getSales();
			System.err.println("Sales:" + s);
			
			
			// 取得目前加總
			int total_salles = keyMap.getOrDefault(pn, 0);
			
			// 計算新的加總
			total_salles = total_salles + s;
			
			// 把計算後的加總，更新到 map
			keyMap.put(pn, total_salles);
		}
		
		System.err.println("加總結果:" + keyMap);

		return keyMap;
	}
}

