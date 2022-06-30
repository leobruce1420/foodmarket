package com.foodmarket.app.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodmarket.app.member.model.Admin;
import com.foodmarket.app.member.repository.AdminRepository;
import com.foodmarket.app.member.util.Util;


@Service("AdminService")
@Transactional
public class AdminService implements AdninServiceInterface{
	
	@Autowired
	private AdminRepository adminDao;
	
	Util util = new Util();

	@Override
	public Map checkLogin(String name, String password) {
		Map<String, String> errors = new HashMap<String, String>();
		
		if(name != null || name.length() > 0) {
			if(password != null || password.length() > 0) {
				Admin admin = adminDao.findByNameAndPassword(name, password);
				if(admin == null) {
					errors.put("loginFail", "帳號或密碼錯誤，請再試一次");	
				}
			}else {
				errors.put("pswNotImput", "請輸入密碼");
			}
		}else {
			errors.put("mailNotImput", "請輸入電子信箱");
		}
		return errors;
	}
	
	@Override
	public Admin findByNameAndPassword(String name, String password) {
		Admin admin = adminDao.findByNameAndPassword(name, password);
		return admin;
	}
}
