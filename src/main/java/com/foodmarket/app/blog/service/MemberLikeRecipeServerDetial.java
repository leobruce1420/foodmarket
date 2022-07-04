package com.foodmarket.app.blog.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodmarket.app.blog.model.MemberLikeRecipe;
import com.foodmarket.app.blog.model.MemberLikeRecipeRepository;



@Transactional
@Service(value = "MemberLikeRecipeServer")
public class MemberLikeRecipeServerDetial implements MemberLikeRecipeServer{

	@Autowired
	private MemberLikeRecipeRepository memberLikeRecipeDao;
	


	@Override
	public int[] getAllLikeRecipeById(Object customerId) {
		var likeList = memberLikeRecipeDao.getAllLikeRecipeById(customerId);

		String likevaluestring = new String();
		for (int i=0; i<likeList.size(); i++){
			var likevalue = likeList.get(i).getRecipePostId();
				likevaluestring += likevalue+",";
		}
		likevaluestring = likevaluestring.substring(0, likevaluestring.length()-1);
		String[] values = likevaluestring.split(",");
        int[] intvalues = new int[values.length];
        for (int i = 0; i < values.length; i++) {
        	intvalues[i] = Integer.parseInt(values[i]);
        }
		return intvalues;
	}

	@Override
	public Object addLikeTimeByCustomer(Object customerId,Long recipePostId) {
		return memberLikeRecipeDao.save(customerId,recipePostId);
		
	}


	@Override
	public List<MemberLikeRecipe> findAllById(Iterable<Long> ids) {
		return null;
	}





	
	
}