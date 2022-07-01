package com.foodmarket.app.blog.dto;

import java.io.Serializable;
import com.fasterxml.jackson.annotation.JsonProperty;

public class RecipeDto implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@JsonProperty("jsonRe")
	private String jsonRecipe;

	public RecipeDto() {
	}
	
	public String getJsonRecipe() {
		return jsonRecipe;
	}
	
	public void setJsonRecipe(String jsonRecipe) {
		this.jsonRecipe = jsonRecipe;
	}

}