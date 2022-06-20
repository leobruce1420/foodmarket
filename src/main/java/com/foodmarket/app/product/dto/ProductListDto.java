package com.foodmarket.app.product.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ProductListDto implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@JsonProperty("pcategory")
	private String productcategory;
	private String productimg;
	private String imgtype;
	private String keyword;
	private String orderBy;
	
	
	public ProductListDto() {
		
	}
	

	public String getProductimg() {
		return productimg;
	}

	public void setProductimg(String productimg) {
		this.productimg = productimg;
	}

	public String getImgtype() {
		return imgtype;
	}

	public void setImgtype(String imgtype) {
		this.imgtype = imgtype;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getProductcategory() {
		return productcategory;
	}


	public void setProductcategory(String productcategory) {
		this.productcategory = productcategory;
	}


	public String getOrderBy() {
		return orderBy;
	}


	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	
	
	
}
