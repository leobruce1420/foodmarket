package com.foodmarket.app.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.foodmarket.app.member.model.Member;

@Controller
public class PageController {
	
	@GetMapping("/")
	public String homePage() {
		return "index";
	}
	
	@GetMapping("/lock/test")
	public String tese() {
		return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUserId");
		session.removeAttribute("loginUserName");
		return "index";
	}
	
	@GetMapping("/signUp")
	public String signUp(Model m) {
		Member member = new Member();
		m.addAttribute("member", member);
		return "member/signUp";
	}

}
