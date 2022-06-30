package com.foodmarket.app.blog.model;


import java.util.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodmarket.app.member.model.Member;

@Entity(name="RrecipeEntity")
@Table(name="recipe_post")
public class Recipe {
	
	@Id @Column(name="RecipePostId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long recipePostId;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="CustomerId")
	private Member member;
	
	@Column(name="PostTitle",columnDefinition = "nvarchar(100)")
	private String postTitle;
	
	@Column(name="PostText",columnDefinition = "nvarchar(max)")
	private String postText;
	
	@Column(name="PostTag",columnDefinition = "nvarchar(500)")
	private String postTag;
	
	@Column(name="PostLikeTime")
	private Integer postLikeTime;
	
	@Column(name="PostImage",columnDefinition = "nvarchar(max)")
	private String postImage;
	
	@Column(name="CookTime")
	private String cookTime;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ModifiedDate",columnDefinition = "datetime") 
	private Date modifiedDate;
	
	@PrePersist
	private void onCreat() {
		modifiedDate = new Date();
	}
	
	@Column(name="Serving")
	private Integer serving; 
	
	@Column(name="Ingredients",columnDefinition = "nvarchar(max)")
	private String ingredients;
	
//	private List<Recipe> managerInsert;
	
//	public
//	List<Recipe> managerInsert = new ArrayList<Recipe>();
//	model.addAttribute("managerInsert",managerInsert);
//	return "savePersons";
	
	public Recipe() {
	}

	public Long getRecipePostId() {
		return recipePostId;
	}

	public void setRecipePostId(Long recipePostId) {
		this.recipePostId = recipePostId;
	}

	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostText() {
		return postText;
	}

	public void setPostText(String postText) {
		this.postText = postText;
	}

	public String getPostTag() {
		return postTag;
	}

	public void setPostTag(String postTag) {
		this.postTag = postTag;
	}

	public Integer getPostLikeTime() {
		return postLikeTime;
	}

	public void setPostLikeTime(Integer postLikeTime) {
		this.postLikeTime = postLikeTime;
	}

	public String getPostImage() {
		return postImage;
	}

	public void setPostImage(String postImage) {
		this.postImage = postImage;
	}

	public String getCookTime() {
		return cookTime;
	}

	public void setCookTime(String cookTime) {
		this.cookTime = cookTime;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public Integer getServing() {
		return serving;
	}

	public void setServing(Integer serving) {
		this.serving = serving;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	@Override
	public String toString() {
		return "Recipe [customerId=" + member.getCustomerId() + ", postTitle=" + postTitle + ", postText=" + postText + ", postTag="
				+ postTag + ", postLikeTime=" + postLikeTime + ", postImage=" + postImage + ", cookTime=" + cookTime
				+ ", modifiedDate=" + modifiedDate + ", serving=" + serving + ", ingredients=" + ingredients + "]";
	}

//	@Override
//	public String toString() {
//		return "Recipe [CustomerId=" + CustomerId + ", PostTypeId=" + PostTypeId + ", PostTitle=" + PostTitle
//				+ ", PostText=" + PostText + ", PostTag=" + PostTag + ", PostLikeTime=" + PostLikeTime + ", PostImage="
//				+ PostImage + ", CookTime=" + CookTime + ", ModifiedDate=" + ModifiedDate + "]";
//	}

//	public List<Recipe> getManagerInsert() {
//		return managerInsert;
//	}
//
//	public void setManagerInsert(List<Recipe> managerInsert) {
//		this.managerInsert = managerInsert;
//	}
	
	

}
