package com.foodmarket.app.blog.model;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;


@Entity(name = "MemberLikeRecipeEntity")
@Table(name = "customer_like_recipe")
@IdClass(MemberLikeRecipeMultiKeysClass.class)
@Embeddable
public class MemberLikeRecipe implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long customerId;
	
	private Long recipePostId;
	
	  @Id
	  public Long getCustomerId(){
	    return this.customerId;
	  }

	  @Id
	  public Long getRecipePostId(){
	    return this.recipePostId;
	  }
	  
//	  @Transient
//		private String likeList;


	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public void setRecipePostId(Long recipePostId) {
		this.recipePostId = recipePostId;
	}

	@Override
	public String toString() {
		return "MemberLikeRecipe{" +
		        "customerId=" + customerId +
		        ", recipePostId='" + recipePostId + '\'' +
		        '}';
		  }
	

//	public String getLikeList() {
//		return likeList;
//	}
//
//	public void setLikeList(String likeList) {
//		this.likeList = likeList;
//	}

	public MemberLikeRecipe() {
	}

}
