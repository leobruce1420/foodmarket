package com.foodmarket.app.blog.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodmarket.app.blog.model.Recipe;
import com.foodmarket.app.blog.model.RecipeRepository;

@Transactional
@Service(value = "recipeService")
public class RecipeService {
	
	@Autowired
	private RecipeRepository recipeDao;
	
	public Recipe save(Recipe recipe) {	
		recipeDao.save(recipe);
		return null;
	}
	
	public void insertRecipe(Recipe rec) {
		recipeDao.save(rec);
	}
	
//	public void updateRecipe(Recipe rec) {
//		recipeDao.(rec);
//	}
	
//	public WorkMessages getLastest() {
//		return messageDao.findFirstByOrderByAddedDesc();
//	}
	
	 public Page<Recipe>  findByViewPage(Integer pageNum) {
		  Pageable pgb = PageRequest.of(pageNum-1, 3, Sort.Direction.DESC, "modifiedDate");
		  
		  Page<Recipe> page = recipeDao.findAll(pgb);
		  
		  return page;
		 }
	 
	 public Page<Recipe>  findByViewPage2(Integer pageNum) {
		  Pageable pgb = PageRequest.of(pageNum-1, 3, Sort.Direction.DESC, "postLikeTime");
		  
		  Page<Recipe> page = recipeDao.findAll(pgb);
		  
		  return page;
		 }
	 
	 public Page<Recipe>  findBySearchPage(Integer pageNum) {
		 Pageable pgb = PageRequest.of(pageNum-1, 30, Sort.Direction.DESC, "modifiedDate");
		 
		 Page<Recipe> page = recipeDao.findAll(pgb);
		 
		 return page;
	 }
	 
	 public Page<Recipe>  findBySearchPageByType(Integer pageNum,String recipeType) {
		 Pageable pgb = PageRequest.of(pageNum-1, 30, Sort.Direction.DESC, "modifiedDate");
		 
		 Page<Recipe> page = recipeDao.findAllByType(recipeType, pgb);
		 
		 return page;
	 }
	 
	 public Page<Recipe>  findForMemberHouse(Integer pageNum,Object customerId) {
		 Pageable pgb = PageRequest.of(pageNum-1, 30, Sort.Direction.DESC, "modifiedDate");
		 
		 Page<Recipe> page = recipeDao.findAllByCustomerId(customerId, pgb);
		 
		 return page;
	 }
	 
	 public Page<Recipe> findByTagLike(Integer pageNum,String postTag) {
		 Pageable pgb = PageRequest.of(pageNum-1, 30, Sort.Direction.DESC, "recipePostId");
		 
		 Page<Recipe> page = recipeDao.findAllByTag("%"+postTag+"%", pgb);
		 
		 return page;
	 }
	 
	 public Page<Recipe>  findByBackPage(Integer pageNum) {
		 Pageable pgb = PageRequest.of(pageNum-1, 10, Sort.Direction.DESC, "recipePostId");
		 
		 Page<Recipe> page = recipeDao.findAll(pgb);
		 
		 return page;
	 }
	 
		public List<Recipe> getRecipeList() {
			return recipeDao.findAll();
		}
	 
	 public Integer postLikeTimeIncrease(Long recipePostId) {
		 Optional<Recipe> optional = recipeDao.findById(recipePostId);
		 if(optional.isPresent()) {
				return optional.get().getPostLikeTime()+1;
			}
			return null;
	 };

	 
	 public Integer postLikeTimeReduce(Long recipePostId) {
		 Optional<Recipe> optional = recipeDao.findById(recipePostId);
		 if(optional.isPresent()) {
				return optional.get().getPostLikeTime()-1;
			}
			return null;
	 };
	 

	public Recipe findById(Long recipePostId) {
		Optional<Recipe> optional = recipeDao.findById(recipePostId);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public Recipe findByType(String recipeType) {
		Optional<Recipe> optional = recipeDao.findByType(recipeType);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	public void deleteById(Long recipePostId) {
		recipeDao.deleteById(recipePostId);
	}
	
	public Recipe getRecipeById(Long recipePostId) {
		return recipeDao.findById(recipePostId).get();
	}

	public Page<Recipe> findByMemberPage(Integer pageNumber) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<Recipe> findLikeRecipeById(int[] likeList, Integer pageNum) {
		 Pageable pgb = PageRequest.of(pageNum-1, 10, Sort.Direction.DESC, "recipePostId");
		 
		 Page<Recipe> page = recipeDao.findLikeRecipeById(likeList,pgb);
		 
		 return page;

	}



	


}