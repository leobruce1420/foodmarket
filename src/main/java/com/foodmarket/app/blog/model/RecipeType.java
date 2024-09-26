package com.foodmarket.app.blog.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="RecipeTypeEntity")
@Table(name="recipe_type")
public class RecipeType {

	
		@Id @Column(name="RecipeTypeId")
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer recipeTypeId;
		
		@Column(name="RecipeTypeTitle",columnDefinition = "nvarchar(100)")
		private String recipeTypeTitle;
		
		@Column(name="RecipeTypeImg",columnDefinition = "nvarchar(max)")
		private String recipeTypeImg;
		
		@Column(name="RecipeTypeText",columnDefinition = "nvarchar(200)")
		private String recipeTypeText;
		
		public Integer getRecipeTypeId() {
			return recipeTypeId;
		}


		public void setRecipeTypeId(Integer recipeTypeId) {
			this.recipeTypeId = recipeTypeId;
		}


		public String getRecipeTypeTitle() {
			return recipeTypeTitle;
		}


		public void setRecipeTypeTitle(String recipeTypeTitle) {
			this.recipeTypeTitle = recipeTypeTitle;
		}


		public String getRecipeTypeImg() {
			return recipeTypeImg;
		}


		public void setRecipeTypeImg(String recipeTypeImg) {
			this.recipeTypeImg = recipeTypeImg;
		}


		public String getRecipeTypeText() {
			return recipeTypeText;
		}


		public void setRecipeTypeText(String recipeTypeText) {
			this.recipeTypeText = recipeTypeText;
		}


		
		
	public RecipeType() {
	}

}
