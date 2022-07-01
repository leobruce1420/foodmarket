package com.foodmarket.app.blog.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;

@EnableJpaRepositories
public interface MemberLikeRecipeRepository extends JpaRepository<MemberLikeRecipe, Long>{

	@Query(value="select * from customer_like_recipe where customerId = :customerId",nativeQuery = true) 
	public List<MemberLikeRecipe> getAllLikeRecipeById(@Param("customerId") Long customerId);

	@Query(value="SELECT customer_like_recipe.CustomerId, recipe_post.postTitle　FROM customer_like_recipe　RIGHT JOIN recipe_post　ON customer_like_recipe.CustomerId=recipe_post.recipePostId　where recipe_post.recipePostId=:customerId;",nativeQuery = true) 
	public Page<MemberLikeRecipe> findLikeRecipeById(Pageable pgb, @Param("customerId") Long customerId);

	@Query(value="insert into customer_like_recipe (recipePostId, customerId) values(:recipePostId, :customerId)",nativeQuery = true)
	public void insert(Long customerId, Long recipePostId);

	@Query(value="insert into customer_like_recipe (recipePostId, customerId) values(:recipePostId, :customerId)",nativeQuery = true)
	public Object save(Long customerId, Long recipePostId);



	

	
}
