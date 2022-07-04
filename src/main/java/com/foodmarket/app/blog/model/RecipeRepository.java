package com.foodmarket.app.blog.model;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;

@EnableJpaRepositories
public interface RecipeRepository extends JpaRepository<Recipe, Long>{
	
	
	@Query(value="select * from recipe_post where recipeType = :recipeType",nativeQuery = true)
	public Optional<Recipe> findByType(String recipeType);

	@Query(value="select * from recipe_post where recipeType = :recipeType",nativeQuery = true)
	public Page<Recipe> findAllByType(@Param("recipeType") String recipeType,Pageable pageNum);

	@Query(value = "select * from recipe_post where postTag like :postTag",nativeQuery = true)
	public Page<Recipe> findAllByTag(@Param("postTag") String postTag, Pageable pageNum);

	@Query(value = "select * from recipe_post where RecipePostId in (:likeList)" ,nativeQuery = true)
	public  Page<Recipe> findLikeRecipeById(@Param("likeList") int[] likeList, Pageable pgb);

	@Query(value = "select * from recipe_post where customerId = :customerId",nativeQuery = true)
	public Page<Recipe> findAllByCustomerId(Object customerId, Pageable pgb);
	

}
