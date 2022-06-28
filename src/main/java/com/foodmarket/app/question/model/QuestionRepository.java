package com.foodmarket.app.question.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface QuestionRepository extends JpaRepository<Question, Integer> {

	public List<Question> findAll();
	
	public List<Question> findByquestionCategory(String questionCategory);
	
	@Query(value = "select * from question where questionTitle like :questionTitle", nativeQuery=true)
	public List<Question> findByQuestionTitle(@Param(value="questionTitle")String questionTitle);
}
