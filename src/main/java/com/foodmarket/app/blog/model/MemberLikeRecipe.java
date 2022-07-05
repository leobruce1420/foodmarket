package com.foodmarket.app.blog.model;



import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity(name = "MemberLikeRecipeEntity")
@Table(name = "customer_like_recipe")
public class MemberLikeRecipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="customerRecipeId")
	private Long customerRecipeId;
	
	@JsonIgnore
	@Column(name = "customerId")
	private Long customerId;
	
	@JsonIgnore
	@Column(name = "recipePostId")
	private Long recipePostId;

	public Long getCustomerRecipeId() {
		return customerRecipeId;
	}

	public void setCustomerRecipeId(Long customerRecipeId) {
		this.customerRecipeId = customerRecipeId;
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

	@Override
	public String toString() {
		return "MemberLikeRecipe [customerRecipeId=" + customerRecipeId + ", customerId=" + customerId
				+ ", recipePostId=" + recipePostId + "]";
	}

	public MemberLikeRecipe() {
	}

}
