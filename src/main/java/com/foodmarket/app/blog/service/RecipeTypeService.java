package com.foodmarket.app.blog.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Repository;

import com.foodmarket.app.blog.model.RecipeType;

@Repository
public interface RecipeTypeService {
	List<RecipeType> getAllRecipeType();
	RecipeType getRecipeType(Integer recipeTypeId);
	Page<RecipeType> findByPage(Integer pageNum);
}
