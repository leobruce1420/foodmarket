package com.foodmarket.app.question.controller;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class QuestionDto implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@JsonProperty("qus")
	private String question;
	
	public QuestionDto() {
		
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}
	
	
}
