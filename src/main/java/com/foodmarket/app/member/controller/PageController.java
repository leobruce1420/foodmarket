package com.foodmarket.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PageController {
	
	@GetMapping("/")
	public String homePage() {
		return "index";
	}
	
	@GetMapping("/member/test")
	public String tese() {
		return "member/test";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/adminLogin")
	public String adminLogin() {
		return "member/adminLogin";
	}

}
