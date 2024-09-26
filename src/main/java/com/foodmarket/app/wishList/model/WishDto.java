package com.foodmarket.app.wishList.model;

import com.foodmarket.app.product.model.WorkProduct;

public class WishDto {
	
	private WorkProduct product;
	
	private boolean wishCheck;

	public WorkProduct getProduct() {
		return product;
	}

	public void setProduct(WorkProduct product) {
		this.product = product;
	}

	public boolean isWishCheck() {
		return wishCheck;
	}

	public void setWishCheck(boolean wishCheck) {
		this.wishCheck = wishCheck;
	}
	
	

}
