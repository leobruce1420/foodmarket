package com.foodmarket.app.blog.service;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.foodmarket.app.blog.model.MemberLikeRecipe;


@Repository
public interface MemberLikeRecipeServer {


	 List<MemberLikeRecipe> findAllById(Iterable<Long> ids);

	int[] getAllLikeRecipeById(Long customerId);

	Object addLikeTimeByCustomer(Long customerId,Long recipePostId);

}

