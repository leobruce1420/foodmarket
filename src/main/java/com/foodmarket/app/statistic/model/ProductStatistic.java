package com.foodmarket.app.statistic.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="productStatistic")
public class ProductStatistic {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="productId")
	private Integer productId;
	
	@Column(name="productName")
	private String productName;
	
	@Column(name="sales")
	private Integer sales;
	
//	@Column(name="salesTotal")
//	private Integer salesTotal;
//	
//	public Integer getSalesTotal() {
//		return salesTotal;
//	}
//	
//	public void setSalesTotal(Integer salesTotal) {
//		this.salesTotal = salesTotal;
//	}
	
	@Override
	public String toString() {
		return "productStatistic [id=" + id + ", productId=" + productId + ", productName=" + productName + ", sales="
				+ sales + "]";
	}


	public ProductStatistic(Integer id, Integer productId, String productName, Integer sales) {
		super();
		this.id = id;
		this.productId = productId;
		this.productName = productName;
		this.sales = sales;
	}




	public Integer getId() {
		return id;
	}




	public void setId(Integer id) {
		this.id = id;
	}




	public Integer getProductId() {
		return productId;
	}




	public void setProductId(Integer productId) {
		this.productId = productId;
	}




	public String getProductName() {
		return productName;
	}




	public void setProductName(String productName) {
		this.productName = productName;
	}




	public Integer getSales() {
		return sales;
	}




	public void setSales(Integer sales) {
		this.sales = sales;
	}




	public ProductStatistic() {
	}

}