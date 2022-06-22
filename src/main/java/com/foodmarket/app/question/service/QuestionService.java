package com.foodmarket.app.question.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodmarket.app.question.model.Question;
import com.foodmarket.app.question.model.QuestionRepository;


@Service
@Transactional
public class QuestionService implements QuestionServiceInterface {

	@Autowired
	private QuestionRepository questionDto;
	
	@Override
	public List<Question> findAll() {
		List<Question> allqus = questionDto.findAll();
		return allqus;
	}
	
	public void insertQuestion (Question qus) {
		questionDto.save(qus);
	}
	
	public Page<Question> findByPage(Integer PageNumber) {
		Pageable pgb = PageRequest.of(PageNumber-1, 5, Sort.Direction.ASC, "id");
		
		Page<Question> pageQuestion = questionDto.findAll(pgb);
		
		return pageQuestion;
	}
	
	public Question findById(Integer id) {
//		Optional<WorkMessages> findById = messageDao.findById(id);
		Optional<Question> findById = questionDto.findById(id);
		if(findById.isPresent()) {
			return findById.get();
		}
		return null;
	}
	
	public void deleteById(Integer id) {
		questionDto.deleteById(id);
	}
	
	public List<Question> findByQuestionTitle(String questionTitle){
		List<Question> findByName = questionDto.findByQuestionTitle(questionTitle);
		return findByName;
	}
	
//	@Override
//	public List<Question> findByQuestioncategory(String questioncategory) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
