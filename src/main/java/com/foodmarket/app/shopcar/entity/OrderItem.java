package com.foodmarket.app.shopcar.entity;

import java.time.LocalDateTime;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="order_item")
public class OrderItem {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="user_id")
	private Long userId;

	@Column(name="order_Record_Id")
	private Integer orderRecordId;
	
	@Transient
	private String productName;
	
	@Transient
	private Integer productPrice;
	
	@Column(name="product_Id")
	private Long productId;
	
	@Column(name="quantity")
	private Integer quantity;
	
	@Column(name="total_amount")
	private Integer totalAmount;
	
	@Column(name="create_date")
	private LocalDateTime createDate;
	
	@Transient
	private String createDateStr;

	
	@Column(name="modify_date")
	private LocalDateTime modifyDate;
	
	public OrderItem() {
	}

	public OrderItem(Integer id, long userId, Integer orderRecordId, Long productId, Integer quantity,
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

	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getOrderRecordId() {
		return orderRecordId;
	}

	public void setOrderRecordId(Integer orderRecordId) {
		this.orderRecordId = orderRecordId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
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
