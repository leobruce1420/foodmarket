package com.foodmarket.app.shopcar.entity;

import java.time.LocalDateTime;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="order_item")
public class OrderItem {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="user_id")
	private Integer userId;

	@Column(name="order_Record_Id")
	private Integer orderRecordId;
	

	@Column(name="product_Id")
	private Long productId;
	
	@Column(name="quantity")
	private Integer quantity;
	
	@Column(name="total_amount")
	private Integer totalAmount;
	
	@Column(name="create_date")
	private LocalDateTime createDate;

	@Column(name="modify_date")
	private LocalDateTime modifyDate;
	
	public OrderItem() {
	}

	public OrderItem(Integer id, Integer userId, Integer orderRecordId, Long productId, Integer quantity,
			Integer totalAmount, LocalDateTime createDate, LocalDateTime modifyDate) {
		super();
		this.id = id;
		this.userId = userId;
		this.orderRecordId = orderRecordId;
		this.productId = productId;
		this.quantity = quantity;
		this.totalAmount = totalAmount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "OrderItem [id=" + id + ", userId=" + userId + ", orderRecordId=" + orderRecordId + ", productId="
				+ productId + ", quantity=" + quantity + ", totalAmount=" + totalAmount + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getOrderRecordId() {
		return orderRecordId;
	}

	public void setOrderRecordId(Integer orderRecordId) {
		this.orderRecordId = orderRecordId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(LocalDateTime modifyDate) {
		this.modifyDate = modifyDate;
	}


	
	
	
}
