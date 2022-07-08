package com.foodmarket.app.statistic.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.model.productcategoryBean;
import com.foodmarket.app.shopcar.entity.OrderItem;

public interface StatisticCategoryRepository extends JpaRepository<productcategoryBean, Integer> {

	public productcategoryBean findByCategoryid(Integer categoryid);

}
