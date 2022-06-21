package com.foodmarket.app.product.dto;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ProductDto implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@JsonProperty("pmsg")
	private String pmessage;
	private MultipartFile productimgdto;
	private String imgtype;
	private String keyword;
	
	
	public ProductDto() {
		
	}
	
	public String getPmessage() {
		return pmessage;
		
	}
	
	public void setPmessage(String pmessage) {
		this.pmessage = pmessage;
	}



	public MultipartFile getProductimgdto() {
		return productimgdto;
	}

	public void setProductimgdto(MultipartFile productimgdto) {
		this.productimgdto = productimgdto;
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
	
	
	
}
