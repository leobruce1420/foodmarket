package com.foodmarket.app.statistic.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodmarket.app.statistic.service.StatisticOrderItemService;
import com.foodmarket.app.statistic.service.StatisticService;


@Controller
public class StatisticController {
	
	
	@Autowired
	private StatisticOrderItemService soiService;
	
	
	@GetMapping("/statistic")
	public String productCountTest() {
		return "statistic/pieChart";
	}
	
	@GetMapping("/productCount")
	@ResponseBody
	public Map getStatisticCount(){
		
//		System.err.println("============== test str ==============");
		
		Map rtnMap = soiService.productCount();
		
//		System.err.println("============== test end ==============");
		
		return rtnMap;
	}
	
	@GetMapping("/productImg")
	@ResponseBody
	public Map getProductImg(){
		
//		System.err.println("============== test str ==============");
		
		Map rtnMap = soiService.productImg();
		
//		System.err.println("============== test end ==============");
		
		return rtnMap;
	}
	


}
