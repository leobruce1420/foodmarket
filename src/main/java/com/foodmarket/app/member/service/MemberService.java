package com.foodmarket.app.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.repository.MemberRepository;


@Service("MemberService")
@Transactional
public class MemberService implements MemberServiceInterface{
	
	@Autowired
	private MemberRepository memberDao;

	@Override
	public Map checkLogin(String mail, String password) {
		Map<String, String> errors = new HashMap<String, String>();
		
		if(mail != null || mail.length() > 0) {
			if(password != null || password.length() > 0) {
				Member member = memberDao.findByMailAndPassword(mail, password);
				
				if(member == null) {
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
	
	


}
