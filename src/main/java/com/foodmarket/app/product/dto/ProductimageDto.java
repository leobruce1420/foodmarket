package com.foodmarket.app.product.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ProductimageDto implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@JsonProperty("pmsg")
	private String pmessage;
	
	public ProductimageDto() {
		
	}
	
	public String getPmessage() {
		return pmessage;
		
	}
	
	public void setPmessage(String pmessage) {
		this.pmessage = pmessage;
	}
}
