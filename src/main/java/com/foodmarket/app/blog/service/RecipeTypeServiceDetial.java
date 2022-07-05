package com.foodmarket.app.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.foodmarket.app.blog.model.RecipeType;
import com.foodmarket.app.blog.model.RecipeTypeRepository;

@Transactional
@Service(value = "recipeTypeService")
public class RecipeTypeServiceDetial implements RecipeTypeService{
	
	@Autowired
	private RecipeTypeRepository recipeTypeDao;

	@Override
	public List<RecipeType> getAllRecipeType() {
		return recipeTypeDao.getAllRecipeType();
	}

	@Override
	public RecipeType getRecipeType(Integer recipeTypeId) {
		return recipeTypeDao.getRecipeType(recipeTypeId);
	}
	
	
	@Override
	 public Page<RecipeType>  findByPage(Integer pageNum) {
		 Pageable pgb = PageRequest.of(pageNum-1, 20, Sort.Direction.ASC, "recipeTypeId");
		 
		 Page<RecipeType> page = recipeTypeDao.findAll(pgb);
		 
		 return page;
	 }

	
//CategoryRepository categoryDao;
//	
//	@Autowired
//	public CategoryServiceImpl(CategoryRepository categoryDao) {
//		this.categoryDao = categoryDao;
//	}
//
//	@Override
//	public List<Category> getAllCategories() {
//		return categoryDao.getAllCategories();
//	}
//
//	@Override
//	public Category getCategory(Integer id) {
//		return categoryDao.getCategory(id);
//	}
}
