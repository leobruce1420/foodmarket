package com.foodmarket.app.statistic.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface StatisticRepository extends JpaRepository<ProductStatistic, Integer> {

	//@Query(value="select sum(sales=:sales) as aaaa, productName=:productName from productStatistic group by productName", nativeQuery = true)
	//public List<productStatistic> getStatisticCount(@Param(value="productName") String productName, @Param(value="sales") Integer sales);
	
	public List<ProductStatistic> findAll();
	
	//如果要改productStatistic檔名要注意大小寫，原生SQL好像不管大小寫
}
