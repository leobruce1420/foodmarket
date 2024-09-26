package com.foodmarket.app.blog.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface RecipeTypeRepository extends JpaRepository<RecipeType, Integer>{

	@Query(value="select * from recipe_type",nativeQuery = true)
	public List<RecipeType> getAllRecipeType();

	@Query(value="select * from recipe_type where recipeTypeId = :recipeTypeId",nativeQuery = true)
	RecipeType getRecipeType(Integer recipeTypeId);

	
}
