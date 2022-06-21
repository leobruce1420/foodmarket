package com.foodmarket.app.product.dto;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ProductDto implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@JsonProperty("pmsg")
	private String pmessage;
	private Long productid;
	private String productname;
	private String productcategory;
	private Integer productprice;
//	private byte[] productimg;
	private String productimg;
	private String imgtype;
	private String productdesciption;
	private Integer inventoryquantity;
	private String takedown;
	private String keyword;
	
	
	public ProductDto() {
		
	}
	
	public String getPmessage() {
		return pmessage;
		
	}
	
	public void setPmessage(String pmessage) {
		this.pmessage = pmessage;
	}

	

	public Long getProductid() {
		return productid;
	}

	public void setProductid(Long productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductcategory() {
		return productcategory;
	}

	public void setProductcategory(String productcategory) {
		this.productcategory = productcategory;
	}

	public Integer getProductprice() {
		return productprice;
	}

	public void setProductprice(Integer productprice) {
		this.productprice = productprice;
	}

	public String getProductdesciption() {
		return productdesciption;
	}

	public void setProductdesciption(String productdesciption) {
		this.productdesciption = productdesciption;
	}

	public Integer getInventoryquantity() {
		return inventoryquantity;
	}

	public void setInventoryquantity(Integer inventoryquantity) {
		this.inventoryquantity = inventoryquantity;
	}

	public String getTakedown() {
		return takedown;
	}

	public void setTakedown(String takedown) {
		this.takedown = takedown;
	}

	public String getProductimgdto() {
		return productimg;
	}

	public void setProductimgdto(String productimg) {
		this.productimg = productimg;
	}
//	public byte[] getProductimgdto() {
//		return productimg;
//	}
//	
//	public void setProductimgdto(byte[] productimg) {
//		this.productimg = productimg;
//	}

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
