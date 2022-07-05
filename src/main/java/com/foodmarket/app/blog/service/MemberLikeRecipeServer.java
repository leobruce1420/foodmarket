package com.foodmarket.app.blog.service;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.foodmarket.app.blog.model.MemberLikeRecipe;


@Repository
public interface MemberLikeRecipeServer {


	 List<MemberLikeRecipe> findAllById(Iterable<Long> ids);

	int[] getAllLikeRecipeById(Object customerId);

	Object addLikeTimeByCustomer(Object customerId,Long recipePostId);



	MemberLikeRecipe saveYourLikeRecipe(Object customerId, Long recipePostId);

	void testSaveYourLikeRecipe(MemberLikeRecipe mlr);

	void testDeleteYourLikeRecipe(Long customerId, Long recipePostId);
	

}

