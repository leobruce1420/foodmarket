package com.foodmarket.app.product.dto;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ProductcategoryDto implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@JsonProperty("pcmsg")
	private Integer categoryid;
	
	private String productcategoryname;
	
	public ProductcategoryDto() {
		
	}

	public Integer getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(Integer categoryid) {
		this.categoryid = categoryid;
	}

	public String getProductcategoryname() {
		return productcategoryname;
	}

	public void setProductcategoryname(String productcategoryname) {
		this.productcategoryname = productcategoryname;
	}

	public ProductcategoryDto(Integer categoryid, String productcategoryname) {
		super();
		this.categoryid = categoryid;
		this.productcategoryname = productcategoryname;
	}
	
	
	
}
