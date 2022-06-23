package com.foodmarket.app.question.service;

import java.util.List;

import com.foodmarket.app.question.model.Question;

public interface QuestionServiceInterface {

	public List<Question> findAll();
	
//	public List<Question> findByQuestioncategory(String questioncategory);
}
