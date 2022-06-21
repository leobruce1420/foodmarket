package com.foodmarket.app.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;

import com.foodmarket.app.member.model.Member;

public interface MemberServiceInterface {
	
	public Map checkLogin(String mail, String password);
	
	public Member findByMailAndPassword(String mail, String password);
	
	public Member insertCustomer(Member member);
	
	public Page<Member> findByNamePageable(Integer pageNumber, String name);
	
	public Page<Member> findAllPageable(Integer pageNumber);
	
	public Member findById(Long Id);
	
	public Member findByMail(String mail);
	
	public Member findByAuthToken(String token);
	
	public Member findByChangePasswordToken(String token);
	
	public void deleteById (Long Id);
	
	public Member updateCustomer(Member member);

}
