package com.foodmarket.app.product.query;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ProductListQuery implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@JsonProperty("pcategory")
	private String keyword;
	private List<Integer> productcategory;
	
	
	public ProductListQuery() {
		
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public List<Integer> getProductcategory() {
		return productcategory;
	}


	public void setProductcategory(List<Integer> productcategory) {
		this.productcategory = productcategory;
	}
	

	
	
	
	
}
