package com.foodmarket.app.shopadvertisement;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Component;

@Entity@Table(name="shop_advertisement")
@Component
public class ShopAdvertisement {

	
	@Id@Column(name="shop_activity_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shopAdId;
	
	@Column(name="shop_activity_name")
	private String shopAdName;
	
	@Column(name="picture")
	private String picture;
	
	@Temporal(TemporalType.DATE)
	@Column(name="begin_date")
	private Date beginDate;
	
	@Temporal(TemporalType.DATE)
	@Column(name="end_date")
	private Date endDate;
	
	@Column(name="remark")
	private String remark;
	
	@Column(name="product_id")
	private String productId;
	
	
	public ShopAdvertisement() {
	}

	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}


	public Integer getShopAdId() {
		return shopAdId;
	}


	public void setShopAdId(Integer shopAdId) {
		this.shopAdId = shopAdId;
	}


	public String getShopAdName() {
		return shopAdName;
	}


	public void setShopAdName(String shopAdName) {
		this.shopAdName = shopAdName;
	}


	public Date getBeginDate() {
		return beginDate;
	}


	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public String getProductId() {
		return productId;
	}


	public void setProductId(String productId) {
		this.productId = productId;
	}


	public ShopAdvertisement(String shopAdName, String picture, Date beginDate, Date endDate, String remark,
			String productId) {
		super();
		this.shopAdName = shopAdName;
		this.picture = picture;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.remark = remark;
		this.productId = productId;
	}

	
}

