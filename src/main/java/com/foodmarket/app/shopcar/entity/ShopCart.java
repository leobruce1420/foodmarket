package com.foodmarket.app.shopcar.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="shop_cart")
public class ShopCart {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "id")
	private Integer id;
	
	@Column(name= "product_id")
	private Integer productId;
	
	@Column(name= "product_number")
	private Integer productNumber;
	
	@Column(name= "product_subtotal")
	private Integer productSubtotal;
	
	@Column(name= "customer_id")
	private Integer customerId;
	
	@Column(name= "order_item_id")
	private Integer orderItemId;

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

	public Integer getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(Integer productNumber) {
		this.productNumber = productNumber;
	}

	public Integer getProductSubtotal() {
		return productSubtotal;
	}

	public void setProductSubtotal(Integer productSubtotal) {
		this.productSubtotal = productSubtotal;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public Integer getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(Integer orderItemId) {
		this.orderItemId = orderItemId;
	}

	
	
}
