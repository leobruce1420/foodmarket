package com.foodmarket.app.member.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.repository.MemberRepository;
import com.foodmarket.app.member.util.Util;


@Service("MemberService")
@Transactional
public class MemberService implements MemberServiceInterface{
	
	@Autowired
	private MemberRepository memberDao;
	
	Util util = new Util();

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
	
	@Override
	public Member findByMailAndPassword(String mail, String password) {
		Member member = memberDao.findByMailAndPassword(mail, password);
		return member;
	}
	
	//加密密碼並新增到資料庫
	@Override
	public Member insertCustomer(Member member) {
		Member memberCheck = memberDao.findByMail(member.getMail());
		member.setPassword(util.encryptString(member.getPassword()));
		
		if(memberCheck == null) {
			Member m = memberDao.save(member);
			return m;
		}
		
		return null;
		
	}

	@Override
	public void deleteById(Long Id) {
		memberDao.deleteById(Id);
	}

	@Override
	public Page<Member> findByNamePageable(Integer pageNumber, String name) {
		Pageable pgb = PageRequest.of(pageNumber-1, 5 ,Sort.Direction.ASC ,"customerName");
		Page<Member> mPage = memberDao.findByName(pgb,name);

		return mPage;
	}

	@Override
	public Page<Member> findAllPageable(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber-1, 5 ,Sort.Direction.ASC ,"customerId");
		Page<Member> mPage = memberDao.findAll(pgb);
		
		return mPage;
	}
	
	@Override
	public Member findById(Long Id) {
		Optional<Member> member = memberDao.findById(Id);
		if(member.isPresent()) {
			Member rsMember = member.get();
			return rsMember;
		}
		return null;
	}
	
	@Override
	public Member findByMail(String mail) {
		Member member = memberDao.findByMail(mail);
		return member;
	}
	
	@Override
	public Member findByAuthToken(String token) {
		Member member = memberDao.findByAuthToken(token);
		return member;
	}
	
	@Override
	public Member findByChangePasswordToken(String token) {
		Member member = memberDao.findByChangePasswordToken(token);
		return member;
	}

	@Override
	public Member updateCustomer(Member member) {
		member.setModifiedDate(new Date());
		Member m = memberDao.save(member);
		return m;
	}
	
	


}
