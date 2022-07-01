package com.foodmarket.app.blog.model;

import java.io.Serializable;



public class MemberLikeRecipeMultiKeysClass implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long customerId;
	private Long recipePostId;
	
	public MemberLikeRecipeMultiKeysClass(Long customerId, Long recipePostId) {
		this.customerId = customerId;
		this.recipePostId = recipePostId;
	}

	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((customerId == null) ? 0 : customerId.hashCode());
		result = prime * result + ((recipePostId == null) ? 0 : recipePostId.hashCode());
		return result;
	}




	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberLikeRecipeMultiKeysClass other = (MemberLikeRecipeMultiKeysClass) obj;
		if (customerId == null) {
			if (other.customerId != null)
				return false;
		} else if (!customerId.equals(other.customerId))
			return false;
		if (recipePostId == null) {
			if (other.recipePostId != null)
				return false;
		} else if (!recipePostId.equals(other.recipePostId))
			return false;
		return true;
	}




	public Long getCustomerId() {
		return customerId;
	}




	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}




	public Long getRecipePostId() {
		return recipePostId;
	}




	public void setRecipePostId(Long recipePostId) {
		this.recipePostId = recipePostId;
	}




	public MemberLikeRecipeMultiKeysClass() {
	}

}
