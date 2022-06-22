package com.foodmarket.app.question.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="question")
public class Question {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="questionCategory")
	private String questionCategory;
	
	@Column(name="questionTitle")
	private String questionTitle;

	@Column(name="answer")
	private String answer;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getQuestionCategory() {
		return questionCategory;
	}

	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Question(Integer id, String questionCategory, String questionTitle, String answer) {
		super();
		this.id = id;
		this.questionCategory = questionCategory;
		this.questionTitle = questionTitle;
		this.answer = answer;
	}

	public Question() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", questionCategory=" + questionCategory + ", questionTitle=" + questionTitle
				+ ", answer=" + answer + "]";
	}
	
	

	
	}
	
	

