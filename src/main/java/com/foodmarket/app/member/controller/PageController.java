package com.foodmarket.app.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;

@Controller
public class PageController {
	
	@Autowired
	private MemberServiceInterface memberService;
	
	@GetMapping("/")
	public String homePage() {
		return "index";
	}
	
	@GetMapping("/member/test")
	public String tese() {
		return "member/authMail";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/signUp")
	public String signUp(Model m) {
		Member member = new Member();
		m.addAttribute("member", member);
		return "member/signUp";
	}
	
	@GetMapping("/toforgotPwd")
	public String forgotPwd() {
		return "member/forgotPwd/forgotPwd";
	}
	
	@GetMapping("/memberCenter/{id}")
	public String memberCenter(@PathVariable Long id, Model m, HttpSession session) {
		
		Long sessionUId = (Long) session.getAttribute("loginUserId");
		
		//判斷路徑的id跟登入中id是否一致(若不一致轉到首頁)(還想亂來啊
		if(sessionUId.equals(id)) {
			Member member = memberService.findById(id);		
			m.addAttribute("member", member);
			
			return "member/memberCenter";	
		}
		return "index";	
	}

}
