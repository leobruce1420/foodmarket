package com.foodmarket.app.member.service;

import java.util.Map;

import com.foodmarket.app.member.model.Admin;

public interface AdninServiceInterface {
	
	public Map checkLogin(String name, String password);
	
	public Admin findByNameAndPassword(String name, String password);

}
